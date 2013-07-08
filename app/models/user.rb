class User < ActiveRecord::Base
  attr_accessible :coins, :email, :password, :role, :username
end
