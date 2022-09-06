class Listing < ApplicationRecord
  belongs_to :user
  has_many :requests, dependent: :destroy
  has_many :swaps

  has_many_attached :photos
  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true

  def available?
    if self.requests.any? { |request| request.swaps.first }
      false
    elsif self.swaps.first
      false
    else
      true
    end
  end
end
