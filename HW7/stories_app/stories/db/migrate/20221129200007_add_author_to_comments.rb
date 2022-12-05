class AddAuthorToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :article
    add_reference :comments, :author
  end
end
