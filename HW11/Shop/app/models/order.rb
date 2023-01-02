class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cart

  enum status: { unpaid: 0, paid: 1 }
end