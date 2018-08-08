class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, :address, :category, presence: true
  LIST = %w{chinese italian japanese french belgian}
  validates :category, inclusion: { in: LIST }
end
