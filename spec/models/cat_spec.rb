require 'rails_helper'

RSpec.describe User, type: :model do

  let(:cat) {
    Cat.create(
      :name => "Garfield"
      :type => "Calico"
      :age => "12"
    )
  }
  
  it "is valid with a name, password, and email" do
    expect(cat).to be_valid
  end
end
