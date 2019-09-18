# frozen_string_literal: true

module PersonalRecords
  class MovementsController < ApplicationController
    def index
      @movements = Movement.all
    end
  end
end
