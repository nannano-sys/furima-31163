require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "ニックネームが空だと登録できない" do
    end
    it "メールアドレスが空だと登録できない" do
    end
    it "重複したメールアドレスは登録できない" do
    end
    it "＠を含まないメールアドレスは登録できない" do
    end
    it "パスワードが空だと登録できない" do
    end
    it  "パスワードが６文字以下だと登録できない" do
    end
    it "パスワードの再確認がないと登録できない" do
    end
    it "パスワードと再確認用のパスワードが一致しないと登録できない" do
    end
    it "ユーザーの本名が空だと登録できない" do
    end
    it "ユーザーの本名が漢字、カタカナ、ひらがな以外だと登録できない" do
    end
    it "ユーザーのフリガナが空だと登録できない" do
    end
    it "ユーザーのフリガナがカタカナ以外だと登録できない" do
    end
    it "生年月日が空だと登録できない" do
    end
 end

end
