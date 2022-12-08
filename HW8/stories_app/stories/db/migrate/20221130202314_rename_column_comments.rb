class RenameColumnComments < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :ststus, :status
  end
end
