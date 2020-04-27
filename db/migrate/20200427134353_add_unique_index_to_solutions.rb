class AddUniqueIndexToSolutions < ActiveRecord::Migration[6.0]
  def change
    add_index :solutions, [:user_id, :challenge_id], unique: true
  end
end
