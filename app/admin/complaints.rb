ActiveAdmin.register Complaint do
  remove_filter :picture
  permit_params do
    permitted = [:description, :address, :comp_type, :state, :picture, :is_seen, :user_id]
    permitted << :other if params[:action] == "create" && current_user.admin?
    permitted
  end

  form do |f|
    f.inputs do
      f.input :state
    end
    f.actions
  end
end
