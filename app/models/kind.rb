class Kind < ActiveRecord::Base
  has_many :snippets, dependent: :nullify
  validates :title, presence: true, uniqueness: true
end
