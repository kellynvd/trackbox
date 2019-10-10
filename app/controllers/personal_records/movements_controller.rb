# frozen_string_literal: true

module PersonalRecords
  class MovementsController < ApplicationController
    before_action :authenticate_user!

    def index
      @movements = Movement.all
    end
  end
end
