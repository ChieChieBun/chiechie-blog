require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.username_list' do
    it 'exists for a user' do
      expect { User.username_list }.not_to raise_error(NoMethodError)
    end

    context 'when there are NO users' do
      # No additional data to set up in this scenario
      it 'returns an empty' do
        expect(User.username_list).to eq([])
      end
    end
    context 'when there are users' do
    let!(:user_1) {
      User.create!(username: 'user1',
      email: 'user1@test',
      password: '1234'
      )
    }
    let!(:user_2) {
      User.create!(username: 'user2',
      email: 'user2@test',
      password: '4321'
      )
    }

  let(:expected_results) {
        [
          'user1',
          'user2'
        ]
      }
  it 'returns array of usernames' do
  expect(User.username_list).to eq(expected_results)
    end
  end
end
end
