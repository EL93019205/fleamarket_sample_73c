require 'rails_helper'

describe Credit do
  describe '#create' do
    context '有効なテスト' do
      it '全項目の入力' do
        credit = build(:credit)
        expect(credit).to be_valid
      end
    end

    context '無効なテスト' do
      it 'payjpのcard_idの未設定' do
        credit = build(:credit, card_id: nil)
        credit.valid?
        expect(credit.errors[:card_id]).to include('を入力してください')
      end
      it 'payjpのcustomer_idの未設定' do
        credit = build(:credit, customer_id: nil)
        credit.valid?
        expect(credit.errors[:customer_id]).to include('を入力してください')
      end
    end
  end
end
