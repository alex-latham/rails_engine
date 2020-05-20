class Search < ApplicationRecord
  def self.partial_matches(resource_class, name)
    resource_class.where('LOWER(name) like ?', "%#{name.downcase}%")
  end
end
