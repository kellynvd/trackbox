# frozen_string_literal: true

class AddUserIdToPersonalRecords < ActiveRecord::Migration[5.2]
  def change
    add_column(:personal_records, :user_id, :bigint, null: false, after: :id)
    add_foreign_key(:personal_records, :users)
    remove_index(:personal_records, column: %i[date movement_id])
    add_index(:personal_records, %i[user_id movement_id date], unique: true)
  end
end
