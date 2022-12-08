class Tag < ApplicationRecord
  has_and_belongs_to_many :articles

  validates :name, presence: true, length: {minimum: 2, message: 'Name must be minimum 2' }

  # scoupe :get_all_tags, -> { where(name: true) }
end