# frozen_string_literal: true

ActiveAdmin.register Product do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description, :price, :category_id, :photo
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :price, :image, :category_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    column :id
    active_admin_config.resource_columns.each do |attribute|
      case attribute
      when :description
        column attribute do |body|
          body.description.truncate 100
        end
      when :image 
        column attribute do |x| 
          Product.find(x.id).photo.present? ? image_tag(Product.find(x.id).photo, size: '50x50') : image_tag('plug.jpg', size: '50x50')
        end
      when :price
        column attribute do |price_tag|
          number_to_currency(price_tag.price)
        end
      else
        column attribute
      end
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :price do |price_tag|
        number_to_currency(price_tag.price)
      end
      row :image do |x|
        x.photo.present? ? image_tag(x.photo, size: '50x50') : image_tag('plug.jpg', size: '50x50')
      end
      row :category
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :price
      f.input :category_id
      f.input :photo, as: :file
    end
    f.actions
  end
end
