class Scan < ActiveRecord::Base
  attr_accessible :exhibit_id, :profile_id

  belongs_to :exhibit
  belongs_to :profile


  def self.scanned?(ex_id, prof_id)
		unless Scan.where(exhibit_id: ex_id, profile_id: prof_id).first
			Scan.create(exhibit_id: ex_id, profile_id: prof_id)
		end
		
  end

end