class RemoveColumnTitleLikes < ActiveRecord::Migration[7.0]
  def change
    remove_column(:likes, :title)
  end
end
