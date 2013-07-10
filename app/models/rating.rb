class Rating < ActiveRecord::Base
  attr_accessible :exhibit_id, :score, :user_id

  validates :exhibit_id, presence: true
  validates :score, presence: true
  validates :user_id, presence: true
end
