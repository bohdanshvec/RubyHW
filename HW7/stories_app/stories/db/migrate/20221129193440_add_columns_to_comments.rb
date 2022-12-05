class AddColumnsToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :body, :text
    add_column :comments, :ststus, :integer
  end
end
