# frozen_string_literal: true

class PersonalRecord < ApplicationRecord
  validates_uniqueness_of :date, scope: :movement_id
  belongs_to :movement

  scope :newest, lambda {
    where(%(
      personal_records.date = (
        SELECT MAX(date) FROM personal_records pr
        WHERE pr.movement_id = personal_records.movement_id
      )
    ))
  }
end
