class Url
  include Mongoid::Document
  include Mongoid::Timestamps

  field :original_url, type: String
  field :token, type: String

  has_many :visits

  before_validation :generate_token, on: :create

  validates :original_url, presence: true
  validates :token, presence: true, uniqueness: true

  private

  def generate_token
    self.token = SecureRandom.urlsafe_base64(6) if token.blank?
  end
end
