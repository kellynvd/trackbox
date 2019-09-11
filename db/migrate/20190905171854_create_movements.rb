# frozen_string_literal: true

class CreateMovements < ActiveRecord::Migration[5.2]
  def change
    create_table :movements do |t|
      t.string :name, null: false

      t.index :name, unique: true

      t.timestamps
    end
  end
end
