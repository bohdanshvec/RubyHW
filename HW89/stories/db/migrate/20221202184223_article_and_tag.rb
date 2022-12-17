class ArticleAndTag < ActiveRecord::Migration[7.0]
  def change
    create_table :article_tag, id: false do |t|
      t.belongs_to :article
      t.belongs_to :tag
    end
  end
end
