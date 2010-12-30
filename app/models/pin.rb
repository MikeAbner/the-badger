class Pin
  include Mongoid::Document
  field :pinned_at
  embedded_in :user, :inverse_of => :pins
  referenced_in :badge
end
