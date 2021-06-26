ActiveAdmin.register Ingredient do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :image, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  

  index do
    selectable_column
    column :id
    column :name
    column :created_at

    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :updated_at
      row :created_at
    end
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      input :name
    end  
    f.actions
  end
end
