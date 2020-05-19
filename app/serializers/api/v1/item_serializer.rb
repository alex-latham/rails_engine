class Api::V1::ItemSerializer < Api::V1::BaseSerializer
  attributes :name, :description, :unit_price, :merchant_id
end
