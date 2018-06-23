require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'create new category' do
    it 'successfully' do
      category1 = create(:category)
      category2 = create(:category)
      category3 = create(:category)

      expect(Category.all).to eq([category1, category2, category3])
    end
  end
end
