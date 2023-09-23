class Authentication
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :token, type: String

  validates :name, :token, presence: true
end
