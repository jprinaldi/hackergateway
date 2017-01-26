class CreateChallenges < ActiveRecord::Migration[5.0]
  def change
    create_table :challenges do |t|
      t.string :name
      t.text :body
      t.string :answer
      t.references :category, foreign_key: true
      t.string :slug

      t.timestamps
    end
    add_index :challenges, :name, unique: true
    add_index :challenges, :slug, unique: true
  end
end
