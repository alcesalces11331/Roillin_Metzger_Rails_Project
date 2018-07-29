require 'rails_helper'

RSpec.describe "route for root", :type => :routing do
  describe 'get welcome' do
    it 'routes / to static controller' do
      expect(get("/")).to route_to("static#welcome")
    end
  end

end
