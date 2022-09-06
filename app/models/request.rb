class Request < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  has_many :swaps
end
