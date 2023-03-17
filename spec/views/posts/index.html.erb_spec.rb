require 'rails_helper'

RSpec.describe 'posts/index.html.erb', type: :view do
  before do
    render
  end

  it 'p tag is present' do
    expect(rendered).to have_selector('p')
  end
  it 'p has a placeholder' do
    expect(rendered).to include('Here is a list of posts for a given user')
  end
end
