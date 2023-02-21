# frozen_string_literal: true

class ChangeColumnToProducts < ActiveRecord::Migration[7.0]
  def change
    change_column(:products, :price, :decimal, precision: 8, scale: 2)
  end
end
