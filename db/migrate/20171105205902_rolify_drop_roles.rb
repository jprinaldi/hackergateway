# frozen_string_literal: true

class RolifyDropRoles < ActiveRecord::Migration[5.1]
  def change
    remove_index(:roles, :name)
    remove_index(:roles, column: %i[name resource_type resource_id])
    remove_index(:users_roles, column: %i[user_id role_id])

    drop_table(:roles) do |t|
      t.string :name
      t.references :resource, polymorphic: true

      t.timestamps
    end

    drop_table(:users_roles, id: false) do |t|
      t.references :user
      t.references :role
    end
  end
end
