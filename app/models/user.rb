class User < ApplicationRecord

  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\d\+\.a-z_-]+@[a-z]+\.[a-z.]+\z/i
  validates(:username,  presence:   true, 
                        length:     { maximum: 50 } )
  validates :email,     presence:   true, 
                        length:     { maximum: 255 }, 
                        format:     { with: VALID_EMAIL_REGEX },
                        uniqueness: { case_sensitive: false }
end
