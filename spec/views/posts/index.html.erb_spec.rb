require 'rails_helper'

RSpec.describe 'posts/index.html.erb', type: :system do
  before do
    @user = User.first
    @posts = @user.posts.order(:id)
  end
  describe 'index page' do
    it 'shows the right content' do
      visit('/users/1/posts')
      expect(page).to have_selector('img.profile_photo')
      expect(page).to have_selector('h1', text: @user.name)
      expect(page).to have_selector('p', text: "Number of posts: #{@user.posts_counter}")
      @posts.each do |post|
        expect(page).to have_selector('h2', text: post.title.strip)
        expect(page).to have_selector('p', text: post.text)
        expect(page).to have_content(post.comments.first.text) unless post.comments.first.nil?
        expect(page).to have_content("likes: #{post.likes_counter}")
        expect(page).to have_content("comments: #{post.comments_counter}")
      end
      click_link("Post##{@posts.first.id}")
      sleep(1)
      expect(current_path).to eql("/users/#{@user.id}/posts/#{@posts.first.id}")
    end
  end
end
