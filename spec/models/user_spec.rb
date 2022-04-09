require 'rails_helper'

RSpec.describe User, type: :model do

  # before do 
  #   @user = build(:user)
  # end

  describe 'ユーザー登録' do
    it '正常' do
      user = User.create(name: 'hogehoge', email: 'foobar@example.com', password: 'hogehogefoobar', password_confirmation: 'hogehogefoobar')
      expect(user.valid?).to eq(true)
    end

    it '名前がないと失敗' do
      user = User.create(email: 'foobar@example.com', password: 'hogehogefoobar', password_confirmation: 'hogehogefoobar')
      expect(user.valid?).to eq(false)
    end

    it 'emailがないと失敗' do
      user = User.create(name: 'hogehoge', password: 'hogehogefoobar', password_confirmation: 'hogehogefoobar')
      expect(user.valid?).to eq(false)
    end

    it 'パスワードが異なると失敗' do
      user = User.create(name: 'hogehoge', email: 'foobar@example.com', password: 'hogehoge', password_confirmation: 'foobar')
      expect(user.valid?).to eq(false)
    end

    it 'emailは重複しない' do
      user_a = User.create(name: 'aaaaaa', email: 'foobar@example.com', password: 'hogehogefoobar', password_confirmation: 'hogehogefoobar')
      user_b = User.create(name: 'bbbbbb', email: 'foobar@example.com', password: 'hogehogefoobar', password_confirmation: 'hogehogefoobar')
      expect(user_b.valid?).to eq(false)
    end

    it 'nameは15字だと成功' do
      name = 'a' * 15
      user_fifteen = User.create(name: name, email: 'foobar@example.com', password: 'hogehogefoobar', password_confirmation: 'hogehogefoobar')
      expect(user_fifteen.valid?).to eq(true)
    end

    it 'nameは16字より多いと失敗' do
      name = 'a' * 16
      user_sixteen = User.create(name: name, email: 'foobar@example.com', password: 'hogehogefoobar', password_confirmation: 'hogehogefoobar')
      expect(user_sixteen.valid?).to eq(false)
    end

  end
end
