# -*- coding: utf-8 -*-

class RepliesController < ApplicationController
  before_action :set_reply, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @replies = Reply.all
    respond_with(@replies)
  end

  def show
    respond_with(@reply)
  end

  def new
    @reply = Reply.new
    @post = Post.find(params[:post_id])
    session[:post_id] = @post.id
    respond_with(@reply)
  end

  def edit
  end

  def create
    @reply = Reply.new(reply_params)
    @reply.user == current_user if current_user
    @post = Post.find(session[:post_id])

    body = @reply.text
    jp_length = body.gsub(/[a-zA-Z0-9,.;:'"_\[\]<>\/= ]/, "").to_s.split(//).size
    raise jp_length.inspect
    body_length = body.split(//).size

    if jp_length < body_length * 0.2
      flash[:alert] = "スパム投稿防止の為、受け付けできません。"
      redirect_to root_path
    elsif @reply.save
      ReplyMailer.new_reply_email(@reply).deliver_now
      ReplyMailer.reply_notification_email(@reply).deliver_now

      session[:post_id] = nil
      flash[:notice] = "返信しました。ご利用ありがとうございました！"
      respond_with(@post, location: board_path(@post.board))
    else
      respond_with(@reply)
    end
  end

  def update
    @reply.update(reply_params)
    respond_with(@reply)
  end

  def destroy
    @reply.destroy
    respond_with(@reply)
  end

  private
  def set_reply
    @reply = Reply.find(params[:id])
  end

  def reply_params
    params.require(:reply).permit(:user_id, :post_id, :name, :email, :text)
  end
end
