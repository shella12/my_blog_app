require 'rails_helper'

RSpec.describe 'create new post', type: :system do
  describe 'new page' do
    it 'shows the right content' do
      visit user_post_path(user_id: 1, id: 1)
      expect(page).to have_content('comments')
    end
  end
end
