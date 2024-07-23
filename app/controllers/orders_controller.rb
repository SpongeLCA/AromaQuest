class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show]
  before_action :set_locale, only: [:show, :index]

  def create
    @order = current_user.orders.build
    @order.status = 'pending'
    @order.total = calculate_total

    if @order.save
      current_user.cart.cart_items.each do |cart_item|
        @order.order_items.create(perfume: cart_item.perfume, quantity: cart_item.quantity, price: cart_item.perfume.price)
      end
      current_user.cart.cart_items.destroy_all
      redirect_to @order, notice: 'Votre commande a été passée avec succès.'
    else
      redirect_to cart_path, alert: 'Impossible de passer la commande.'
    end
  end

  def show
  end

  def index
    @orders = current_user.orders
  end

  private

  def set_order
    @order = current_user.orders.find(params[:id])
  end

  def calculate_total
    current_user.cart.cart_items.sum { |item| item.quantity * item.perfume.price }
  end

  private

  def set_locale
    I18n.locale = :fr
  end
end
