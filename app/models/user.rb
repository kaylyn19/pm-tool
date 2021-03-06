class User < ApplicationRecord
    has_secure_password
    has_secure_token :reset_password_token
    has_many :projects, dependent: :destroy
    has_many :tasks, dependent: :destroy
    has_many :discussions, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :favourites, dependent: :destroy
    has_many :favourite_projects, through: :favourites, source: :project

    validates :first_name, presence: true
    validates :last_name, presence: true
    
    VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i 
    validates :email, presence: true, uniqueness: true, format: VALID_EMAIL_REGEX
    def full_name
        "#{first_name} #{last_name}"
    end

    def generate_password_token!
        self.reset_password_token
    end
end
