class User < ActiveRecord::Base
  has_secure_password

  validates :name, :password, :email, presence: true
  
  #validates :email, uniqueness: true

  # look at regex 08/27/18

  #validates :name, format: { with: /[^A-Za-z0-9]+/, message: "only allows alpha-numeric characters"}

  #validates :password, format: { with: /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.{8,})/, message: "must contain 1 lowercase alphabetical, 1 uppercase, and 1 number, and have at leaset 8 characters"}

  has_many :cats
  has_many :spells, :through => :school
  has_many :potions, :through => :cats

  def self.find_or_create_by_omniauth(auth)
    self.where(:name => auth['info']['first_name']).first_or_create do |user|
      # user.provider = auth.provider when updated db
      # using ActiveSupport::SecureRandom length=32
      user.password = SecureRandom.hex(32)
      user.uid = auth.uid
      user.email = auth['info']['email']
      # need to make helper method for auth.info.name
      user.name = auth.info.name
      # need to create helper method for .credentials methods
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def find_user
    User.find_by(id: params[:id])
  end
end
