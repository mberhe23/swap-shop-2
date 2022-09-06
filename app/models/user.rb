class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
  validates :email, uniqueness: true

  has_many :listings
  has_many :requests

  def requested_items
    self.requests.map do |request|
      if request.swap
        return request.listing
      end
    end
  end
end
