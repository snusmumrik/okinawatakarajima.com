# -*- coding: utf-8 -*-
class PostMailer < ApplicationMailer
  def new_post_email(post)
    @post = post
    mail(to: @post.email, subject: "【沖縄宝島】ご投稿ありがとうございました") if @post.email
  end
end
