# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  password_digest :string           not null
#  session_token   :string           not null
#  username        :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_username  (username)
#
require 'rails_helper'

RSpec.describe User, type: :model do
  let (:user_1) { User.create!(username: 'user_1', password_digest: 'pass_1') }
  let (:user_2) { User.create!(password_digest: 'pass_2', session_token: '2') }
  let (:user_3) { User.create!(username: 'user_3', session_token: '3') }
  let (:user_4) { User.create!(username: 'user_4', password_digest: 'pass_4', session_token: '4') }

  it 'validates existence of password_digest, session_token, and username' do
    expect(user_1).to be_valid
    expect(user_2).not_to be_valid
    expect(user_3).not_to be_valid
    expect(user_4).to be_valid
  end

  it { should validate_uniqueness_of(:username) }
  it { should validate_uniqueness_of(:session_token)}

  it 'should set a password getter' do
    expect(user_1.password).to_exist
    # not sure what to do here, maybe example users should have a password key instead of password_digest
  end

  describe 'i_check_password?' do
    it 'checks if a string is a password' do
      expect(user_1.i_check_password).to_be true
    end
  end

  describe 'generate_session_token!' do
    it 'creates, but does not save, a session token' do
      expect(user_1.generate_session_token).to_exist
    end
  end

  describe 'password=' do
    it 'sets password_digest' do
      user_1.password=('banana')
      expect(user_1.password_digest).to_exist
    end
  end

  describe 'ensure_session_token!' do
    it 'sets a session token if there is none' do
      expect(user_1.ensure_session_token).to_exist
    end
  end

  describe 'reset_session_token!' do
    it 'saves a new session token' do
      user_1.reset_session_token
      expect(user_1.session_token).to_exist
    end
  end

end
