class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :unit_price, presence: true

  belongs_to :merchant

  def self.partial_matches(name)
    self.where('LOWER(name) like ?', "%#{name.downcase}%")
  end
end
