class User < ActiveRecord::Base
  has_secure_password

  validates :name, :password, :email, presence: true
  validates :email, uniqueness: true
  validates :name, format: { with: /[^A-Za-z0-9]+/, message: "only allows alpha-numeric characters"}
  #validates :password, format: { with: /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.{8,})/, message: "must contain 1 lowercase alphabetical, 1 uppercase, and 1 number, and have at leaset 8 characters"}

  has_many :cats
  has_many :spells, :through => :cats

  def self.find_or_create_by_omniauth(auth)
    self.where(:name => auth['info']['first_name']).first_or_create do |user|
      user.provider = auth.provider
      # using ActiveSupport::SecureRandom
      user.password = SecureRandom.hex(32)
      user.uid = auth.uid
      # need to make helper method for auth.info.name
      user.name = auth.info.name
      # need to create helper method for .credentials methods
      user.oauth_token = auth_hash.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
  end
end
