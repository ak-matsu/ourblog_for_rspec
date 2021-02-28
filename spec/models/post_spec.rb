require 'rails_helper'

RSpec.describe Post, type: :model do
  before  do
    @post = FactoryBot.build(:post)
  end


    describe '新規投稿' do
    it 'titleとcontentとimageが存在していれば保存できること' do
      expect(@post).to be_valid
    end

    it  'titleが空では保存できないこと' do
      @post.title = ''
      @post.valid?
      expect(@post.errors.full_messages).to include("Title can't be blank")
    end

    it 'contentが空では保存できないこと' do
      @post.content = ''
      @post.valid?
      expect(@post.errors.full_messages).to include("Content can't be blank")
    end

    it 'imageが空では保存できないこと' do
      @post.image = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("Image can't be blank")
    end

    it '紐づくユーザーが存在しないと保存できないこと' do
      @post.user = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("User must exist")
    end
  end

end