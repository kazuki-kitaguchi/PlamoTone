require 'rails_helper'

RSpec.describe Color, type: :model do
  context 'バリデーション' do
    before do
      create(:maker)
      @color = build(:color)
    end
    it 'color_id,color_name,color_code,maker_idがあれば有効であること' do
      expect(@color.valid?).to eq(true)
    end

    it 'color_nameが無ければ無効であること' do
      @color.color_name = nil
      expect(@color.valid?).to eq(false)
    end

    it 'color_codeが無ければ無効であること' do
      @color.color_code = nil
      expect(@color.valid?).to eq(false)
    end

    it 'color_codeは6文字で無ければ無効であること' do
      @color.color_code = 'FFFFF'
      expect(@color.valid?).to eq(false)
    end

    it 'color_codeは0-9,a-f,A-F以外の文字は無効であること' do
      @color.color_code = 'FFFFFG'
      expect(@color.valid?).to eq(false)
    end

    it 'maker_idが無ければ無効であること' do
      @color.maker_id = nil
      expect(@color.valid?).to eq(false)
    end
  end
end
