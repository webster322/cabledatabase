class Cable < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :from, presence: true
  validates :to, presence: true
end
