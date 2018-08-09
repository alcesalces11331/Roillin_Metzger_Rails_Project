require 'rails_helper'

RSpec.describe CatsController, type: :controller do

  describe "post create" do
    it 'redirects to cat show page if not nil' do
      post :create
      expect(response).to redirect_to controller: 'cats', action: 'show'
    end
  end

end
