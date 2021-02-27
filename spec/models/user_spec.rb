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
      binding.pry



    end
    it 'passwordが空では登録できないこと' do
    end
    it 'passwordが5文字以下であれば登録できないこと' do
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
    end
  end
end
