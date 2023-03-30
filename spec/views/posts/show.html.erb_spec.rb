require 'rails_helper'

RSpec.describe 'posts/show.html.erb', type: :system do
  before do
    @post = Post.find(3)
  end
  describe 'index page' do
    it 'shows the right content' do
      visit('/users/1/posts/3')
      expect(page).to have_selector('h1', text: "Post#3 by #{@post.user.name}")
      expect(page).to have_content("likes: #{@post.likes_counter}")
      expect(page).to have_content("comments: #{@post.comments_counter}")
      expect(page).to have_selector('h2', text: @post.title.strip)
      expect(page).to have_selector('p', text: @post.text)
      @post.comments.each do |comment|
        expect(page).to have_selector('li', text: "#{comment.user.name}: #{comment.text}")
      end
    end
  end
end
