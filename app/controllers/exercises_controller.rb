class ExercisesController < ApplicationController

  before_action :set_exercise, only: %i[show edit update destroy]
  before_action :set_categories_collection, only: %i[new edit create update]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @exercises = Exercise.includes(:category)
  end

  def show
  end

  def new
    @exercise = Exercise.new
  end

  def edit
  end

  def create
    @exercise = Exercise.new(exercise_params)
    
    respond_to do |format|
      if @exercise.save
        format.html { redirect_to exercise_url(@exercise), notice: "Exercise was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @exercise.update(exercise_params)
        format.html { redirect_to exercise_url(@exercise), notice: "Exercise was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @exercise.destroy

    respond_to do |format|
      format.html { redirect_to exercises_url, notice: "Exercise was successfully deleted." }
    end
  end

  private

  def set_exercise
    @exercise = Exercise.find(params[:id])
  end

  def set_categories_collection
    @categories = Category.all
  end

  def exercise_params
    params.require(:exercise).permit(:name, :category_id, :description)
  end
end
