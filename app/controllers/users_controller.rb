# -*- coding: utf-8 -*-
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authenticate_ownership, except: :show

  respond_to :html

  def show
    @hash = Gmaps4rails.build_markers(@user) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow "#{user.name}<br>#{user.address}"
      marker.json({title: user.name})
    end
    respond_with(@user)
  end

  def edit
    @user.images.build
  end

  def update
    @user.update(user_params)
    @user.save
    flash[:notice] = "ユーザー情報を更新しました。"
    respond_with(@user)
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :tel, :address, :site, :business_hour, :holiday, images_attributes: [:image])
  end

  def authenticate_ownership
    redirect_to root_path unless user_signed_in? && @user == current_user
  end
end
