class User < ApplicationRecord
  has_one :campaign, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :discussion
  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\d\+\.a-z_-]+@[a-z]+\.[a-z.]+\z/i
  validates(:username,  presence:   true, 
                        length:     { maximum: 50 } )
  validates :email,     presence:   true, 
                        length:     { maximum: 255 }, 
                        format:     { with: VALID_EMAIL_REGEX },
                        uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password,  presence:   true,
                        length:     { minimum: 6 }, 
                        allow_nil: true
  # for testing with fixtures
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end                       
end
