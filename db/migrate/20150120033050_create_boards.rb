# -*- coding: utf-8 -*-
class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :category
      t.string :name
      t.datetime :deleted_at

      t.timestamps null: false
    end

    array = [["売ります", "ベビー用品"],
             ["買います", "ベビー用品"],
             ["売ります", "子供用品"],
             ["買います", "子供用品"],
             ["売ります", "靴"],
             ["買います", "靴"],
             ["売ります", "アクセサリー"],
             ["買います", "アクセサリー"],
             ["売ります", "時計"],
             ["買います", "時計"],
             ["売ります", "衣類"],
             ["買います", "衣類"],
             ["売ります", "帽子・キャップ"],
             ["買います", "帽子・キャップ"],
             ["売ります", "カバン・バッグ"],
             ["買います", "カバン・バッグ"],
             ["売ります", "本・雑誌"],
             ["買います", "本・雑誌"],
             ["売ります", "音楽・機材・楽器"],
             ["買います", "音楽・機材・楽器"],
             ["売ります", "ゲーム／本体・ソフト/玩具"],
             ["買います", "ゲーム／本体・ソフト/玩具"],
             ["売ります", "フィギュア"],
             ["買います", "フィギュア"],
             ["売ります", "ホビー・コレクション"],
             ["買います", "ホビー・コレクション"],
             ["売ります", "家具・インテリア"],
             ["買います", "家具・インテリア"],
             ["売ります", "電化製品"],
             ["買います", "電化製品"],
             ["売ります", "カメラ"],
             ["買います", "カメラ"],
             ["売ります", "パソコン／本体・周辺機器・ソフト"],
             ["買います", "パソコン／本体・周辺機器・ソフト"],
             ["売ります", "携帯電話"],
             ["買います", "携帯電話"],
             ["売ります", "食器・台所用品"],
             ["買います", "食器・台所用品"],
             ["売ります", "飲料・食品"],
             ["買います", "飲料・食品"],
             ["売ります", "美容・健康・ダイエット"],
             ["買います", "美容・健康・ダイエット"],
             ["売ります", "介護用品"],
             ["買います", "介護用品"],
             ["売ります", "スポーツ用品"],
             ["買います", "スポーツ用品"],
             ["売ります", "ゴルフ用品"],
             ["買います", "ゴルフ用品"],
             ["売ります", "バイク／車体"],
             ["買います", "バイク／車体"],
             ["売ります", "バイク／パーツ"],
             ["買います", "バイク／パーツ"],
             ["売ります", "車／車両"],
             ["買います", "車／車両"],
             ["売ります", "車／パーツ"],
             ["買います", "車／パーツ"],
             ["売ります", "自転車"],
             ["買います", "自転車"],
             ["売ります", "船舶・ボート・マリン用品"],
             ["買います", "船舶・ボート・マリン用品"],
             ["売ります", "キャンプ・アウトドア"],
             ["買います", "キャンプ・アウトドア"],
             ["売ります", "釣具"],
             ["買います", "釣具"],
             ["売ります", "園芸"],
             ["買います", "園芸"],
             ["売ります", "魚類・虫類・ペット用品"],
             ["買います", "魚類・虫類・ペット用品"],
             ["売ります", "チケット・金券"],
             ["買います", "チケット・金券"],
             ["売ります", "店舗・業務用・オフィス用品"],
             ["買います", "店舗・業務用・オフィス用品"],
             ["売ります", "工具・中古機器"],
             ["買います", "工具・中古機器"],
             ["売ります", "建築資材"],
             ["買います", "建築資材"],
             [nil, "仕事を依頼したい・仕事引き受けます"],
             [nil, "引き取ります・買い取ります"]]

    array.each do |a|
      Board.create(category: a[0], name: a[1])
    end
  end
end
