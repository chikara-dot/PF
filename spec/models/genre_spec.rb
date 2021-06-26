RSpec.describe 'Genreモデルのテスト', type: :feature do
    subject { genre.valid? }

    let!(:other_customer) { create(:customer) }
    let(:customer) { build(:customer) }

    context 'ジャンル投稿投稿のテスト' do
      before do
        visit new_admin_genre_path
      end
      it '投稿後のリダイレクト先は正しいか' do
        fill_in 'genre[name]', with: Faker::Lorem.characters(number:5)
        click_button 'ジャンル新規登録!'
        expect(page).to have_current_path admin_genres_path
      end
    end
 end


