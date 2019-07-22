require 'rails_helper'

RSpec.describe 'Users', type: :system do

	describe "ログイン・未ログイン共通機能" do
		before do
			create(:color)
			visit home_index_path
		end

		it "カラー名で検索できること" do
			fill_in 'q_color_name_cont', with: 'ホワイト'
			click_button "Search"
			expect(page).to have_selector '.name-text', text: "テストホワイト"
			page.save_screenshot('screenshot.png')
		end

		it "メーカーを選択して検索できること" do
			select 'テストメーカー', from: 'q_maker_id_eq'
			click_button "Search"
			expect(page).to have_selector '.name-text', text: "テストホワイト"
		end
	end

	describe "ログインしていないとき" do
		before do
			visit home_index_path
			create(:user)
		end

		it "登録/ログインボタンが表示されること" do
			expect(page).to have_link '登録/ログイン'
		end

		it "ログイン" do
			click_link '登録/ログイン'
			find(".login-form")
			fill_in 'user_email',with: 'test@gmail.com'
			fill_in 'user_password',with: 'testps'
			click_button 'ログイン'
			expect(page).to have_current_path "/"
			expect(page).to have_link 'マイカラー'
			expect(page).to have_link 'ログアウト'
			page.save_screenshot('login.png')
		end

		it "新規登録" do
			click_link '登録/ログイン'
			click_link '会員登録はこちらから'
			fill_in 'user_email',with: 'testuser@gmail.com'
			fill_in 'user_password',with: 'testps'
			fill_in 'user_password_confirmation',with: 'testps'
			click_button '登録'
			expect(page).to have_current_path "/"
			expect(page).to have_link 'マイカラー'
			expect(page).to have_link 'ログアウト'
		end

		it "会員専用ページアクセス時のリダイレクト" do
			visit user_path(1)
			expect(page).to have_current_path "/users/sign_in"
		end
	end

	describe "ログイン時共通" do
		before do
			visit home_index_path
			@user = create(:user)
			create(:maker)
			@color = create(:color, id: 2, color_name: "グリーン", color_code: "00FF00",maker_id: 1)
			click_link '登録/ログイン'
			fill_in 'user_email',with: 'test@gmail.com'
			fill_in 'user_password',with: 'testps'
			click_button 'ログイン'
		end

		it "マイカラー登録", js: true do
			visit home_index_path
			expect(page).to have_selector ".unlike-icon"
			expect(page).to have_no_selector ".like-icon"
			expect(page).to have_current_path "/home/index"
			expect(page).to have_css("#like-button-#{@color.id}")
			
			find("#like-button-#{@color.id}").click
			# visit home_index_path
			expect(page).to have_selector ".like-icon"
			page.save_screenshot('color_like.png')
		end

		it "マイカラー表示" do
			like = create(:like, color_id: 2,user_id: 1)
			click_link "マイカラー"
			expect(page).to have_current_path "/users/#{like.user_id}"
			expect(page).to have_selector ".like-del"
			expect(page).to have_selector ".mycolor-name", text: "グリーン"
		end

		it "マイカラー登録解除", js: true do
			like = create(:like, color_id: 2,user_id: 1)
			click_link "マイカラー"
		    click_link "×"
		    page.driver.browser.switch_to.alert.accept
		    expect(page).to have_selector ".notice",text: "マイカラーから削除しました。"
		end

		it "ログアウト" do
			click_link 'ログアウト'
			expect(page).to have_current_path "/"
			expect(page).to_not have_link 'マイカラー'
			expect(page).to have_link '登録/ログイン'
		end
	end

	describe "Adminでないユーザーがログインしているとき" do
		before do
			visit home_index_path
			create(:user,admin: false)
			click_link '登録/ログイン'
			fill_in 'user_email',with: 'test@gmail.com'
			fill_in 'user_password',with: 'testps'
			click_button 'ログイン'
		end

		it "カラー一覧のページへのアクセス時、home/indexにリダイレクトすること" do
			visit colors_path
			expect(page).to have_current_path "/home/index"
		end

		it "新規カラー追加のページへのアクセス時、home/indexにリダイレクトすること" do
			visit new_color_path
			expect(page).to have_current_path "/home/index"
		end

		it "メーカー一覧のページへのアクセス時、home/indexにリダイレクトすること" do
			visit makers_path
			expect(page).to have_current_path "/home/index"
		end

		it "新規メーカー追加のページへのアクセス時、home/indexにリダイレクトすること" do
			visit new_maker_path
			expect(page).to have_current_path "/home/index"
		end
  	end

  	describe "Adminユーザーがログインしているとき" do
  		before do
	  		visit home_index_path
			create(:user,admin: true)
			click_link '登録/ログイン'
			fill_in 'user_email',with: 'test@gmail.com'
			fill_in 'user_password',with: 'testps'
			click_button 'ログイン'
		end

		it "カラー一覧のページへのアクセス" do
			visit colors_path
			expect(page).to have_current_path "/colors"
		end

		it "新規カラー登録" do
			create(:maker)
			visit new_color_path
			fill_in 'color_color_name', with: 'テストブラック'
			fill_in 'color_color_code', with: '000000'
			select 'テストメーカー', from: 'color_maker_id'
			click_button 'Create Color'
			expect(page).to have_selector '.notice', text: "下記のカラーを正常に登録しました。"
		end

		it "カラー編集" do
			create(:color)
			visit edit_color_path(1)
			fill_in 'color_color_name', with: 'テストライトグレー'
			fill_in 'color_color_code', with: 'eeeeee'
			select 'テストメーカー', from: 'color_maker_id'
			click_button 'Update Color'
			expect(page).to have_selector '.notice', text: "カラーを更新しました。"
		end

		it "カラー削除",js: true do
			create(:color)
			visit colors_path
			click_link '削除'
			page.driver.browser.switch_to.alert.accept
			expect(page).to have_selector '.notice', text: "登録されていたカラーを正常に削除しました。"
		end

		it "メーカー一覧のページへのアクセス" do
			visit makers_path
			expect(page).to have_current_path "/makers"
		end

		it "新規メーカー登録" do
			visit new_maker_path
			fill_in 'maker_maker_name', with: 'テストブランド'
			click_button 'Create Maker'
			expect(page).to have_selector '.notice', text: "下記のメーカーを正常に登録しました。"
		end

		it "メーカー編集" do
			create(:maker)
			visit edit_maker_path(1)
			fill_in 'maker_maker_name', with: 'テストMaker'
			click_button 'Update Maker'
			expect(page).to have_selector '.notice', text: "メーカーを更新しました。"
		end

		it "メーカー削除",js: true do
			create(:maker)
			visit makers_path
			click_link '削除'
			page.driver.browser.switch_to.alert.accept
			expect(page).to have_selector '.notice', text: "登録されていたメーカーを正常に削除しました。"
		end
  	end
 end