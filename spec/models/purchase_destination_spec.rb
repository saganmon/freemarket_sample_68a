require 'rails_helper'

RSpec.describe PurchaseDestination, type: :model do
  describe '#create' do
    context 'can save' do
      it "全てのカラムに適切なバリーデーションがかかってること" do
        destination = build(:purchase_destination)
        destination.valid?
        expect(destination).to be_valid
      end
    end

    context 'can not save' do
      it "送付先氏名が、名字と名前でそれぞれ必須" do
        destination = build(:purchase_destination, p_first_name: "", p_last_name: "")
        destination.valid?
        expect(destination.errors[:p_first_name]).to include("を入力してください")
        expect(destination.errors[:p_last_name]).to include("を入力してください")
      end

      it "送付先氏名のふりがなが、名字と名前でそれぞれ必須" do
        destination = build(:purchase_destination, p_first_name_kana: "", p_last_name_kana: "")
        destination.valid?
        expect(destination.errors[:p_first_name_kana]).to include("を入力してください")
        expect(destination.errors[:p_last_name_kana]).to include("を入力してください")
      end

      it "郵便番号が必須" do
        destination = build(:purchase_destination, p_postcode: "")
        destination.valid?
        expect(destination.errors[:p_postcode]).to include("を入力してください")
      end

      it "都道府県が必須" do
        destination = build(:purchase_destination, p_prefecture: "")
        destination.valid?
        expect(destination.errors[:p_prefecture]).to include("を入力してください")
      end

      it "市区町村が必須" do
        destination = build(:purchase_destination, p_city: "")
        destination.valid?
        expect(destination.errors[:p_city]).to include("を入力してください")
      end

      it "番地が必須" do
        destination = build(:purchase_destination, p_block: "")
        destination.valid?
        expect(destination.errors[:p_block]).to include("を入力してください")
      end
    end
  end
end
