require 'rails_helper'

RSpec.describe User, type: :model do
  #FactoryBotを用いてインスタンスを生成
  before  do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録' do
    it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること' do
      expect(@user).to be_valid
    end
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      # @user.errors
      # @user.errors.full.messages
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")

    end    
    it '重複したemailが存在する場合登録できないこと' do
      #生成した@userをテーブルへ保存後、
      @user.save

      #別のユーザーanother_userを生成する。
      #FactoryBotを用いて、user情報(email)だけを選択してインスタンスを生成
      #生成したインスタンスをanother_userへ代入します。
      #一時的な保存のためFactoryBot.buildとなる、永続的にDB保存はFactoryBot.create
      another_user = FactoryBot.build(:user,email: @user.email)

      #another_user.email へ すでに保存済みの@userのemail情報を上書きする。
      another_user.email = @user.email

      #.valid?でanother_userがDBへ一時保存できるか判別
      another_user.valid?

      #faluseとなるため。
      #another_user.errors.full_mseeagesでエラー全文を表示。
      expect(another_user.errors.full_messages).to include("Email has already been taken")

    end
    it 'passwordが空では登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")

    end
    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")

    end
    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      @user.password
      @user.password_confirmation = ''
      @user.valid?
      expect( @user.errors.full_messages).to include("Password confirmation doesn't match Password")

    end
  end
end
