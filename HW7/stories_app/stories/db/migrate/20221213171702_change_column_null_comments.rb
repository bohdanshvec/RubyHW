class ChangeColumnNullComments < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:comments, :article_id, false)
    change_column_null(:comments, :author_id, false)
  end
end
