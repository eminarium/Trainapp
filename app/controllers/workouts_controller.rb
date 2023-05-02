class WorkoutsController < ApplicationController

  before_action :set_workout, only: %i[show edit update destroy]
  before_action :set_categories_collection, only: %i[new edit create update]

  def index
    @workouts = Workout.all
  end

  def new
    @workout = Workout.new
  end

  def edit
  end

  def show
    @exercises = @workout.exercises
  end

  def create
    @workout = Workout.new(workout_params)

    respond_to do |format|
      if @workout.save
        format.html { redirect_to workout_url(@workout), notice: "Workout was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @workout.update(workout_params)
        format.html { redirect_to workout_url(@workout), notice: "Workout was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @workout.destroy

    respond_to do |format|
      format.html { redirect_to workouts_url, notice: "Workout was successfully deleted." }
    end
  end

  private

  def set_workout
    @workout = Workout.find(params[:id])
  end

  def set_categories_collection
    @categories = Category.all
  end

  def workout_params
    params.require(:workout).permit(:name, :category_id, :level, :description)
  end
end
