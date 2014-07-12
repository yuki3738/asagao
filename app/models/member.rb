class Member < ActiveRecord::Base
  attr_accessible :number, :name, :full_name, :email, :birthday, :gender, :administrator
end
