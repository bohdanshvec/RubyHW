# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :author
  belongs_to :article

  validates :body, presence: true

  enum :status, %i[unpublished published], default: :unpublished

  scope :get_all_comments, -> { where(status: %i[unpublished published]) }
end
