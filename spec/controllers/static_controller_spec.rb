require 'rails_helper'

RSpec.describe StaticController, type: :controller do
  render_views
  describe 'get welcome' do
    it 'redirects to root' do
      visit root_path
      expect(current_path).to eq('/static/welcome')
    end
  end

end
