class User < ActiveRecord::Base
  include Gravtastic
  gravtastic size: 300

  has_secure_password
  has_many :snippets
  has_many :favourites, dependent: :destroy
  has_many :favourite_snippets, through: :favourites, source: :snippet
  has_one :profile, dependent: :destroy
  after_create  :make_profile

  validates :first_name, presence: true
  validates :last_name, presence: true

  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, format: VALID_EMAIL_REGEX, uniqueness: true

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def make_profile
    Profile.create(user: User.last)
  end
end
