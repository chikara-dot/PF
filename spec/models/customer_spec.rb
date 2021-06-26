require 'rails_helper'

RSpec.describe 'Customerモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { customer.valid? }

    let!(:other_customer) { create(:customer) }
    let(:customer) { build(:customer) }

    context 'カラムのテスト' do
      it '空欄でないこと' do
        customer.nickname = ''
        is_expected.to eq false
      end
    end

  describe 'アソシエーションのテスト' do
    context 'モデルとの関係' do
      it 'Postモデルと1:Nになっている' do
        expect(Customer.reflect_on_association(:posts).macro).to eq :has_many
      end
      it 'catagoryモデルと1:Nになっている' do
        expect(Customer.reflect_on_association(:categories).macro).to eq :has_many
      end
    end
  end
  end
end
