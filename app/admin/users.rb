ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :fname
      f.input :lname
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :picture, as: :file
    end
    f.actions
  end
end
