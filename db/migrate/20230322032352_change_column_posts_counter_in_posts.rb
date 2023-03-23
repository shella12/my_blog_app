class ChangeColumnPostsCounterInPosts < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :likes_counter, :integer, deafult: 0
    change_column :posts, :comments_counter, :integer, deafult: 0
  end
end
