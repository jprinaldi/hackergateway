# frozen_string_literal: true

class AddCodeToChallenges < ActiveRecord::Migration[5.0]
  def change
    add_column :challenges, :code, :text
  end
end
