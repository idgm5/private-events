require 'rails_helper'

RSpec.describe 'Events Management' do
  describe 'add a new event' do
    it 'creates a new user and generates a new event' do
      visit('/')
      click_link('Sign up')

      expect(current_path).to have_content('/users/new')

      fill_in('user[name]', with: 'user1004')
      click_button('Create User')

      expect(current_path).to have_content('/')

      click_link('New event')

      expect(current_path).to have_content('/events/new')

      fill_in('event[description]', with: 'E3 Conference')
      fill_in('event[event_date]', with: Time.zone.now)
      click_button('Create Event')

      expect(page).to have_content('E3 Conference')
    end
  end

  describe 'update an event' do
    it 'updates the recent created event' do
      visit('/')
      click_link('Sign up')

      expect(current_path).to have_content('/users/new')

      fill_in('user[name]', with: 'user1004')
      click_button('Create User')

      expect(current_path).to have_content('/')

      click_link('New event')

      expect(current_path).to have_content('/events/new')

      fill_in('event[description]', with: 'E3 Conference')
      fill_in('event[event_date]', with: Time.zone.now)
      click_button('Create Event')

      expect(page).to have_content('E3 Conference')
      click_link('Edit')

      fill_in('event[description]', with: 'Rubykaigi 2020')
      fill_in('event[event_date]', with: Time.zone.now)
      click_button('Update Event')

      expect(page).to have_content('Rubykaigi 2020')
    end
  end
end
