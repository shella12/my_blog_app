require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'James', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.', posts_counter: 1) }

  before { subject.save }

  it 'name must not be null' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts_counter nil must not be valid' do
    subject.posts_counter = nil
    expect(subject).to_not be_valid
  end

  it 'posts_counter non-integer value must not be valid' do
    subject.posts_counter = 'aaa'
    expect(subject).to_not be_valid
  end

  it 'posts_counter negative value must not be valid' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end
end
