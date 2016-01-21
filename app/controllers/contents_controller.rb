# -*- coding: utf-8 -*-
class ContentsController < ApplicationController
  before_action :set_boards

  def index
    @description = ""
    @keywords = "工具,電化製品,バイク,車,チケット,子供服,時計,カメラ"
    @posts = Post.order("created_at DESC").limit(9)
  end

  def show
    if params[:id] && File.exist?(path = "#{Rails.root.to_s}/app/views/contents/#{params[:id]}.html.haml")
      case params[:id]
      when "rules"
        @description = "ルール・免責事項"
        @keywords = "ルール・免責事項"
      when "faq"
        @description = "よくある質問"
        @keywords = "よくある質問"
      end
      render :file => path, :layout => true
    else
      render :text => "Page does not exists.", :status => 404
    end
  end

  private
  def set_boards
    @board_hash = Board.all.inject(Hash.new) {|h, b| h["#{b.category} #{b.name}"] = b.id; h} if params[:id].nil?
  end
end
