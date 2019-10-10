# frozen_string_literal: true

class PersonalRecord < ApplicationRecord
  validates_uniqueness_of :date, scope: %i[user_id movement_id]
  belongs_to :movement
  belongs_to :user

  scope :newest, lambda {
    where(%(
      personal_records.date = (
        SELECT MAX(date) FROM personal_records pr
        WHERE pr.movement_id = personal_records.movement_id
      )
    ))
  }
end
