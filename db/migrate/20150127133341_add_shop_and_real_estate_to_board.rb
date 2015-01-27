# -*- coding: utf-8 -*-
class AddShopAndRealEstateToBoard < ActiveRecord::Migration
  def change
    array = [["売ります", "店舗経営権"],
             ["買います", "店舗経営権"],
             ["売ります", "不動産"],
             ["買います", "不動産"]]
    array.each do |a|
      Board.create(category: a[0], name: a[1])
    end
  end
end
