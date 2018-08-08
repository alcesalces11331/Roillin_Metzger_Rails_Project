require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) {
    User.create(
      :name => "Hagrid"
      :password => "password"
      :email => "email@email.com"
    )
  }

  let(:admin) {
    User.create(
      :name => "Barrell"
      :password => "password"
      :email => "email"
      :admin => true
    )
  }

  it "is valid with a name, password, and email" do
    expect(user).to be_valid
  end

  it "is valid with an admin boolean" do
    expect(admin).to be_valid
  end

  it "defaults to admin => false" do
    expect(user.admin).to eq(false)
  end
end
