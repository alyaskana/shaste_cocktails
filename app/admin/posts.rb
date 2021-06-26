ActiveAdmin.register Post do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :user_id, :parent_id, :image, :content, :cocktail_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :parent_id, :image, :content, :cocktail_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  

  index do
    selectable_column
    column :id
    column :user
    column :cocktail
    column :content
    column :image do |user|
      image_tag user.image.url(:thumb)
    end
    column :created_at

    actions
  end

  show do
    attributes_table do
      row :id
      row :user
      row :cocktail
      row :content
      row :image do |ad|
        image_tag ad.image.url(:thumb)
      end
      row :updated_at
      row :created_at
    end
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      input :user
      input :cocktail
      input :content
      input :image, :hint => image_tag(f.object.image.url(:thumb))
    end  
    f.actions
  end
end
