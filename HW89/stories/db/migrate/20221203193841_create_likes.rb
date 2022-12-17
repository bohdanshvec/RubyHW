class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.string :title
      t.references :liked, polymorphic: true

      t.timestamps
    end
  end
end
