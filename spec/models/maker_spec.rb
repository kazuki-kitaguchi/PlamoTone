require 'rails_helper'

RSpec.describe Maker, type: :model do
  describe 'バリデーション' do
    before do
      @maker = build(:maker)
    end
    it 'id,maker_nameがあれば有効であること' do
      expect(@maker.valid?).to eq(true)
    end

    it 'maker_nameが規定の文字数以上の場合無効であること' do
      @maker.maker_name = 'ああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ'
      expect { @maker.save }.to raise_error(ActiveRecord::ValueTooLong)
    end

    it 'maker_nameが無ければ無効であること' do
      @maker.maker_name = nil
      expect(@maker.valid?).to eq(false)
    end
  end

  describe 'リレーション' do
    context 'メーカーが削除された時' do
      it 'メーカーに属しているカラーが削除されること' do
        color = create(:color)
        expect { color.maker.destroy }.to change { Color.count }.from(1).to(0)
        expect { color.maker.reload }.to raise_error(ActiveRecord::RecordNotFound)
      end
      it 'マイカラーから削除されること' do
        like = create(:like)
        expect { like.color.maker.destroy }.to change { Like.count }.from(1).to(0)
        expect { like.color.maker.reload }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
