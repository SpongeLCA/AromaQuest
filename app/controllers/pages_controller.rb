class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def home
  end

  def dashboard
    @popular_perfume = Perfume.joins(:results).group('perfumes.id').order('count(results.id) DESC').first
  end

  def favorites
    @favorites = current_user.favorite_perfumes
  end

  def infos
    @infos = current_user
  end

  def results
    @results = current_user.results
  end
end
