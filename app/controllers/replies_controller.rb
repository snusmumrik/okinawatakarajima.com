# -*- coding: utf-8 -*-

class RepliesController < ApplicationController
  before_action :set_reply, only: [:show, :edit, :update, :destroy]
  before_action :validate_simple_captcha, only: [:create]

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

    if @reply.save
      ReplyMailer.new_reply_email(@reply).deliver_now
      ReplyMailer.reply_notification_email(@reply).deliver_now

      session[:post_id] = nil
      flash[:notice] = "返信メールを送信しました。。"
      respond_with(@post, location: board_path(@post.board), notice: "返信しました。")
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
    params.require(:reply).permit(:user_id, :post_id, :name, :email, :text, :captcha, :captcha_key)
  end

  def validate_simple_captcha
    unless simple_captcha_valid?
      flash[:alert] = t("simple_captcha.message.default")
      redirect_to "#{new_reply_path}/#{session[:post_id]}"
    end
  end
end
