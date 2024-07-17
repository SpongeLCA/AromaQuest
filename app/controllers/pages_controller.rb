class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def home
  end

  def dashboard
    @favorites = current_user.favorite_perfumes
    @results = current_user.results
    @popular_perfume = Perfume.joins(:results).group('perfumes.id').order('count(results.id) DESC').first
  end

  def favorites
    @favorites = current_user.favorite_perfumes
  end

  def infosperso
    # Logique pour les informations personnelles
  end

  def myresults
    @results = current_user.results
  end
end
