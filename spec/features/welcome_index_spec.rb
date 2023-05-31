require 'rails_helper'

RSpec.feature 'WelcomeIndices', type: :feature do
  describe 'Welcome Index' do
    it 'should have a title' do
      visit root_path
      expect(page).to have_content('Zik Budget App')
    end

    it 'should have a link to sign up' do
      visit root_path
      expect(page).to have_content('Sign up')
    end

    it 'should have a link to sign in' do
      visit root_path
      expect(page).to have_content('Log in')
    end
  end
end
