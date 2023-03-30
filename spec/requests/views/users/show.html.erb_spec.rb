require 'rails_helper'

RSpec.describe 'users/show.html.erb', type: :system do
  before do
    @user = User.first
    @posts = @user.most_recent_posts
  end
  describe 'show page' do
    it 'shows the right content' do
      visit('/users/1')
      expect(page).to have_selector('h1', text: @user.name)
      expect(page).to have_selector('img.profile_photo')
      expect(page).to have_selector('p', text: "Number of posts: #{@user.posts_counter}")
      expect(page).to have_selector('p', text: @user.bio.to_s)
      expect(page).to have_link('See all posts', href: user_posts_path(@user.id))
      @posts.each do |post|
        expect(page).to have_selector('p', text: post.text.to_s)
      end
      click_link("Post##{@posts.first.id}")
      sleep(1)
      expect(current_path).to eql("/users/#{@user.id}/posts/#{@posts.first.id}")
      page.go_back
      click_link('See all posts')
      sleep(1)
      expect(current_path).to eql(user_posts_path(@user.id))
    end
  end
end
