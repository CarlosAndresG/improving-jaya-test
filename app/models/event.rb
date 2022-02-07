class Event < ApplicationRecord
  belongs_to :issue
  validates :payload, presence: true
  validates :action, presence: true
end
