class SendMailsController < InheritedResources::Base
  def create    
    @send_mail = SendMail.new(params[:send_mail])    
    @send_mail.status = true if params[:submit] == "Send"
    if @send_mail.save && params[:submit] == "Send"
      UserMailer.compose(@send_mail).deliver
      redirect_to send_mails_path
    elsif @send_mail.save && params[:submit] == "Save As Draft"      
      redirect_to draft_mail_send_mails_path
    else
      render 'new'
    end
  end
  
  def draft_mail
    @send_mails = SendMail.all
  end
end
