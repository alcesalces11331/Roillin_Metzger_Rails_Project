class User < ActiveRecord::Base
  has_secure_password

  validates :name, :password, presence: true
  validates :name, uniqueness: true
  validates :name, format: { with: /[^A-Za-z0-9]+/, message: "only allows alpha-numeric characters"}
  validates :password, format: { with: /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.{8,})/, message: "must contain 1 lowercase alphabetical, 1 uppercase, and 1 number, and have at leaset 8 characters"}

  has_many :cats
  has_many :spells, :through => :cats

  def self.find_or_create_by_omniauth(auth_hash)
  end
end
