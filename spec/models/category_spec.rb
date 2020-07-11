require 'rails_helper'

describe Category do
  describe '#create' do
    context '有効なテスト' do
      it '全項目の入力' do
        category = build(:category)
        expect(category).to be_valid
      end
      it 'ancestryがnilでも大丈夫であるかの確認' do
        category = build(:category, ancestry: nil)
        expect(category).to be_valid
      end
    end
    context '無効なテスト' do
      it 'カテゴリー名が未入力' do
        category = build(:category, name: nil)
        category.valid?
        expect(category.errors[:name]).to include('を入力してください')
      end
    end
  end
end