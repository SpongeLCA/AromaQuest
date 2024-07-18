class FavoritesController < ApplicationController
  before_action :authenticate_user!



  def create
<<<<<<< HEAD
    @favorite = Favorite.new(perfume_id: params[:perfume_id])
    @favorite.user_id = current_user.id
=======
    @favorite = current_user.favorites.build(perfume_id: params[:perfume_id])
>>>>>>> 9e135dc5c6e089955276348d6574c40509d2e747
    if @favorite.save
      redirect_to favorites_dashboard_path, notice: 'Ajouté aux favoris'
    else
      redirect_to perfumes_path, alert: 'Impossible de rajouter aux favoris'
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @perfume = @favorite.perfume_id
    @favorite.destroy
    if @favorite
      redirect_to favorites_dashboard_path, notice: 'Supprimé des favoris'
    else
      redirect_to favorites_dashboard_path, alert: 'Favori introuvable'
    end
  end
end
