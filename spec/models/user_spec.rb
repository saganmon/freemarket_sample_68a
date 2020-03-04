require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    context 'can save' do
      it "全てのカラムに適切なバリーデーションがかかってること" do
        user = build(:user)
        user.valid?
        expect(user).to be_valid
      end
    end

    context 'can not save' do
      it "ニックネームが必須" do
        user = build(:user, nickname: "")
        user.valid?
        expect(user.errors[:nickname]).to include("を入力してください")
      end

      it "メールアドレスは@とドメインを含む必要がある" do
        user = build(:user, email: "aaa")
        user.valid?
        expect(user.errors[:email]).to include("は不正な値です")
      end

      # --------------------------------------------------------
      # スプリントレビューで指摘を受け追加
      it "メールアドレスは有効なドメイン名を含む必要がある" do
        user = build(:user, email: "ggg@gmail.com")
        user.valid?
        expect(user.errors[:email]).to include("は不正な値です")
      end
      # --------------------------------------------------------

      it "パスワードが必須" do
        user = build(:user, password: "")
        user.valid?
        expect(user.errors[:password]).to include("を入力してください")
      end

      it "パスワードは7文字以上" do
        user = build(:user, password: "aaa111")
        user.valid?
        expect(user.errors[:password]).to include("は7文字以上で入力してください")
      end

      it "パスワードは確認用を含めて2回入力する" do
        user = build(:user, password: "aaa1111", password_confirmation: "aaa1112")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
      end

      it "ユーザー本名が、名字と名前でそれぞれ必須" do
        user = build(:user, first_name: "" , last_name: "")
        user.valid?
        expect(user.errors[:first_name]).to include("を入力してください")
        expect(user.errors[:last_name]).to include("を入力してください")
      end

      it "ユーザー本名は全角で入力させる" do
        user = build(:user, first_name: "ﾐｳﾗ", last_name: "ｲｯｾｲ" )
        user.valid?
        expect(user.errors[:first_name]).to include("は不正な値です")
        expect(user.errors[:last_name]).to include("は不正な値です")
      end

      it "ユーザー本名のふりがなが、名字と名前でそれぞれ必須" do
        user = build(:user, first_name_kana: "", last_name_kana: "" )
        user.valid?
        expect(user.errors[:first_name_kana]).to include("を入力してください")
      end

      it "ユーザー本名のふりがなは全角で入力させる" do
        user = build(:user, first_name_kana: "ﾐｳﾗ", last_name_kana: "ｲｯｾｲ" )
        user.valid?
        expect(user.errors[:first_name_kana]).to include("は不正な値です")
      end

      it "生年月日が空で登録できない" do
        user = build(:user, birthday_year: "", birthday_month: "", birthday_date: "",)
        user.valid?
        expect(user.errors[:birthday_year]).to include("を入力してください")
        expect(user.errors[:birthday_month]).to include("を入力してください")
        expect(user.errors[:birthday_date]).to include("を入力してください")
      end
    end
  end
end