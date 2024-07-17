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
  end

  private

  def result_params
    params.require(:result).permit(:name, :description, :answer_1, :answer_2, :answer_3, :answer_4, :answer_5, :answer_6, :answer_7, :answer_8, :answer_9, :answer_10)
  end
end
