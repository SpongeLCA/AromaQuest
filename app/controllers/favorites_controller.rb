class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @favorite = current_user.favorites.build(perfume_id: params[:perfume_id])
    if @favorite.save
      redirect_to dashboard_path, notice: 'Ajouté aux favoris'
    else
      redirect_to perfumes_path, alert: 'Impossible de rajouter aux favoris'
    end
  end
end
