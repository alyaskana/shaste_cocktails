ActiveAdmin.register Cocktail do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :user_id, :title, :image, :description, :directions, :youtube
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :title, :image, :description, :directions, :youtube]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  index do
    selectable_column
    column :id
    column :user
    column :title
    column :image do |cocktail|
      image_tag cocktail.image.url(:thumb)
    end
    column :ingredients
    column :tags
    column :likes_count do |cocktail|
      cocktail.liked_users.count
    end
    column :tastes_count do |cocktail|
      cocktail.tasted_users.count
    end
    column :favorites_count do |cocktail|
      cocktail.favorited_users.count
    end
    column :created_at

    actions
  end

  show do
    attributes_table do
      row :id
      row :user
      row :title
      row :image do |ad|
        image_tag ad.image.url(:thumb)
      end
      row :description
      row :directions
      row :tags
      row :youtube
      row :updated_at
      row :likes_count do |cocktail|
        cocktail.liked_users.count
      end
      row :tastes_count do |cocktail|
        cocktail.tasted_users.count
      end
      row :favorites_count do |cocktail|
        cocktail.favorited_users.count
      end
      row :updated_at
      row :created_at
    end
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      input :user
      input :title
      input :image, :hint => image_tag(f.object.image.url(:thumb))
      input :description, input_html: { rows: 5}
      input :tags
      input :youtube
    end  
    f.actions
  end
end
