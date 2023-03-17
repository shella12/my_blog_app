require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    @user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                     bio: 'Teacher from Mexico.', posts_counter: 0)

    @post = Post.new(user: @user, title: 'Hello', text: 'Teacher need to get trained', comments_counter: 0,
                     likes_counter: 0)

    Comment.new(post: @post, user: @user, text: 'Hi Tom!')
  end

  before { subject.save }

  it 'Comments counter will be incremented' do
    expect(@post.comments_counter).to eq 1
  end
end
