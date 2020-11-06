require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく場合' do
      it 'ニックネーム、メールアドレス、パスワード、確認用パスワード、ユーザの本名、ユーザのフリガナ、生年月日が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'メールアドレスが＠を含んでいれば登録できる' do
        @user.email
        expect(@user).to be_valid
      end
      it 'パスワードが半角英数字混合であれば登録できる' do
        @user.password
        @user.password_confirmation
        expect(@user).to be_valid
      end
      it 'パスワードが６文字以上であれば登録できる' do
        @user.password
        @user.password_confirmation
        expect(@user).to be_valid
      end
      it 'ユーザの本名(氏名)が漢字、カタカナ、ひらがなであれば登録できる' do
        @user.first_name
        expect(@user).to be_valid
      end
      it 'ユーザの本名(苗字)が漢字、カタカナ、ひらがなであれば登録できる' do
        @user.family_name
        expect(@user).to be_valid
      end
      it 'ユーザーのフリガナ(氏名)がカタカナであれば登録できる' do
        @user.first_name
        expect(@user).to be_valid
      end
      it 'ユーザーのフリガナ(苗字)がカタカナであれば登録できる' do
        @user.family_name
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない場合' do
      it 'ニックネームが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが空欄だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したメールアドレスは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it '＠を含まないメールアドレスは登録できない' do
        @user.email = 'hoge'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードが空欄だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードが６文字以下だと登録できない' do
        @user.password = 'k1s'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードの再確認が空欄だと登録できない' do
        @user.password
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'パスワードと再確認用のパスワードが一致しないと登録できない' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc234'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'パスワードは英数字混合でないと登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Password Include both letters and numbers')
      end
      it 'ユーザーの本名(苗字)が空欄だと登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'ユーザーの本名(氏名)が空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'ユーザーの本名(苗字)が漢字、カタカナ、ひらがな以外だと登録できない' do
        @user.family_name = 'hoge'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name Last name Full-width characters')
      end
      it 'ユーザーの本名(氏名)が漢字、カタカナ、ひらがな以外だと登録できない' do
        @user.first_name = 'hoge'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name First name Full-width characters')
      end
      it 'ユーザーのフリガナ(苗字)が空だと登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it 'ユーザーのフリガナ(氏名)が空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'ユーザーのフリガナ(苗字)がカタカナ以外だと登録できない' do
        @user.family_name_kana = 'hoge'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana Last name kana Full-width katakana characters')
      end
      it 'ユーザーのフリガナ(氏名)がカタカナ以外だと登録できない' do
        @user.first_name_kana = 'hoge'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana First name kana Full-width katakana characters')
      end
      it '生年月日が空だと登録できない' do
        @user.birthday =  ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
