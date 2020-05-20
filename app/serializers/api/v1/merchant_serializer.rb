class Api::V1::MerchantSerializer < Api::V1::BaseSerializer
  attributes :name
  has_many :items
end
