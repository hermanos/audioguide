class Comment < ActiveRecord::Base
  attr_accessible :content, :exhibit_id, :user_id
end
