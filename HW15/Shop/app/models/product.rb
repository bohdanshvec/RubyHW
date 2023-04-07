# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  description :text
#  image       :string
#  name        :string
#  price       :decimal(8, 2)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#
# Indexes
#
#  index_products_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
class Product < ApplicationRecord
  belongs_to :category
  has_many :line_items, dependent: :nullify
  has_one_attached :photo do |attachable|
    attachable.variant :thumb, resize_to_limit: [200, 200]
    attachable.variant :medium, resize_to_limit: [300, 300]
  end

  broadcasts_to ->(_product) { 'products' }, inserts_by: :prepend

  def add_product(product)
    line_items(product:)
  end

  def attach_photo(product_id)
    file_name = product_id.to_s.chars.last
    file_name = '10' if file_name == '0'
    photo.attach(io: File.open("app/assets/images/#{file_name}.jpg"), filename: "#{file_name}.jpg")
  end
end
