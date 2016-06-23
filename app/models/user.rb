class User < ActiveRecord::Base
  has_secure_password
  has_many :snippets
  has_many :favourites, dependent: :destroy
  has_many :favourite_snippets, through: :favourites, source: :snippet

  validates :first_name, presence: true
  validates :last_name, presence: true

  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, format: VALID_EMAIL_REGEX, uniqueness: true

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
