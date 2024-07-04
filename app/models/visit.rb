class Visit
  include Mongoid::Document
  include Mongoid::Timestamps

  field :ip_address, type: String

  belongs_to :url
end
