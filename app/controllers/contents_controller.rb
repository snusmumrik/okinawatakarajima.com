class ContentsController < ApplicationController
  before_action :set_boards

  def show
    if params[:id] && File.exist?(path = "#{Rails.root.to_s}/app/views/contents/#{params[:id]}.html.erb")
      # case params[:id]
      # when "index"
      #   @description = "" + @@description
      #   @keywords = @@keywords
      #   @title = @@title
      # end
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
