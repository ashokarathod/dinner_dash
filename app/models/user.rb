class User < ApplicationRecord
    has_many :orders, dependent: :destroy
    has_many :comments, dependent: :destroy
    before_save { self.email = email.downcase }
    validates :name, presence: true, 
                       uniqueness: { case_sensitive: false }, 
                       length: {minimum: 3, maximum: 20}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

    validates :email, presence: true,  
                        uniqueness: { case_sensitive: false }, 
                        length: {maximum: 105}, format: { with: VALID_EMAIL_REGEX }
    
    # scope :user, ->{where(name: true)}
    has_secure_password
end
