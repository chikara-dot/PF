RSpec.describe 'Genreモデルのテスト', type: :feature do
    subject { category.valid? }

    let!(:other_customer) { create(:customer) }
    let(:customer) { build(:customer) }

    # let!(:other_genre) { create(:genre) }
    # let(:genre) { build(:genre) }

    let!(:genre) do
      Genre.new({id:1, name:"スポーツ"})
    end

    let!(:category) do
      Category.new({id:1, name:"野球",image_id: "9bbf002460ac4e49ab3ef12b11a511a4a6acc5ae24dbdfd445",customer_id:1, genre_id:1})
    end

    context 'カテゴリー投稿のテスト' do
      before do
        # get :genre, params: { genre_id: genre.id }
        visit new_customer_genre_category_path(genre.id)
      end
      it 'カテゴリー投稿後のリダイレクト先は正しいか' do
        fill_in "category[name]", with: category.name
        fill_in "image", with: category.image_id
        click_button 'カテゴリー登録'
        expect(page).to have_current_path customer_genre_categories_path(genre.id)
      end
   end
end