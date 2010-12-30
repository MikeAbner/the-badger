class Pin
  include Mongoid::Document
  field :pinned_at
  referenced_in :user
  referenced_in :badge
end
