# frozen_string_literal: true

class PersonalRecordsController < ApplicationController
  before_action :current_personal_record, only: %i[show edit update destroy]

  def index
    @personal_records =
      PersonalRecord.newest.includes(:movement).order('movements.name')
  end

  def show
    @personal_records = PersonalRecord.where(
      movement: @personal_record.movement
    ).order(date: :desc)
  end

  def new
    @personal_record = PersonalRecord.new
    @personal_record.movement_id = personal_record_params[:movement_id]
  end

  def create
    @personal_record = PersonalRecord.new(personal_record_params)

    if @personal_record.save
      redirect_to @personal_record
    else
      render :new
    end
  end

  def destroy
    @personal_record.destroy

    redirect_to personal_records_path
  end

  private

  def personal_record_params
    params.require(:personal_record).permit(:movement_id, :date, :weight)
  end

  def current_personal_record
    @personal_record = PersonalRecord.find(params[:id])
  end
end
