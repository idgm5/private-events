require 'rails_helper'

RSpec.describe 'Create user', type: :system do
  describe 'create page' do
    it 'shows the right content' do
      visit create_path
      expect(page).to have_content('Holamundo')
    end
  end
end
