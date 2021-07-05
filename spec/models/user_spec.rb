require 'rails_helper'

RSpec.describe 'validations' do
  let(:user) do
    User.new(name: 'Bob',
             email: 'bob@example.com',
             password: '123456',
             password_confirmation: '123456')
  end

  it 'should be a valid user' do
    expect(user).to be_valid
  end

  it 'should be a invalid without name' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'should be a invalid without email' do
    user.email = nil
    expect(user).to_not be_valid
  end

  it 'should be a invalid without password' do
    user.password = nil
    expect(user).to_not be_valid
  end

  it 'should be a invalid without password_confirmation' do
    user.password_confirmation = nil
    expect(user).to_not be_valid
  end
end
