class CreateChallenges < ActiveRecord::Migration[5.0]
  def change
    create_table :challenges do |t|
      t.string :name
      t.text :body
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
