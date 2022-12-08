class RenameTableArticleTag < ActiveRecord::Migration[7.0]
  def change
    rename_table :article_tag, :articles_tags
  end
end
