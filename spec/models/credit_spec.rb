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
      it '名前の未入力' do
        credit = build(:credit, card_fullname: nil)
        credit.valid?
        expect(credit.errors[:card_fullname]).to include('を入力してください')
      end

      it '名前の不正値入力' do
        credit = build(:credit, card_fullname: 'TAROUYAMADA')
        credit.valid?
        expect(credit.errors[:card_fullname]).to include('を半角アルファベット(大文字)で入力してください')
      end

      it 'カード番号の未入力' do
        credit = build(:credit, card_number: nil)
        credit.valid?
        expect(credit.errors[:card_number]).to include('を入力してください')
      end

      it 'カード番号の全角入力' do
        credit = build(:credit, card_number: '００００００００００００００００')
        credit.valid?
        expect(credit.errors[:card_number]).to include('を半角数字で入力してください')
      end

      it 'カード番号の入力文字数超過' do
        credit = build(:credit, card_number: '00000000000000000')
        credit.valid?
        expect(credit.errors[:card_number]).to include('は16文字以内で入力してください')
      end

      it 'カード番号の重複' do
        credit = create(:credit)
        another_credit = build(:credit, card_number: credit.card_number)
        another_credit.valid?
        expect(another_credit.errors[:card_number]).to include('はすでに存在します')
      end

      it 'セキュリティーコードの未入力' do
        credit = build(:credit, security_code: nil)
        credit.valid?
        expect(credit.errors[:security_code]).to include('を入力してください')
      end

      it 'セキュリティーコードの全角入力' do
        credit = build(:credit, security_code: '００００')
        credit.valid?
        expect(credit.errors[:security_code]).to include('を半角数字で入力してください')
      end

      it 'セキュリティーコードの入力文字数超過' do
        credit = build(:credit, security_code: '00000')
        credit.valid?
        expect(credit.errors[:security_code]).to include('は4文字以内で入力してください')
      end

      it '有効期限の未入力' do
        credit = build(:credit, expiration: nil)
        credit.valid?
        expect(credit.errors[:expiration]).to include('を入力してください')
      end
    end
  end
end
