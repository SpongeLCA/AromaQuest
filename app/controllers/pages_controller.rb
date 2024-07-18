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

<<<<<<< HEAD
  def infos
    @infos = current_user
  end

  def results
    @results = current_user.results
  end
=======
  def infosperso
  end

  def myresults
    @results = current_user.results
  end

  def apropos
  end
>>>>>>> 9e135dc5c6e089955276348d6574c40509d2e747
end
