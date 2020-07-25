require 'rails_helper'

describe Purchase do
  describe '#create' do
    context '有効なテスト' do
      it '全項目の入力' do
        purchase = build(:purchase)
        expect(purchase).to be_valid
      end
    end
    context '無効なテスト' do
    end
  end
end
