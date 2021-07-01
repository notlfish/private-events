RSpec::describe 'Signing and Loging functionality' do
  describe 'the signup process', type: :feature do
    it 'registers a new user' do
      visit 'users/sign_up'
      within('#new_user') do
        fill_in 'Name', with: 'Alice'
        fill_in 'Email', with: 'alice@example.com'
        fill_in 'Password (6 characters minimum)', with: '123456'
        fill_in 'Password confirmation', with: '123456'
      end
      click_button 'Sign up'
      expect(page).to have_content 'You have signed up successfully.'
    end
  end

  describe 'the signin process', type: :feature do
    # before :each do
    #   User.make(email: 'user@example.com', password: 'password')
    # end

    it 'signs me in' do
      visit 'users/sign_in'
      within('#new_user') do
        fill_in 'Email', with: 'alice@example.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Sign in'
      expect(page).to have_content 'Signed in successfully.'
    end
  end
end
