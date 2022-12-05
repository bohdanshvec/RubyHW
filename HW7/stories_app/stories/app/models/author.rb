class Author < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :articles, dependent: :destroy

  validates :name, presence: true, length: {minimum: 2, message: 'Name must be minimum 2' }
  validates :name, uniqueness: { true, message: 'The selected name already exists' }
end