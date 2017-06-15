ActiveAdmin.register User do

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
#
  index do
    selectable_column
    column :email
    column :firstname
    column :lastname
    column :address
    column :mobil_phone
    column :birth_date
    column :newsletter
    column :loyalty
    column :last_sign_in_at
    column :created_at
  end


end
