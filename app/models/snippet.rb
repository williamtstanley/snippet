class Snippet < ActiveRecord::Base
  belongs_to :user
  belongs_to :kind

  validates :title, presence: true, uniqueness: true
  validates :work, presence: true


  # scope :search, -> (term) {where("title ILIKE :term OR work ILIKE :term OR department ILIKE :term OR message ILIKE :term", {term: "%#{term}%"})}
  # scope :search, lambda do |term|
  #    where("title ILIKE :term OR email ILIKE :term OR department ILIKE :term OR message ILIKE :term", {term: "%#{term}%"})
  #  end
  scope :language, -> (term) {where(kind_id: term)}

end
