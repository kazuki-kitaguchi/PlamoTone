# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# admin user
User.create( email: ENV['MAIL_ADDRESS'], password: ENV['MAIL_ACCOUNT_PASSWORD'], admin: true )

# Makers
Maker.create( id: 1, maker_name: 'クレオス')
Maker.create( id: 2, maker_name: 'ガイアノーツ')
Maker.create( id: 3, maker_name: 'タミヤ')

#Creos Colors
Color.create( color_name: 'ホワイト', color_code: 'FFFFFF', maker_id: '1', color_number: 'C1' )
Color.create( color_name: 'ブラック', color_code: '231815', maker_id: '1', color_number: 'C2' )
Color.create( color_name: 'レッド', color_code: 'E60012', maker_id: '1', color_number: 'C3' )
Color.create( color_name: 'イエロー', color_code: 'FFE100', maker_id: '1', color_number: 'C4' )
Color.create( color_name: 'ブルー', color_code: '0054A7', maker_id: '1', color_number: 'C5' )
Color.create( color_name: 'グリーン', color_code: '006830', maker_id: '1', color_number: 'C6' )
Color.create( color_name: 'ブラウン', color_code: 'CA3929', maker_id: '1', color_number: 'C7' )
Color.create( color_name: 'シルバー', color_code: 'DCDDDD', maker_id: '1', color_number: 'C8' )
Color.create( color_name: 'ゴールド', color_code: 'DFB603', maker_id: '1', color_number: 'C9' )
Color.create( color_name: 'カッパー', color_code: 'CE722A', maker_id: '1', color_number: 'C10' )
Color.create( color_name: 'ガルグレー', color_code: 'BDC3C4', maker_id: '1', color_number: 'C11' )
Color.create( color_name: 'オリーブドラブ', color_code: '685932', maker_id: '1', color_number: 'C12' )
Color.create( color_name: 'ニュートラルグレー', color_code: '75858D', maker_id: '1', color_number: 'C13' )
Color.create( color_name: 'ネービーブルー', color_code: '004652', maker_id: '1', color_number: 'C14' )
Color.create( color_name: '暗緑色(中島系)', color_code: '00381F', maker_id: '1', color_number: 'C15' )
Color.create( color_name: '濃緑色', color_code: '004D39', maker_id: '1', color_number: 'C16' )
Color.create( color_name: 'RLM71ダークグリーン', color_code: '595A4E', maker_id: '1', color_number: 'C17' )
Color.create( color_name: 'RLM70ブラックグリーン', color_code: '213C50', maker_id: '1', color_number: 'C18' )
Color.create( color_name: 'サンディブラウン', color_code: '9F8237', maker_id: '1', color_number: 'C19' )
Color.create( color_name: 'ライトブルー', color_code: '48BAA0', maker_id: '1', color_number: 'C20' )
Color.create( color_name: 'ミドルストーン', color_code: 'B39242', maker_id: '1', color_number: 'C21' )
Color.create( color_name: 'ダークアース', color_code: '504A3D', maker_id: '1', color_number: 'C22' )
Color.create( color_name: 'ダークグリーン(2)', color_code: '405D48', maker_id: '1', color_number: 'C23' )
Color.create( color_name: 'ダークシーグレー', color_code: '727A5E', maker_id: '1', color_number: 'C25' )

#GaiaNotes Colors
Color.create( color_name: 'ピュアホワイト', color_code: 'FFFFFF', maker_id: '2', color_number: '001' )
Color.create( color_name: 'ピュアブラック', color_code: '000000', maker_id: '2', color_number: '002' )
Color.create( color_name: 'ブライトレッド', color_code: 'FF0000', maker_id: '2', color_number: '003' )
Color.create( color_name: 'ウルトラブルー', color_code: '144EA2', maker_id: '2', color_number: '004' )
Color.create( color_name: 'サンシャインイエロー', color_code: 'FFFF00', maker_id: '2', color_number: '005' )
Color.create( color_name: 'ブラットベース', color_code: 'E0E0E0', maker_id: '2', color_number: '006' )
Color.create( color_name: 'ブライトシルバー', color_code: '727A7D', maker_id: '2', color_number: '009' )
Color.create( color_name: 'ブライトゴールド', color_code: '905C20', maker_id: '2', color_number: '041' )

#Tamiya Colors
# Color.create( color_name: '', color_code: '', maker_id: '3', color_number: '' )