class RenameColumnLikes < ActiveRecord::Migration[7.0]
  def change
    rename_column(:likes, :liked_type, :likeable_type)
    rename_column(:likes, :liked_id, :likeable_id)
  end
end
