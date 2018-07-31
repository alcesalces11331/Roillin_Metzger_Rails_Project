require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) {
    User.create(
      :name => "Hagrid"
      :password => "password"
    )
  }

  let(:admin) {
    User.create(
      :name => "Barrell"
      :password => "password"
      :admin => true
    )
  }

  it "is valid with a name and password" do
    expect(user).to be_valid
  end

  it "is not valid without a password" do
    expect(User.new(name: "Name")).not_to be_valid
  end

  it "is valid with an admin boolean" do
    expect(admin).to be_valid
  end

  it "defaults to admin => false" do
    expect(user.admin).to eq(false)
  end
end
