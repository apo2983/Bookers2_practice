class ThanksMailer < ApplicationMailer
  default :from => "apo2983goldbird22@gmail.com"

  def send_signup_email(name)
    @greeting = "Hi"
    @name = name
    mail( :to => "saiga.kazuya.infratop@gmail.com", :subject => "会員登録が完了しました。")
  end
end
