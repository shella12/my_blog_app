require 'rails_helper'

RSpec.describe 'posts/show.html.erb', type: :view do
  before do
    render
  end

  it 'renders show page' do
    expect(response).to render_template(:show)
  end

  it 'p tag is present' do
    expect(rendered).to have_selector('p')
  end
  it 'p has a placeholder' do
    expect(rendered).to include('This is my post and i\'m a user id')
  end
end
