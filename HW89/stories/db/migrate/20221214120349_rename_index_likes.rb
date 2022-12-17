class RenameIndexLikes < ActiveRecord::Migration[7.0]
  def change
    rename_index :likes, 'index_likes_on_liked', 'index_likes_on_likeable'
  end
end
