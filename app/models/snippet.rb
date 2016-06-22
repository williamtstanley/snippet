class Snippet < ActiveRecord::Base
  belongs_to :user
  belongs_to :kind
end
