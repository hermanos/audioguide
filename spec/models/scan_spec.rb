require 'spec_helper'

describe Scan do
	it "check if the self.scan function works properly" do
		user = User.create!(email: 'vasilica@mymail.com', password: '123456789')
		muzeu = Museum.create!(name: 'Muzeul de Stiinte Naturale', lat: 45.75515, long: 24.116297, description: "Cel mai tare muzeu", manager_id: 1, published: 0 )
		exhibit = Exhibit.create!(title: 'Monalisa', description: 'Pictura. ', audio: nil, video: nil, floor: 0, lat: 40, long: 40, qr_code: 'http://10.0.0.64:3000/museums/2/exhibits/2', museum_id: muzeu, private: 0)

		
	end
	
end