require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーション' do
    before do
      @user = build(:user)
    end

    it 'email,passwordがあれば有効であること' do
      expect(@user.valid?).to eq(true)
    end

    it 'emailが無ければ無効であること' do
      @user.email = nil
      expect(@user.valid?).to eq(false)
    end

    it 'passwordが無ければ無効であること' do
      @user.password = nil
      expect(@user.valid?).to eq(false)
    end

    it 'passwordは6文字未満であれば無効であること' do
      @user.password = 'testp'
      expect(@user.valid?).to eq(false)
    end

    it '重複したemailは無効であること' do
      @user.password = 'test@gmail.com'
      @user.save
      other_user = build(:user, email: 'test@gmail.com')
      expect(other_user.valid?).to eq(false)
    end

    it 'adminはFalseであること' do
      @user.admin = false
      expect(@user.valid?).to eq(true)
    end
  end
end
