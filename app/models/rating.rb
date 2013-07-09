class Rating < ActiveRecord::Base
  attr_accessible :exhibit_id, :score, :user_id
end
