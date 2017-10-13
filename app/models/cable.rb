class Cable < ApplicationRecord
  validates :name, presence: true
  validates :from, presence: true
  validates :to, presence: true
end
