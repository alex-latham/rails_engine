class Transaction < ApplicationRecord
  belongs_to :invoice
  # belongs_to :merchant, through: :invoice
  # belongs_to :customer, through: :invoice

  validates :credit_card_number, presence: true
  validates :result, presence: true
end
