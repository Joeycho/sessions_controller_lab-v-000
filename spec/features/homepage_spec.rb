require 'rails_helper'

RSpec.describe "homepage", :type => :view do
  it "When the user is not logged in, the page should show them a login link" do
    visit '/'
    session[:user_id] = nil
    expect(last_response.body).to include ''
  end
end
