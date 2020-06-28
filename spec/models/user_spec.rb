require 'rails_helper'

describe User do
  describe '#create' do
    context '有効なテスト' do
      it '全項目の入力' do
        user = build(:user)
        expect(user).to be_valid
      end

      it 'マンション名・ビル名・部屋番号の未入力' do
        user = build(:user, building_name: nil)
        expect(user).to be_valid
      end

      it '電話番号の未入力' do
        user = build(:user, phone_number: nil)
        expect(user).to be_valid
      end
    end

    context '無効なテスト' do
      it 'ニックネームの未入力' do
        user = build(:user, nickname: nil)
        user.valid?
        expect(user.errors[:nickname]).to include('を入力してください')
      end

      it 'メールアドレスの未入力' do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include('を入力してください')
      end

      it 'メールアドレスの重複' do
        user = create(:user)
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include('はすでに存在します')
      end

      it 'パスワードの未入力' do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include('を入力してください')
      end

      it '6文字以下のパスワード' do
        user = build(:user, password: '000000', password_confirmation: '000000')
        user.valid?
        expect(user.errors[:password]).to include('は7文字以上で入力してください')
      end

      it '確認用パスワードの未入力' do
        user = build(:user, password_confirmation: nil)
        user.valid?
        expect(user.errors[:password_confirmation]).to include('を入力してください')
      end

      it '確認用パスワードの不一致' do
        user = build(:user, password_confirmation: "00000000")
        user.valid?
        expect(user.errors[:password_confirmation]).to include('とパスワードの入力が一致しません')
      end

      it 'ユーザー本名(苗字)の未入力' do
        user = build(:user, family_name: nil)
        user.valid?
        expect(user.errors[:family_name]).to include('を入力してください')
      end

      it 'ユーザー本名(苗字)の不正値入力' do
        user = build(:user, family_name: "ﾔﾏﾀﾞ")
        user.valid?
        expect(user.errors[:family_name]).to include('全角で入力してください')
      end

      it 'ユーザー本名(名前)の未入力' do
        user = build(:user, first_name: nil)
        user.valid?
        expect(user.errors[:first_name]).to include('を入力してください')
      end

      it 'ユーザー本名(名前)の不正値入力' do
        user = build(:user, first_name: "ﾀﾛｳ")
        user.valid?
        expect(user.errors[:first_name]).to include('全角で入力してください')
      end

      it 'ユーザー本名(苗字カナ)の未入力' do
        user = build(:user, family_name_kana: nil)
        user.valid?
        expect(user.errors[:family_name_kana]).to include('を入力してください')
      end

      it 'ユーザー本名(苗字カナ)の不正値入力' do
        user = build(:user, family_name_kana: "やまだ")
        user.valid?
        expect(user.errors[:family_name_kana]).to include('全角カタカナで入力してください')
      end

      it 'ユーザー本名(名前カナ)の未入力' do
        user = build(:user, first_name_kana: nil)
        user.valid?
        expect(user.errors[:first_name_kana]).to include('を入力してください')
      end

      it 'ユーザー本名(名前カナ)の不正値入力' do
        user = build(:user, first_name_kana: "たろう")
        user.valid?
        expect(user.errors[:first_name_kana]).to include('全角カタカナで入力してください')
      end

      it '生年月日の未入力' do
        user = build(:user, birthday: nil)
        user.valid?
        expect(user.errors[:birthday]).to include('を入力してください')
      end

      it '送付先氏名(苗字)の未入力' do
        user = build(:user, d_family_name: nil)
        user.valid?
        expect(user.errors[:d_family_name]).to include('を入力してください')
      end

      it '送付先氏名(苗字)の不正値入力' do
        user = build(:user, d_family_name: "ﾔﾏﾀﾞ")
        user.valid?
        expect(user.errors[:d_family_name]).to include('全角で入力してください')
      end

      it '送付先氏名(名前)の未入力' do
        user = build(:user, d_first_name: nil)
        user.valid?
        expect(user.errors[:d_first_name]).to include('を入力してください')
      end

      it '送付先氏名(名前)の不正値入力' do
        user = build(:user, d_first_name: "ﾀﾛｳ")
        user.valid?
        expect(user.errors[:d_first_name]).to include('全角で入力してください')
      end

      it '送付先氏名(苗字カナ)の未入力' do
        user = build(:user, d_family_name_kana: nil)
        user.valid?
        expect(user.errors[:d_family_name_kana]).to include('を入力してください')
      end

      it '送付先氏名(苗字カナ)の不正値入力' do
        user = build(:user, d_family_name_kana: "やまだ")
        user.valid?
        expect(user.errors[:d_family_name_kana]).to include('全角カタカナで入力してください')
      end

      it '送付先氏名(名前カナ)の未入力' do
        user = build(:user, d_first_name_kana: nil)
        user.valid?
        expect(user.errors[:d_first_name_kana]).to include('を入力してください')
      end

      it '送付先氏名(名前カナ)の不正値入力' do
        user = build(:user, d_first_name_kana: "たろう")
        user.valid?
        expect(user.errors[:d_first_name_kana]).to include('全角カタカナで入力してください')
      end

      it '郵便番号の未入力' do
        user = build(:user, zipcode: nil)
        user.valid?
        expect(user.errors[:zipcode]).to include('を入力してください')
      end

      it 'ハイフン有りの郵便番号の未入力' do
        user = build(:user, zipcode: "000-0000")
        user.valid?
        expect(user.errors[:zipcode]).to include('ハイフン(-)無しで７桁の半角数字で入力してください')
      end

      it '都道府県の未入力' do
        user = build(:user, prefecture: nil)
        user.valid?
        expect(user.errors[:prefecture]).to include('を入力してください')
      end

      it '市区町村の未入力' do
        user = build(:user, city: nil)
        user.valid?
        expect(user.errors[:city]).to include('を入力してください')
      end

      it '番地の未入力' do
        user = build(:user, address: nil)
        user.valid?
        expect(user.errors[:address]).to include('を入力してください')
      end
    end
  end
end
