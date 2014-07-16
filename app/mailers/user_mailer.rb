class UserMailer < ActionMailer::Base
  default :from => "no_reply@gmail.com"

  def compose(send_mail)
   @send_mail = send_mail
   if @send_mail.file_attachments.present?
     @send_mail.file_attachments.each do |attach|
       attachments["#{attach.file_url.split('/').last}"] = File.read("public#{attach.file_url}")
     end
   end

    mail(
      :to => send_mail.to,
      :subject => send_mail.subject
    )
  end
end
