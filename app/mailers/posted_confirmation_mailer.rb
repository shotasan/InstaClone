class PostedConfirmationMailer < ApplicationMailer
  def posted_confirmation(post)
    @post = post
    mail to:"wondermoai@gmail.com", subject:"投稿確認メール"
  end
end
