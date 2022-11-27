# frozen_string_literal: true

class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :author

  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true, length: { minimum: 2 }
end