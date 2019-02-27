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
