# frozen_string_literal: true

class Movement < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
