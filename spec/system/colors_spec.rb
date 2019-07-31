require 'rails_helper'

RSpec.describe 'Colors', type: :system do
  describe 'ログインしていないとき' do
    before do
      visit home_index_path
    end

    it 'マイカラーに登録するボタンが表示されていないこと' do
      expect(page).to have_no_selector('.unlike-icon')
      expect(page).to have_no_selector('.like-icon')
    end

    it 'マイカラーへのリンクが表示されていないこと' do
      expect(page).to have_no_link 'マイカラー'
    end
  end

  describe 'ログイン時' do
    let!(:user) { create(:user) }
    let!(:maker) { create(:maker) }
    let!(:color1) { create(:color, id: 1, color_name: 'テストブラック', color_code: '000000', maker_id: 1) }
    let!(:color2) { create(:color, id: 2, color_name: 'ホワイト', color_code: 'FFFFFF', maker_id: 1) }
    let!(:color3) { create(:color, id: 3, color_name: 'テストレッド', color_code: 'FF0000', maker_id: 1) }
    let!(:color4) { create(:color, id: 4, color_name: 'テストグリーン', color_code: '00FF00', maker_id: 1) }
    let!(:color5) { create(:color, id: 5, color_name: 'テストブルー', color_code: '0000FF', maker_id: 1) }

    before do
      visit home_index_path
      click_link '登録/ログイン'
      find('.login-form')
      fill_in 'user_email', with: 'test@gmail.com'
      fill_in 'user_password', with: 'testps'
      click_button 'ログイン'

      find("#like-button-#{color1.id}").click
      find("#like-button-#{color2.id}").click
      find("#like-button-#{color3.id}").click
      find("#like-button-#{color4.id}").click
      find("#like-button-#{color5.id}").click
    end

    it '選択したパレットにカラーを表示する', js: true do
      click_link 'マイカラー'

      check 'パレット3'
      find("#sel-#{color3.id}").click
      find('#chart1').native
      color3 = find('#chart3').native.css_value('background-color')
      expect(color3).to eq('rgba(255, 0, 0, 1)')

      check 'パレット4'
      find("#sel-#{color4.id}").click
      find('#chart3').native
      color4 = find('#chart4').native.css_value('background-color')
      expect(color4).to eq('rgba(0, 255, 0, 1)')

      check 'パレット5'
      find("#sel-#{color5.id}").click
      find('#chart5').native
      color5 = find('#chart5').native.css_value('background-color')
      expect(color5).to eq('rgba(0, 0, 255, 1)')
    end
  end

  describe 'Adminユーザーログイン時' do
    before do
      visit home_index_path
      create(:user, admin: true)
      click_link '登録/ログイン'
      fill_in 'user_email', with: 'test@gmail.com'
      fill_in 'user_password', with: 'testps'
      click_button 'ログイン'
    end

    it '新規カラー登録' do
      create(:maker)
      visit new_color_path
      fill_in 'color_color_name', with: 'テストブラック'
      fill_in 'color_color_code', with: '000000'
      select 'テストメーカー', from: 'color_maker_id'
      click_button 'Create Color'
      expect(page).to have_selector '.notice', text: '下記のカラーを正常に登録しました。'
    end

    it 'カラー編集' do
      create(:color)
      visit edit_color_path(1)
      fill_in 'color_color_name', with: 'テストライトグレー'
      fill_in 'color_color_code', with: 'eeeeee'
      select 'テストメーカー', from: 'color_maker_id'
      click_button 'Update Color'
      expect(page).to have_selector '.notice', text: 'カラーを更新しました。'
    end

    it 'カラー削除', js: true do
      create(:color)
      visit colors_path
      click_link '削除'
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_selector '.notice', text: '登録されていたカラーを正常に削除しました。'
    end
  end
end
