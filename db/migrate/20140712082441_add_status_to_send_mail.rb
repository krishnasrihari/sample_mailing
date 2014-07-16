class AddStatusToSendMail < ActiveRecord::Migration
  def change
    add_column :send_mails, :status, :boolean, :default => false
  end
end
