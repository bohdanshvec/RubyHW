class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :status
      t.belongs_to :author

      t.timestamps
    end
  end
end
