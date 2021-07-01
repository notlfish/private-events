require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:event) do
    Event.new(date: DateTime.now,
              name: 'Birthday',
              venue: 'Island',
              creator_id: 1)
  end

  context 'with one user in the database' do
    before :context do
      User.create(name: 'Alice',
                  email: 'alice@example.com',
                  password: '123456',
                  password_confirmation: '123456')
    end

    it 'should be a valid event' do
      expect(event).to be_valid
    end

    it 'should be a invalid without name' do
      event.name = nil
      expect(event).to_not be_valid
    end

    it 'should be a invalid without venue' do
      event.venue = nil
      expect(event).to_not be_valid
    end

    it 'should be a invalid without date' do
      event.date = nil
      expect(event).to_not be_valid
    end
  end
end
