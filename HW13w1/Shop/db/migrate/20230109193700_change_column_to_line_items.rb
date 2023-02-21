# frozen_string_literal: true

class ChangeColumnToLineItems < ActiveRecord::Migration[7.0]
  def change
    change_column(:line_items, :price, :decimal, precision: 8, scale: 2)
  end
end
