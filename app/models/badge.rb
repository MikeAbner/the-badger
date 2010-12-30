class Badge
  include Mongoid::Document
  field :image_data, :type => String
  field :image_filename, :type => String
  field :name, :type => String
  field :description, :type => String
  references_many :pins
  
  #def ximage
  #  Base64.decode64 self.image_data
  #end
  #def ximage=(data)
  #  self.image_data = Base64.encode64 data
  #end
end
