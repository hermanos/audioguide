require 'spec_helper'

describe User do
	before(:each) do
    @user = User.create!(email: 'johndoe@gmail.com', password: '12345678')
  end

	context "creates a new account" do
		it "should have email : johndoe@gmail.com, pass: 12345678 + a profile with role: user and name: Guest" do
			@user.profile.role = 'user'
			@user.profile.name = 'Guest'

			expect(@user.email).to eq('johndoe@gmail.com')
			expect(@user.password).to eq('12345678')
			expect(@user.profile.role).to eq('user')
			expect(@user.profile.name).to eq('Guest')
		end
	end

	context "roles check : " do
		it "if creates a new account and it's not the first account created " do
			user2 = User.create!(email: 'johndoe2@gmail.com', password: '12345678')
			
			expect(user2.profile.role).to eq('user')
		end

		it "if creates a new account and it's the first account created" do
			expect(@user.profile.role).to eq('admin')
		end

		it "if role is manager" do
			@user.profile.role = 'manager'

			expect(@user.profile.role).to eq('manager')
		end

		it "if role is admin" do
			@user.profile.role = 'admin'

			expect(@user.profile.role).to eq('admin')
		end
	end

	context " is manager and logs in." do
		it " Database check to see what museums he can see" do
			museum = Museum.create!(name: "Muzeus", lat: 10, long: 15, description: "Cel mai tare muzeu din parcare", manager_id: 6)
			@user.profile.role = 'manager'
			@user.profile.id = 6

			expect(@user.profile.role).to eq('manager')
			expect(@user.profile.id).to eq(museum.manager_id)
		end
	end
end