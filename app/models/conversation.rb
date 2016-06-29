class Conversation < ActiveRecord::Base
  belongs_to :user, class_name: :user, foreign_key: :sender_id
  belongs_to :user, class_name: :user, foreign_key: :recipient_id
  has_many :messages

  validates :sender_id, presence: true
  validates :recipient_id, presence: true

  def sender_name
    (User.find sender_id).full_name
  end

  def recipient_name
    (User.find recipient_id).full_name
  end
end
