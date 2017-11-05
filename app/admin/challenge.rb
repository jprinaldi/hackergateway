# frozen_string_literal: true

ActiveAdmin.register Challenge do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  includes :category

  permit_params :category_id, :name, :body, :answer, :code

  form do |f|
    f.inputs do
      f.input :category
      f.input :name
      f.input :body
      f.input :answer
      f.input :code
    end
    f.actions
  end

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end
end
