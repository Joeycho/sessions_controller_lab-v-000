require 'rails_helper'

RSpec.describe "homepage", :type => :view do
  it "When the user is not logged in, the page should show them a login link" do
    visit '/'
    session[:name] = nil
    expect(page).to have_link("Login", href:'/login')
  end

  it "When the user is logged in, the page should say, `hi, #{username}`, and provide a logout link" do
    visit '/'
    session[:name] = "Jakob"
    expect(page).to have_text(`hi, #{session[:name]}`)
    expect(page).to have_link("Logout", href:'/logout')
  end
end

RSpec.describe "/login", :type => :view do
  it "Users can enter their name in a form and click 'login'. Thereafter, the app will refer to them by that name" do
    visit '/login'
    fill_in("name", :with => "Tommy")
    click_button('Login')
    expect(current_path).to eq('/')
    expect(page).to have_text(`hi, Tommy`)
    expect(page).to have_content('Logout')
  end


  it "If the user does not enter a name, they are not logged in. Return them to the login page." do
    visit '/'
    session[:name] = "Jakob"
    expect(page).to have_text(`hi, #{session[:name]}`)
    expect(page).to have_link("Logout", href:'/logout')
  end

end
