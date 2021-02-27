require 'rails_helper'

RSpec.describe User, type: :model do
  #FactoryBotを用いてインスタンスを生成
  before  do
    @user = FactoryBot.build(:user)
  end
end
