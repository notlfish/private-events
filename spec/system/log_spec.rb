RSpec.describe 'Signing and Loging functionality' do
  before :each do
    bob = User.create(name: 'Bob',
                      email: 'bob@example.com',
                      password: '123456',
                      password_confirmation: '123456')
    success = bob.created_events.create(name: 'Capybara begun working',
                                        venue: 'Fortune\'s computer',
                                        date: DateTime.now)
    bob.attended_events << success
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

    it 'fails to register existing user' do
      visit 'users/sign_up'
      within('#new_user') do
        fill_in 'Name', with: 'Bob'
        fill_in 'Email', with: 'bob@example.com'
        fill_in 'Password', with: '123456'
        fill_in 'Password confirmation', with: '123456'
      end
      click_button 'Sign up'
      expect(page).to have_content 'Name has already been taken'
      expect(page).to have_content 'Email has already been taken'
    end

    it 'fails to register with missing information' do
      visit 'users/sign_up'
      click_button 'Sign up'

      expect(page).to have_content "Name can't be blank"
      expect(page).to have_content "Email can't be blank"
      expect(page).to have_content "Password confirmation can't be blank"
      expect(page).to have_content "Password can't be blank"
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

    it 'fails for incorrect password' do
      visit 'users/sign_in'
      within('#new_user') do
        fill_in 'Email', with: 'bob@example.com'
        fill_in 'Password', with: 'aaaaaaaaaa'
      end
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password'
    end
  end
end
