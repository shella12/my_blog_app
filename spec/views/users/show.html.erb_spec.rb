require 'rails_helper'

RSpec.describe 'users/show.html.erb', type: :view do
  
  before do 
    render
  end
  
  it "p tag is present" do
    expect(rendered).to have_selector('p')
 end
  it "p has a placeholder" do
    expect(rendered).to include('Hi I\'m a user with an id')
 end
 
end
