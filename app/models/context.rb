class Context < ActiveRecord::Base
  has_attached_file :picture, :styles => {:medium => "250x250>", :thumb => "80x80>"}
end
