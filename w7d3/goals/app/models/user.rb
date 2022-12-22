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
class User < ApplicationRecord
    validates :username, :session_token, :password_digest, presence: true
    validates :username, :session_token, uniqueness: true

    before_validation :ensure_session_token!

    attr_reader :password

    def self.find_by_credentials(username, password)
        user = User.find_by(:username)
        if user && user.i_check_password?(password)
            user
        else
            nil
        end
    end

    def i_check_password?(password)
        password_object = BCrypt::Password.new(password)
        password_object.is_password?(password)
    end

    def generate_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.session_token
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def ensure_session_token!
        self.session_token ||= SecureRandom::urlsafe_base64
    end

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
        self.session_token
    end
end
