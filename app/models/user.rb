class User < ActiveRecord::Base
  include Gravtastic
  gravtastic size: 200

  has_secure_password
  has_many :snippets

  has_many :comments, dependent: :nullify

  has_many :favourites, dependent: :destroy
  has_many :favourite_snippets, through: :favourites, source: :snippet

  has_one :profile, dependent: :destroy

  has_many :conversations
  has_many :messages

  has_many :active_relationships,  class_name:  "Relationship",
                                   foreign_key: "follower_id",
                                   dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

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

  # Follows a user.
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user.
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

end
