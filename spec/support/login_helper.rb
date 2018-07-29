module LoginHelper

  def user_signup
    fill_in("user[name]", :with => "Professor McGonagal")
    fill_in("user[password]", :with => "password")
    click_button('Create User')
  end

  def user_login
    select 'Potter', from: 'user_name'
    fill_in("password", :with => "password")
    click_button('Sign In')
  end

  def create_standard_user
    @Potter = User.create(
      name: "Potter",
      password: "password"
    )
  end

end
