class Merchant < ApplicationRecord
  validates :name, presence: true

  has_many :items, dependent: :destroy
  has_many :invoices, dependent: :destroy

  def self.partial_matches(name)
    self.where('LOWER(name) like ?', "%#{name.downcase}%")
  end
end
