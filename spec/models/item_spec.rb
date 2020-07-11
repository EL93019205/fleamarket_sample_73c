require 'rails_helper'

describe Item do
  describe '#create' do
    context '有効なテスト' do
      it '全項目の入力' do
        item = build(:item)
        item.images.new
        expect(item).to be_valid
      end
      it 'ブランドが入力されていない' do
        item = build(:item, brand: nil)
        item.images.new
        expect(item).to be_valid
      end
    end
    context '無効なテスト' do
      it '画像が選択されていない' do
        item = build(:item)
        item.valid?
        expect(item.errors[:images]).to include('を最低1枚選択してください')
      end
      it '商品名が入力されていない' do
        item = build(:item, name: nil)
        item.images.new
        item.valid?
        expect(item.errors[:name]).to include('を入力してください')
      end
      it '商品説明が入力されていない' do
        item = build(:item, introduction: nil)
        item.images.new
        item.valid?
        expect(item.errors[:introduction]).to include('を入力してください')
      end
      it '値段が入力されていない' do
        item = build(:item, price: nil)
        item.images.new
        item.valid?
        expect(item.errors[:price]).to include('は半角数字を入力してください')
      end
      it '値段が半角数字でない' do
        item = build(:item, price: "あ")
        item.images.new
        item.valid?
        expect(item.errors[:price]).to include('は半角数字を入力してください')
      end
      it '値段が0円以下' do
        item = build(:item, price: -1)
        item.images.new
        item.valid?
        expect(item.errors[:price]).to include('は0より大きくなければなりません')
      end
      it '商品の状態が選択されていない(初期値)' do
        item = build(:item, condition: "選択してください")
        item.images.new
        item.valid?
        expect(item.errors[:condition]).to include('を選択してください')
      end
      it '配送地域が選択されていない(初期値)' do
        item = build(:item, shipping_area: "選択してください")
        item.images.new
        item.valid?
        expect(item.errors[:shipping_area]).to include('を選択してください')
      end
      it '配送日数が選択されていない(初期値)' do
        item = build(:item, shipping_days: "選択してください")
        item.images.new
        item.valid?
        expect(item.errors[:shipping_days]).to include('を選択してください')
      end
      it '配送料が選択されていない(初期値)' do
        item = build(:item, shipping_price: "選択してください")
        item.images.new
        item.valid?
        expect(item.errors[:shipping_price]).to include('を選択してください')
      end
      it '商品の状態が選択されていない(nil)' do
        item = build(:item, condition: nil)
        item.images.new
        item.valid?
        expect(item.errors[:condition]).to include('を入力してください')
      end
      it '配送地域が選択されていない(nil)' do
        item = build(:item, shipping_area: nil)
        item.images.new
        item.valid?
        expect(item.errors[:shipping_area]).to include('を入力してください')
      end
      it '配送日数が選択されていない(nil)' do
        item = build(:item, shipping_days: nil)
        item.images.new
        item.valid?
        expect(item.errors[:shipping_days]).to include('を入力してください')
      end
      it '配送料が選択されていない(nil)' do
        item = build(:item, shipping_price: nil)
        item.images.new
        item.valid?
        expect(item.errors[:shipping_price]).to include('を入力してください')
      end
    end
  end
end