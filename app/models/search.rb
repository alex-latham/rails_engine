class Search < ApplicationRecord
  def self.partial_name(resource_class, name)
    resource_class.where('LOWER(name) like ?', "%#{name.downcase}%")
  end
end
