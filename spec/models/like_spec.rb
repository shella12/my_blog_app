require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    @user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                     bio: 'Teacher from Mexico.', posts_counter: 0)

    @post = Post.new(user: @user, title: 'Hello', text: 'Teacher need to get trained', comments_counter: 0,
                     likes_counter: 0)

    Like.new(post: @post, user: @user)
  end

  before { subject.save }

  it 'Comments user should equal to user who made the comment' do
    expect(@post.likes_counter).to eq 1
  end
end
