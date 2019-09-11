# frozen_string_literal: true

class MovementsController < ApplicationController
  before_action :current_movement, only: %i[show edit update destroy]

  def index
    @movements = Movement.all
  end

  def show
  end

  def new
    @movement = Movement.new
  end

  def create
    @movement = Movement.new(movement_params)

    if @movement.save
      redirect_to @movement
    else
      render :new
    end
  end

  def edit
  end

  def update
    @movement.update(movement_params)

    redirect_to @movement
  end

  def destroy
    @movement.destroy

    redirect_to movements_path
  end

  private

  def movement_params
    params.require(:movement).permit(:name)
  end

  def current_movement
    @movement = Movement.find(params[:id])
  end
end
