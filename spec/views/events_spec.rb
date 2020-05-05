require 'rails_helper'

RSpec.describe 'Consoles features' do
  let(:view_consoles) do
    visit('/')
    click_link('Sign up')
  end

  describe 'viewing the index' do
    it 'lists all of the consoles' do
      Console.create!(name: 'Switch', manufacturer: 'Nintendo')
      Console.create!(name: 'Wii', manufacturer: 'Nintendo')

      view_consoles

      expect(page).to have_content('Nintendo Switch')
      expect(page).to have_content('Nintendo Wii')
    end
  end
end
