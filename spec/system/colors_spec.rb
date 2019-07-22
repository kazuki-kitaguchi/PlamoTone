require 'rails_helper'

RSpec.describe 'Colors', type: :system do


	describe "ログインしていないとき" do
		it "マイカラーに登録するボタンが表示されていないこと" do
			
		end

		it "マイカラーへのリンクが表示されていないこと" do
			
		end

		it "マイカラーのページへ遷移しようとするとログイン画面に遷移すること" do
			
		end
	end

	describe "ログイン時" do
		let!(:user) { create(:user) }
		let!(:maker) { create(:maker) }
		let!(:color1) { create(:color, id: 1, color_name: "テストブラック", color_code: "000000",maker_id: 1) }
		let!(:color2) { create(:color, id: 2, color_name: "ホワイト", color_code: "FFFFFF",maker_id: 1) }
		let!(:color3) { create(:color, id: 3, color_name: "テストレッド", color_code: "FF0000",maker_id: 1) }
		let!(:color4) { create(:color, id: 4, color_name: "テストグリーン", color_code: "00FF00",maker_id: 1) }
		let!(:color5) { create(:color, id: 5, color_name: "テストブルー", color_code: "0000FF",maker_id: 1) }

		before do
			visit home_index_path
			click_link '登録/ログイン'
			fill_in 'user_email',with: 'test@gmail.com'
			fill_in 'user_password',with: 'testps'
			click_button 'ログイン'
			find("#like-button-#{color1.id}").click
			find("#like-button-#{color2.id}").click
			find("#like-button-#{color3.id}").click
			find("#like-button-#{color4.id}").click
			find("#like-button-#{color5.id}").click
		end

		it "選択したパレットにカラーを表示する", js: true do
			click_link 'マイカラー'

			check 'パレット1'
			find("#sel-#{color1.id}").click
			find('#chart1').native
			color1 = find('#chart1').native.css_value('background-color')

			check 'パレット2'
			find("#sel-#{color2.id}").click
			find('#chart2').native
			color2 = find('#chart2').native.css_value('background-color')

			check 'パレット3'
			find("#sel-#{color3.id}").click
			find('#chart3').native
			color3 = find('#chart3').native.css_value('background-color')

			check 'パレット4'
			find("#sel-#{color4.id}").click
			find('#chart4').native
			color4 = find('#chart4').native.css_value('background-color')

			check 'パレット5'
			find("#sel-#{color5.id}").click
			find('#chart5').native
			color5 = find('#chart5').native.css_value('background-color')

   			expect(color1).to eq('rgba(0, 0, 0, 1)')
   			expect(color2).to eq('rgba(255, 255, 255, 1)')
   			expect(color3).to eq('rgba(255, 0, 0, 1)')
   			expect(color4).to eq('rgba(0, 255, 0, 1)')
   			expect(color5).to eq('rgba(0, 0, 255, 1)')
			page.save_screenshot('mycolor.png')
		end

		it "マイカラーからカラーを削除できること" do
			
		end
	end
 end