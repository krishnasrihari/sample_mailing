class SendMail < ActiveRecord::Base
  attr_accessible :to, :subject, :body, :file_attachments_attributes
  
  validates :to, :presence => true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
  has_many :file_attachments, :dependent => :destroy
  accepts_nested_attributes_for :file_attachments
end
