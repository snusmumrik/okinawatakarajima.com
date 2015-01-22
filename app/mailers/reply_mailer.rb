# -*- coding: utf-8 -*-
class ReplyMailer < ApplicationMailer
  def new_reply_email(reply)
    @reply = reply
    mail(to: @reply.email, subject: "【沖縄宝島】ご利用ありがとうございました")
  end

  def reply_notification_email(reply)
    @reply = reply
    @post = @reply.post
    mail(to: @post.email, subject: "【沖縄宝島】投稿に対して返信がありました")
  end
end
