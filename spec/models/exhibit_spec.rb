require 'spec_helper'

describe Exhibit do
	before(:each) do
		muzeu = Museum.create!(name: 'Muzeul de Stiinte Naturale', lat: 45.75515, long: 24.116297, description: "Cel mai tare muzeu", manager_id: 1, published: 0 )
		exhibit = muzeu.exhibits.create!(title: 'Exhibit', description: 'This is the info', floor: 1, lat: 10, long: 12)
	end

	xit "checks if the exhibit is private" do
		exhibit.private?.should be true		
	end

	xit "creates a QR Code for the exhibit" do
		exhibit.qr_code.should be true
	end	

end