require "spec_helper"

describe UserMailer do
  describe "compose" do
    let(:send_mail) { FactoryGirl.create(:send_mail) }

    before do
      @email = UserMailer.compose(send_mail)
    end

    context "mail" do
      it "should deliver to the subscriber" do
        @email.should deliver_to(send_mail.to)
      end

      it "should contain the user first name in the mail body" do
        @email.should have_body_text(/#{send_mail.body}/)
      end
    end
  end
end