class Favourite < ActiveRecord::Base
  belongs_to :user
  belongs_to :snippet

  validates :user, uniqueness: {scope: :snippet}
end
