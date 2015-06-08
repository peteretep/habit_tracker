class HabitsController < ApplicationController
  before_action :set_habit, only: [:show, :update, :destroy, :fail, :add_one]

  # GET /habits
  # GET /habits.json
  def index
    @habits = Habit.all

    render json: @habits
  end

  # GET /habits/1
  # GET /habits/1.json
  def show
    render json: @habit
  end

  # POST /habits
  # POST /habits.json
  def create
    @habit = Habit.new(habit_params)

    if @habit.save
      render json: @habit, status: :created, location: @habit
    else
      render json: @habit.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /habits/1/add_one
  # PATCH/PUT /habits/1/add_one.json
  def add_one
    @habit.streak = @habit.streak + 1
    render json: @habit, location: @habit if @habit.save
  end

  # PATCH/PUT /habits/1/fail
  # PATCH/PUT /habits/1/fail.json
  def fail
    @habit.streak = 0
    render json: @habit, location: @habit if @habit.save
  end

  # PATCH/PUT /habits/1
  # PATCH/PUT /habits/1.json
  def update
    @habit = Habit.find(params[:id])

    if @habit.update(habit_params)
      head :no_content
    else
      render json: @habit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /habits/1
  # DELETE /habits/1.json
  def destroy
    @habit.destroy

    head :no_content
  end

  private

  def set_habit
    @habit = Habit.find(params[:id])
  end

  def habit_params
    params.require(:habit).permit(:name, :streak)
  end
end
