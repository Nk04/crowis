require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '全ての項目に正しい値が入力されていれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nick_nameが空では登録できないこと' do
      @user.nick_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nick nameを入力してください")
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end

    it 'emailに@が含まれていなければ登録できないこと' do
      @user.email = 'email.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは不正な値です")
    end

    it 'emailが既に登録されていると登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end

    it 'passwordが5文字以下では登録できないこと' do
      @user.password = 'aaaa1'
      @user.password_confirmation = 'aaaa1'
      @user.valid?
      expect(@user.errors.full_messages).to be_include("パスワードは6文字以上で入力してください")
    end

    it 'passwordが半角英数字混合でなければ登録できないこと' do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end
    it 'passwordが半角英数字混合でなければ登録できないこと' do
      @user.password = 'ABCDEF'
      @user.password_confirmation = 'ABCDEF'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end
    it 'passwordが半角英数字混合でなければ登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end

    it 'passwordが正しく入力されていてもpassword_confirmationが空では登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
  end
end
