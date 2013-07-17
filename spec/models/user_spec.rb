require 'spec_helper'

describe User do
	before(:each) do
    user = User.create!(email: 'johndoe@gmail.com', password: '12345678')
  end

	context "creates a new account" do
		it "should have email : johndoe@gmail.com, pass: 12345678 + a profile with role: user and name: Guest" do
			expect(user.email).to eq('johndoe@gmail.com')
			expect(user.password).to eq('12345678')
			expect(user.profile.role).to eq('user')
			expect(user.profile.name).to eq('Guest')
		end
	end

	context "roles check : " do
		it "if creates a new account and it's not the first account created " do
			user2 = User.create!(email: 'johndoe@gmail.com', password: '12345678')
			expect(user2.profile.role).to eq('user')
		end

		it "if creates a new account and it's the first account created" do
			expect(user.profile.role).to eq('admin')
		end

		it "if role is manager" do
			user.profile.role = 'manager'
			expect(user.profile.role).to eq('manager')
		end

		it "if role is admin" do
			user.profile.role = 'admin'
			expect(user.profile.role).to eq('admin')
		end
	end

	context " is manager and sees the index screen." do
		it " Database check to see what museums he can see" do
			user.profile.role = 'manager'
			
		end
	end
end