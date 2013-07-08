class Scan < ActiveRecord::Base
  attr_accessible :exhibit_id, :profile_id

  belongs_to :exhibit
  belongs_to :profile
end
