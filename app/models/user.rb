class User < ActiveRecord::Base
  has_secure_password

  has_many :cats
  has_many :spells, :through => :cats
end
