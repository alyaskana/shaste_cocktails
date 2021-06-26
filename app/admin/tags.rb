ActiveAdmin.register Tag do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :tag_type
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :tag_type]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  
  index do
    selectable_column
    column :id
    column :name
    column :tag_type
    column :created_at

    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :tag_type
      row :updated_at
      row :created_at
    end
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      input :name
      input :tag_type
    end  
    f.actions
  end
end
