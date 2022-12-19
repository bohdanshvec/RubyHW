class AddColumnAuthorIdLikes < ActiveRecord::Migration[7.0]
  def change
    add_column(:likes, :author_id, :bigint, default: 1, null: false)
  end
end
