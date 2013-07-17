require 'spec_helper'
require 'user'

describe User do
	context "A new email johndoe@gmail.com with pass: 12345678" do
		it "Should work :))" do
			user = User.new(email: 'johndoe@gmail.com', password: '12345678')
			user.email.should be('johndoe@gmail.com')
			user.password.should be('12345678')
			user.profile.role.should be('user')
			user.profile.name.should be('Guest')
		end
	end
end