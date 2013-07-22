require 'spec_helper'

describe Scan do
	it "check if the self.scan function works properly" do
		user = User.create!(email: 'vasilica@mymail.com', password: '123456789')
		muzeu = Museum.create!(name: 'Muzeul de Stiinte Naturale', lat: 45.75515, long: 24.116297, description: "Cel mai tare muzeu", manager_id: user, published: 0 )
		exhibit = muzeu.exhibits.create!(title: 'Monalisa', description: 'Pictura', audio: nil, video: nil, floor: 0, lat: 40, long: 40, qr_code: 'whatevaaaaaaa', private: 0)

		visit museum_exhibit_url(museum, exhibit)
		scan = Scan.find(ex_id: exhibit, prof_id: user.profile)

		expect(scan).no_to eq(nul)	
	end
	
end