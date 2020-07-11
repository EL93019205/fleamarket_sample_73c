require 'rails_helper'

describe Image do
  describe '#create' do
    context '有効なテスト' do
      it '全項目の入力' do
        image = build(:image)
        expect(image).to be_valid
      end
    end
  end
end