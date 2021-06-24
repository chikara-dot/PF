require 'rails_helper'

describe '[STEP1] ユーザログイン前のテスト' do
  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end

    context '表示内容の確認' do
      it 'URLが存在するか' do
       expect(page).to have_link 'About'
       expect(page).to have_link 'ジャンル一覧'
       expect(page).to have_link '新規登録'
       expect(page).to have_link 'ログイン'
      end
    end

    context 'リンク先のテスト' do
     it 'Aboutページへのリンク' do
      click_link 'About'
      is_expected.to eq '/customer/about'
     end
     it 'ジャンル一覧へのリンク' do
       click_link 'ジャンル一覧'
       is_expected.to eq '/customer/genres'
     end
     it '新規登録へのリンク' do
      click_link '新規登録'
      is_expected.to eq '/customers/sign_up'
     end
     it 'ログインへのリンク' do
       click_link 'ログイン'
       is_expected.to eq '/customers/sign_in'
     end
    end


  end
end