class Fibre < ApplicationRecord
  validates :number, presence: true
  validates :name, presence: true
  validates :location, presence: true
  #validates :shelf, presence: true
  #validates :system, presence: true
  validates :cabinet_name, presence: true
  validates :room, presence: true
end
