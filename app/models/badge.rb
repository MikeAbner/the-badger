class Badge
  include Mongoid::Document
  field :image_data, :type => String
  field :image_filename, :type => String
  field :image_content_type, :type => String
  field :name, :type => String
  field :description, :type => String
  references_many :pins
  
  def image
    Base64.decode64 self.image_data
  end
  def image=(data)
    self.image_filename = data.original_filename
    self.image_content_type = data.content_type
    self.image_data = Base64.encode64 data.tempfile.read
  end
end
