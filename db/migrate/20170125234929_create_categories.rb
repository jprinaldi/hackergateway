# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :challenges_count, default: 0
      t.string :slug

      t.timestamps
    end
    add_index :categories, :name, unique: true
    add_index :categories, :slug, unique: true
  end
end
