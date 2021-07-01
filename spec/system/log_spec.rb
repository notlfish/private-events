RSpec.describe 'Signing and Loging functionality' do
  before :each do
    User.create(name: 'Bob',
                email: 'bob@example.com',
                password: '123456',
                password_confirmation: '123456')
  end

  describe 'the signup process', type: :feature do
    it 'registers a new user' do
      visit 'users/sign_up'
      within('#new_user') do
        fill_in 'Name', with: 'Camila'
        fill_in 'Email', with: 'camila@example.com'
        fill_in 'Password', with: '123456'
        fill_in 'Password confirmation', with: '123456'
      end
      click_button 'Sign up'
      expect(page).to have_content 'You have signed up successfully.'
    end
  end

  describe 'the sign in process', type: :feature do
    it 'signs me in' do
      visit 'users/sign_in'
      within('#new_user') do
        fill_in 'Email', with: 'bob@example.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
      expect(page).to have_content 'Signed in successfully.'
    end
  end
end
