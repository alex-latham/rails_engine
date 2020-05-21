class Search
  def self.partial_name(resource, name)
    resource.where('LOWER(name) LIKE ?', "%#{name.downcase}%")
  end
end
