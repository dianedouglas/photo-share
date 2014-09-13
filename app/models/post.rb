class Post < ActiveRecord::Base
	has_attached_file :image_upload, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :image_upload, :content_type => /\Aimage\/.*\Z/
end