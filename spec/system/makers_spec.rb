require 'rails_helper'

RSpec.describe 'Makers', type: :system do
  describe 'Adminユーザーによるメーカー編集' do
    before do
      visit home_index_path
      create(:user, admin: true)
      click_link '登録/ログイン'
      fill_in 'user_email', with: 'test@gmail.com'
      fill_in 'user_password', with: 'testps'
      click_button 'ログイン'
    end

    it '新規メーカー登録' do
      visit new_maker_path
      fill_in 'maker_maker_name', with: 'テストブランド'
      click_button 'Create Maker'
      expect(page).to have_selector '.notice', text: '下記のメーカーを正常に登録しました。'
    end

    it 'メーカー編集' do
      create(:maker)
      visit edit_maker_path(1)
      fill_in 'maker_maker_name', with: 'テストMaker'
      click_button 'Update Maker'
      expect(page).to have_selector '.notice', text: 'メーカーを更新しました。'
    end

    it 'メーカー削除', js: true do
      create(:maker)
      visit makers_path
      click_link '削除'
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_selector '.notice', text: '登録されていたメーカーを正常に削除しました。'
    end
  end
end
