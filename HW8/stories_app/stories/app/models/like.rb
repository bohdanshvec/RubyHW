class Like < ApplicationRecord
  belongs_to :likeable, polymorphic: true

  validates :title, presence: true, length: { minimum: 2 }
end