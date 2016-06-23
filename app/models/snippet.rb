class Snippet < ActiveRecord::Base
  belongs_to :user
  belongs_to :kind
  has_many :favourites, dependent: :destroy
  has_many :users, through: :favourites
  has_many :comments, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :work, presence: true


  scope :language, -> (term) {where(kind_id: term)}

  def favourited_by?(user)
    favourites.exists?(user: user)
  end

  def favourite_for(user)
    favourites.find_by_user_id user
  end
end
