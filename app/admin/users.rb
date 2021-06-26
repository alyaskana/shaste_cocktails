ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :login, :user_name, :avatar, :email, :description, :link
  #
  # or
  #
  # permit_params do
  #   permitted = [:login, :user_name, :avatar, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :description, :link]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  index do
    selectable_column
    column :id
    column :avatar do |user|
      image_tag user.avatar.url(:thumb)
    end
    column :login
    column :user_name
    column :email
    column :created_at

    actions
  end

  show do
    attributes_table do
      row :id
      row :avatar do |ad|
        image_tag ad.avatar.url(:thumb)
      end
      row :login
      row :user_name
      row :email
      row :created_at
    end
  end

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs do
      input :avatar, :hint => image_tag(f.object.avatar.url(:thumb))
      input :login
      input :user_name
      input :email
      input :link
      input :description
    end        # builds an input field for every attribute
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end
end