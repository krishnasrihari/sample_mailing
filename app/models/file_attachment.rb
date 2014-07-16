class FileAttachment < ActiveRecord::Base
  attr_accessible :file
   mount_uploader :file, FileUploader
  belongs_to :send_mail
end
