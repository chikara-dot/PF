 require 'rails_helper'

describe 'ログイン後のテスト' do
   let!(:customer) { create(:customer) }
   let!(:genre) {create(:genre)}
   let!(:category) {create(:category,customer_id: customer.id, genre_id: genre.id)}
   let!(:post) {create(:post, customer_id: customer.id, category_id: category.id) }

  describe 'ログイン後のテスト' do
     before do
      visit new_customer_session_path
     end
     it 'ログインのテスト' do
      fill_in 'customer[email]', with: customer.email
      fill_in 'customer[password]', with: customer.password
      click_button 'Log in'
     end
  end

  describe 'ジャンル投稿投稿のテスト' do
      before do
        visit new_admin_genre_path
      end
      it '投稿後のリダイレクト先は正しいか' do
        fill_in 'genre[name]', with: Faker::Lorem.characters(number:5)
        click_button 'ジャンル新規登録!'
        expect(page).to have_current_path admin_genres_path
      end
  end

  describe 'カテゴリーのテスト' do
     before do
      visit new_customer_session_path
      fill_in 'customer[email]', with: customer.email
      fill_in 'customer[password]', with: customer.password
      click_button 'Log in'

      visit new_customer_genre_category_path(genre.id)
     end
     it 'カテゴリーを投稿できるか' do

       fill_in 'category[name]', with: category.name
       attach_file "category_image", "#{Rails.root}/app/assets/images/no_image.jpg"

       expect { click_button 'カテゴリー登録'}.to change(customer.categories, :count).by(1)
     end
  end

  describe 'カテゴリー編集画面のテスト' do
     before do
      visit new_customer_session_path
      fill_in 'customer[email]', with: customer.email
      fill_in 'customer[password]', with: customer.password
      click_button 'Log in'

      visit edit_customer_genre_category_path(genre.id,category.id)
     end
     it '編集ボタンが存在しているか' do
      expect(page).to have_button 'カテゴリー編集'
     end
     it '削除ボタンが作成されているか' do
      expect(page).to have_content 'カテゴリーを削除'
     end

     it 'カテゴリー削除のテスト' do
      expect{ category.destroy }.to change{ Category.count }.by(-1)
     end
  end



  describe 'ポストのテスト' do
   before do
     visit new_customer_session_path
     fill_in 'customer[email]', with: customer.email
     fill_in 'customer[password]', with: customer.password
     click_button 'Log in'

     visit new_customer_genre_category_post_path(genre.id,category.id)
   end
   it '投稿できるか' do
     fill_in 'post[title]', with: post.title
     attach_file "post_images", "#{Rails.root}/app/assets/images/no_image.jpg"
     expect { click_button '投稿'}.to change(customer.posts, :count).by(1)
   end
  end

  describe 'ポスト詳細画面のテスト' do
   before do
     visit new_customer_session_path
     fill_in 'customer[email]', with: customer.email
     fill_in 'customer[password]', with: customer.password
     click_button 'Log in'
     visit customer_genre_category_post_path(genre.id, category.id, post.id)
   end

   it '削除ボタンが存在するか' do
    expect(page).to have_content '投稿を削除'
   end

   it 'ポスト削除のテスト' do
    expect{ post.destroy }.to change{ Post.count }.by(-1)
   end
  end
 end