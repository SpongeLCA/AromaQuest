class PerfumesController < ApplicationController
  def index
    @perfumes = Perfume.all

    if params[:intensity].present?
      @perfumes = @perfumes.where(intensity: params[:intensity])
    end

    if params[:heart_notes].present?
      @perfumes = @perfumes.joins(:notes).where(notes: { coeur: params[:heart_notes] })
    end

    if params[:head_notes].present?
      @perfumes = @perfumes.joins(:notes).where(notes: { tete: params[:head_notes] })
    end

    if params[:base_notes].present?
      @perfumes = @perfumes.joins(:notes).where(notes: { fond: params[:base_notes] })
    end

    case params[:sort]
    when 'price_asc'
      @perfumes = @perfumes.order(price: :asc)
    when 'price_desc'
      @perfumes = @perfumes.order(price: :desc)
    else
      @perfumes = @perfumes.order(created_at: :desc)
    end
  end

  def show
    @perfume = Perfume.find(params[:id])
  end
end
