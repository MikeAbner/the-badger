class Badge
  include Mongoid::Document
  field :image_data, :type => String
  field :image_filename, :type => String
  field :name, :type => String
  field :description, :type => String
  
  def image
    Base64.decode64 self.image_data
  end
  def image=(data)
    self.image_data = Base64.encode64 data
  end
end
