class CreateSendMails < ActiveRecord::Migration
  def change
    create_table :send_mails do |t|
      t.string :to
      t.string :subject
      t.text :body

      t.timestamps
    end
  end
end
