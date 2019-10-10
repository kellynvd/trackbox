# frozen_string_literal: true

class CreatePersonalRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :personal_records do |t|
      t.belongs_to(:movement, foreign_key: true, null: false)
      t.date :date, null: false
      t.decimal :weight, null: false

      t.index(%i[date movement_id], unique: true)

      t.timestamps
    end
  end
end
