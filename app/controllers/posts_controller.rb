# -*- coding: utf-8 -*-
class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  respond_to :html

  # def index
  #   @posts = Post.all
  #   respond_with(@posts)
  # end

  def show
    @description = "#{@post.board.name} #{@post.title}"
    @keywords = @post.board.name

    respond_with(@post)
  end

  def new
    @post = Post.new
    @post.images.build
    @board = Board.find(params[:board_id])
    session[:board_id] = @board.id
    respond_with(@post)
  end

  # def edit
  #   @post.images.build
  # end

  def create
    @post = Post.new(post_params)
    @post.user = current_user if current_user
    @board = Board.find(session[:board_id])
    if @post.save
      if params[:post][:images]
        params[:post][:images].each_with_index { |image, i|
          return if i > 2
          @post.images.create(image: image)
        }
      end
      PostMailer.new_post_email(@post).deliver_now
      session[:board_id] = nil
      flash[:notice] = "投稿しました。"
      respond_with(@post, location: board_path(@post.board))
    else
      respond_with(@post)
    end
  end

  # def update
  #   @post.update(post_params)
  #   respond_with(@post)
  # end

  def destroy
    @board = @post.board
    @post.destroy if params[:delete_key].to_a[0][1] == @post.delete_key
    respond_with(@post, location: board_path(@board))
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:board_id, :title, :text, :name, :email, :delete_key, :deleted_at, images_attributes: [:image])
    end
end
