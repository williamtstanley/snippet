class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :snippet

  validates :body, presence: true
end
