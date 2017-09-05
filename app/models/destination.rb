class Destination < ApplicationRecord
  belongs_to :list
  has_many :activities, dependent: :destroy
end
