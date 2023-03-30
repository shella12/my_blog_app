require 'rails_helper'

RSpec.describe 'users/index.html.erb', type: :system do
  before do
    @current_user = User.first
    end
  describe 'index page' do
    it 'shows the right content' do
      visit users_path
      expect(page).to have_selector('div.user', count: (User.all.length.to_i - 1))
      expect(page).to have_selector('img.profile_photo', count: (User.all.length.to_i))
      User.order(:id).offset(1).each do |user|
        expect(page).to have_selector('p',text: "Number of posts: " + (user.posts_counter).to_s)  
      end
      click_link(User.first.name)
      expect(current_path). to eql('/users')
    end
  end
end
