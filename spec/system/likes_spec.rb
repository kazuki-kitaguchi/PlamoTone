require 'rails_helper'

RSpec.describe 'Likes', type: :system do
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
    fill_in 'user_email', with: 'test@gmail.com'
    fill_in 'user_password', with: 'testps'
    click_button 'ログイン'

    find("#like-button-#{color1.id}").click
    find("#like-button-#{color2.id}").click
    find("#like-button-#{color3.id}").click
    find("#like-button-#{color4.id}").click
    find("#like-button-#{color5.id}").click
  end

  it 'マイカラー登録', js: true do
    click_link 'マイカラー'
    expect(page).to have_current_path "/users/#{user.id}"
    expect(page).to have_selector '.like-del'
    expect(page).to have_selector '.mycolor-name'
  end

  it 'カラー一覧からのマイカラー登録解除', js: true do
    find("#like-button-#{color5.id}").click
    expect(page).to have_selector '.unlike-icon'
  end

  it 'マイページからマイカラー登録解除' do
    click_link 'マイカラー'
    find(".del-#{color3.id}").click
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_selector '.notice', text: 'マイカラーから削除しました。'
  end
end
