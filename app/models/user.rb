class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  before_save { email.downcase! }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }

  VALID_PASSWORD_REGEX = /\A[0-9a-zA-Z]{8,20}$\z/
  has_secure_password
  validates :password, presence: true, length: { minimum: 8, maximum: 20 },
                      format: { with: VALID_PASSWORD_REGEX }, allow_nil: true
  VALID_PHONE_NUMBER_REGEX = /\A[0-9]{10,13}$\z/
  validates :phone_number, presence: true, length: { minimum: 10, maximum: 13 },
                            format: { with: VALID_PHONE_NUMBER_REGEX }

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end