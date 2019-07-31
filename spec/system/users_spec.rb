require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'ログイン・未ログイン共通機能' do
    before do
      create(:color)
      visit home_index_path
    end

    it 'カラー名で検索できること' do
      fill_in 'q_color_name_cont', with: 'ホワイト'
      click_button 'Search'
      expect(page).to have_selector '.name-text', text: 'テストホワイト'
    end

    it 'メーカーを選択して検索できること' do
      select 'テストメーカー', from: 'q_maker_id_eq'
      click_button 'Search'
      expect(page).to have_selector '.name-text', text: 'テストホワイト'
    end
  end

  describe 'ログインしていないとき' do
    before do
      create(:user)
      visit home_index_path
    end

    it 'ログイン' do
      click_link '登録/ログイン'
      fill_in 'user_email', with: 'test@gmail.com'
      fill_in 'user_password', with: 'testps'
      click_button 'ログイン'
      expect(page).to have_current_path '/'
      expect(page).to have_link 'マイカラー'
      expect(page).to have_link 'ログアウト'
    end

    it '新規登録' do
      click_link '登録/ログイン'
      click_link '会員登録はこちらから'
      fill_in 'user_email', with: 'testuser@gmail.com'
      fill_in 'user_password', with: 'testps'
      fill_in 'user_password_confirmation', with: 'testps'
      click_button '登録'
      expect(page).to have_current_path '/'
      expect(page).to have_link 'マイカラー'
      expect(page).to have_link 'ログアウト'
    end

    it '会員専用ページアクセス時,ログイン画面に遷移すること' do
      visit user_path(1)
      expect(page).to have_current_path '/users/sign_in'
    end
  end

  describe 'ログイン時共通' do
    before do
      create(:user)

      visit home_index_path
      click_link '登録/ログイン'
      find('.login-form')
      fill_in 'user_email', with: 'test@gmail.com'
      fill_in 'user_password', with: 'testps'
      click_button 'ログイン'
    end

    it 'ログアウト' do
      click_link 'ログアウト'
      expect(page).to_not have_link 'マイカラー'
      expect(page).to have_link '登録/ログイン'
    end
  end

  describe 'Adminでないユーザーがログインしているとき' do
    before do
      visit home_index_path
      create(:user, admin: false)
      click_link '登録/ログイン'
      fill_in 'user_email', with: 'test@gmail.com'
      fill_in 'user_password', with: 'testps'
      click_button 'ログイン'
    end

    it 'カラー一覧のページへのアクセス時、home/indexにリダイレクトすること' do
      visit colors_path
      expect(page).to have_current_path '/home/index'
    end

    it 'メーカー一覧のページへのアクセス時、home/indexにリダイレクトすること' do
      visit makers_path
      expect(page).to have_current_path '/home/index'
    end
  end

  describe 'Adminユーザーがログインしているとき' do
    before do
      visit home_index_path
      create(:user, admin: true)
      click_link '登録/ログイン'
      fill_in 'user_email', with: 'test@gmail.com'
      fill_in 'user_password', with: 'testps'
      click_button 'ログイン'
    end

    it 'カラー一覧のページへのアクセス' do
      visit colors_path
      expect(page).to have_current_path '/colors'
    end

    it 'メーカー一覧のページへのアクセス' do
      visit makers_path
      expect(page).to have_current_path '/makers'
    end
  end
end
