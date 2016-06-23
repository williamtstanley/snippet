class User < ActiveRecord::Base
  has_secure_password
  has_many :snippets
  has_many :favourites, dependent: :destroy
  has_many :favorite_snippets, through: :favourites, source: :snippets

  validates :first_name, presence: true
  validates :last_name, presence: true

  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, format: VALID_EMAIL_REGEX, uniqueness: true


end
