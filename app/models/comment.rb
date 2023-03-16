class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  after_save :comments_counter

  private

  def comments_counter
    post.update(comments_counter: post.comments.all.length)
  end
end
