class Exhibit < ActiveRecord::Base
  attr_accessible :audio, :description, :floor, :lat, :long, :museum_id, :qr_code, :title, :video

  belongs_to :museum

  after_create :create_qr_code

  	def create_qr_code

  		qr_code = {id_exhibit: @exhibit.id, }

  	end

  end
end
