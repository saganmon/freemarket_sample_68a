require 'rails_helper'

describe Product do
  before do
    @user = FactoryBot.create(:user)
    @category = FactoryBot.create(:category)
    @shipping = FactoryBot.create(:shipping)
  end

  describe '#create' do
    it "必須項目を満たすと登録できる" do
      user = @user
      category = @category
      shipping = @shipping
      product = build(:product, user_id: user.id, category_id: category.id, shipping_id: shipping.id)
      expect(product).to be_valid
    end

    it "商品名がないと登録できない" do
      user = @user
      category = @category
      shipping = @shipping
      product = build(:product, name: "", user_id: user.id, category_id: category.id, shipping_id: shipping.id)
      product.valid?
      expect(product.errors[:name]).to include("を入力してください")
    end

    it "商品の説明がないと登録できない" do
      user = @user
      category = @category
      shipping = @shipping
      product = build(:product, description: "", user_id: user.id, category_id: category.id, shipping_id: shipping.id)
      product.valid?
      expect(product.errors[:description]).to include("を入力してください")
    end

    it "カテゴリーの情報がないと登録できない" do
      user = @user
      category = @category
      shipping = @shipping
      product = build(:product, user_id: user.id, category_id: "", shipping_id: shipping.id)
      product.valid?
      expect(product.errors[:category_id]).to include("を入力してください")
    end

    it "商品の状態の情報がないと登録できない" do
      user = @user
      category = @category
      shipping = @shipping
      product = build(:product, condition: "", user_id: user.id, category_id: category.id, shipping_id: shipping.id)
      product.valid?
      expect(product.errors[:condition]).to include("を入力してください")
    end

    it "配送量の負担の情報がないと登録できない" do
      user = @user
      category = @category
      shipping = @shipping
      product = build(:product, user_id: user.id, category_id: category.id)
      product.valid?
      expect(product.errors[:shipping_id]).to include("を入力してください")
    end

    it "発送元の地域がないと登録できない" do
      user = @user
      category = @category
      shipping = @shipping
      product = build(:product, shipping_where: "", user_id: user.id, category_id: category.id, shipping_id: shipping.id)
      product.valid?
      expect(product.errors[:shipping_where]).to include("を入力してください")
    end

    it "発送までの日数がないと登録できない" do
      user = @user
      category = @category
      shipping = @shipping
      product = build(:product, shipping_day: "", user_id: user.id, category_id: category.id, shipping_id: shipping.id)
      product.valid?
      expect(product.errors[:shipping_day]).to include("を入力してください")
    end

    it "価格がないと登録できない" do
      user = @user
      category = @category
      shipping = @shipping
      product = build(:product, price: "", user_id: user.id, category_id: category.id, shipping_id: shipping.id)
      product.valid?
      expect(product.errors[:price]).to include("を入力してください")
    end

    it "価格が300円未満だと登録できない" do
      user = @user
      category = @category
      shipping = @shipping
      product = build(:product, price: 299, user_id: user.id, category_id: category.id, shipping_id: shipping.id)
      product.valid?
      expect(product.errors[:price]).to include("は300より大きい値にしてください")
    end

    it "価格が10,000,000円以上だと登録できない" do
      user = @user
      category = @category
      shipping = @shipping
      product = build(:product, price: 10000000, user_id: user.id, category_id: category.id, shipping_id: shipping.id)
      product.valid?
      expect(product.errors[:price]).to include("は9999999より小さい値にしてください")
    end

    it "価格が数字以外だと登録できない" do
      user = @user
      category = @category
      shipping = @shipping
      product = build(:product, price: "aaa", user_id: user.id, category_id: category.id, shipping_id: shipping.id)
      product.valid?
      expect(product.errors[:price]).to include("は数値で入力してください")
    end

    it "価格が300円〜9,999,999円だと登録できる" do
      user = @user
      category = @category
      shipping = @shipping
      product = build(:product, price: 1000, user_id: user.id, category_id: category.id, shipping_id: shipping.id)
      expect(product).to be_valid
    end
  end
end