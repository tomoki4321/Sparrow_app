class PostMailer < ApplicationMailer
  def post_mail(post)
    @post = post

    mail to: 'benzousan7@gmail.com', subject: "お問い合わせの確認メール"
  end
end
