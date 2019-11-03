class Person < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :locations
  has_many :affiliations

end
