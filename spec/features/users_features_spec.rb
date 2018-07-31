require_relative "../rails_helper.rb"
describe 'Feature Test: User Signup',  :type => :feature do

  it 'successfully signs up as non-admin' do
    visit '/users/new'
    expect(current_path).to eq('/users/new')
    # #user_signup is defined in login_helper.rb
    user_signup
    expect(current_path).to eq('/users/1')
    expect(page).to have_content("Professor McGonagal")
  end

  it 'on sign up, successfully adds a session hash' do
    visit '/users/new'
    user_signup
    expect(page.get_rack_session_key('user_id')).to_not be_nil
  end

end
