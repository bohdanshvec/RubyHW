class Comment < ApplicationRecord
  belongs_to :author
  belongs_to :article
  has_many :likes, as: :liked

  enum :status, %i[unpublished published], default: :unpublished

  scope :get_all_comments, -> { where(status: %i[unpublished published]) }
  scope :get_lastten_comments, -> { last(10) }

  validates :body, presence: true, length: {minimum: 5, message: 'Name must be minimum 5' }
  validates :status, inclusion: { in: %w(unpublished published) }
end