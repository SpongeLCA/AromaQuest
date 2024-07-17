# app/controllers/results_controller.rb
class ResultsController < ApplicationController
  before_action :authenticate_user!

  def new
    @result = Result.new
  end

  def create
    @result = current_user.Result.build(result_params)
    if @result.save
      redirect_to results_path, notice: 'Résultats enregistrés avec succès'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @results = current_user.results
  end

  def show
    @result = Result.find(params[:id])
    @perfumes = Perfume.all

    # Filtrer par genre
    if ["Femme", "Homme"].include?(@result.answer_2)
      @perfumes_genre = @perfumes.where(genre: @result.answer_2)
    else
      @perfumes_genre = @perfumes
    end

     # Filtrer par intensité
    case @result.answer_3
    when "Ne passe pas inaperçu"
      @perfumes_intensity = @perfumes_genre.where(intensity: 3..5)
    when "Est plutôt intime, juste pour vous"
      @perfumes_intensity = @perfumes_genre.where(intensity: 1..3)
    end

    # Filtrer par période
    case @result.answer_4
    when "Journée", "Soirée"
      @perfumes_period = @perfumes_intensity.where(period: @result.answer_4)
    else
      @perfumes_period = @perfumes_intensity
    end

    # Filtrer par season
    case @result.answer_5
    when "Hiver"
      @perfumes_season = @perfumes_period.where(season: @result.answer_5)
    when "Eté"
      @perfumes_season = @perfumes_period.where(season: @result.answer_5)
    else
      @perfumes_season = @perfumes_period
    end

    # Filtrer par price
    # case answer_6
    # when
    # end

    # Filtrer par situations
    case @result.answer_7
    when "un weekend intense"
      @perfumes_situations = @perfumes_season.where(situations: @result.answer_7)
    when "un déjeuner entre amis"
      @perfumes_situations = @perfumes_season.where(situations: @result.answer_7)
    when "un moment cocooning"
      @perfumes_situations = @perfumes_season.where(situations: @result.answer_7)
    else
      @perfumes_situations = @perfumes_season
    end

    # Filtrer par smells
    answer_8_array = @result.answer_8.split(" ")
    case answer_8_array[0]
    when "des embruns rafraichissants"
      @perfumes_smell = @perfumes_situations.where(smell: @result.answer_8)
    when "un bouquet d’herbes et d’aromates"
      @perfumes_smell = @perfumes_situations.where(smell: @result.answer_8)
    when "un bouquet de fleurs"
      @perfumes_smell = @perfumes_situations.where(smell: @result.answer_8)
    when "un cocktail intense et puissant"
      @perfumes_smell = @perfumes_situations.where(smell: @result.answer_8)
    when "un fruit frais ou sucre"
      @perfumes_smell = @perfumes_situations.where(smell: @result.answer_8)
    when "un dessert très gourmand"
      @perfumes_smell = @perfumes_situations.where(smell: @result.answer_8)
    when "un jus d’agrumes vitamine"
      @perfumes_smell = @perfumes_situations.where(smell: @result.answer_8)
    when "une balade en forêt"
      @perfumes_smell = @perfumes_situations.where(smell: @result.answer_8)
    when "un souvenir de vacances épicé"
      @perfumes_smell = @perfumes_situations.where(smell: @result.answer_8)
    when "un lait doux et vanille"
      @perfumes_smell = @perfumes_situations.where(smell: @result.answer_8)
    else
      @perfumes_smell = @perfumes_situations
    end

    @perfumes_count = @perfumes.count


  end

  private

  def result_params
    params.require(:result).permit(:name, :description, :answer_1, :answer_2, :answer_3, :answer_4, :answer_5, :answer_6, :answer_7, :answer_8, :answer_9, :answer_10)
  end
end
