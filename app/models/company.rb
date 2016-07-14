class Company < ApplicationRecord
  has_many :jobs
  validates :name, :location, :phone, :mail, presence: true
end
