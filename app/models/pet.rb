class Pet < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  mount_uploader :photo, PhotoUploader

  validates :photo, presence: true
end
