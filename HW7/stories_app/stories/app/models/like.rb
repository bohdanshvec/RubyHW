class Like < ApplicationRecord
  belongs_to :liked, polymorphic: true

  validates :title, presence: true, length: {minimum: 2, message: 'Name must be minimum 2' }
end