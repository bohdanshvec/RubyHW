class Author < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :articles, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2 }
  validates :name, uniqueness: { message: 'The selected name already exists' }
end