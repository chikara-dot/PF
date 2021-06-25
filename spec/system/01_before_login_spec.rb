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
      expect(current_path).to eq '/customer/about'
     end
     it 'ジャンル一覧へのリンク' do
       click_link 'ジャンル一覧'
       expect(current_path).to eq '/customer/genres'
     end
     it '新規登録へのリンク' do
      click_link '新規登録'
      expect(current_path).to eq '/customers/sign_up'
     end
     it 'ログインへのリンク' do
       click_link 'ログイン'
       expect(current_path).to eq '/customers/sign_in'
     end
    end
  end

  describe 'ジャンル画面のテスト' do
    let!(:genre) { Genre.create! }
    before do
     visit customer_genres_path
    end
    it 'カテゴリーへのリンクテスト' do
     expect(page).to have_link "/customer/genres/#{genre.id}/categories"
    end
  end

  describe 'カテゴリー画面のテスト' do
   let!(:genre) { Genre.create! }
   let!(:category) { Category.create!(:category,name:'a',image_id:'no_image.jpg')}
   before do
     customer_genre_categories_path(genre.id)
   end
   it 'postへのリンクテスト' do
     expect(page).to have_link "/customer/genres/#{genre.id}/categories/#{category.id}/posts"
   end
 end
end







