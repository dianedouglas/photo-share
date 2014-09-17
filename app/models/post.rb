class Post < ActiveRecord::Base
  has_attached_file :image_upload, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image_upload, :content_type => /\Aimage\/.*\Z/
  validates_presence_of :image_upload
  validates_presence_of :description
  validates_presence_of :user_id
  has_many :favorites
  has_many :users, through: :favorites
end
