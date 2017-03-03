class AddCodeToChallenges < ActiveRecord::Migration[5.0]
  def change
    add_column :challenges, :code, :text
  end
end
