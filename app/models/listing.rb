class Listing < ActiveRecord::Base
	if Rails.env.development?
		has_attached_file :image, :styles => { :large => "570x>", :page => "270x180>", :medium => "200x>", :thumb => "116x77>" }, :default_url => "no_image_available.jpg"
	else
		has_attached_file :image, :styles => { :large => "570x>", :page => "270x180>", :medium => "200x>", :thumb => "116x77>" }, :default_url => "no_image_available.jpg", :storage => :dropbox,
    					  :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    					  :path => ":style/:id_:filename"
    	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
    end
end
