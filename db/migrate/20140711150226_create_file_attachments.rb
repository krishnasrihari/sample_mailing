class CreateFileAttachments < ActiveRecord::Migration
  def change
    create_table :file_attachments do |t|
      t.string :file
      t.integer :send_mail_id

      t.timestamps
    end
  end
end
