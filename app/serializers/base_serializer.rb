class BaseSerializer
  include FastJsonapi::ObjectSerializer
  def self.by_resource_class(resource_class, resource)
    return ItemSerializer.new(resource) if resource_class == Item
    return MerchantSerializer.new(resource) if resource_class == Merchant
  end
end
