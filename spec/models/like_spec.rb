require 'rails_helper'

RSpec.describe Like, type: :model do
  context 'Like' do
    it '登録されているカラーをいいねしていない場合、そのカラーをいいねできること' do
      like = create(:like)
      expect(like.valid?).to eq(true)
    end
  end
end
