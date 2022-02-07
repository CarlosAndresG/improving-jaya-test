class Issue < ApplicationRecord
  has_many :events
  validates :issue, presence: true
  validates :number, presence: true
end
