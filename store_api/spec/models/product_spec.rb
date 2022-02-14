require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validaciones del producto' do
    subject { build(:product) }

    it 'Validar si store_id está presente' do
      should  validate_presence_of(:store_id)
    end

    it 'Validar si nombre está presente' do
      should validate_presence_of(:name)
    end

    it 'Validar si description está presente' do
      should validate_presence_of(:description)
    end

    it 'Validar si price está presente' do
      should validate_presence_of(:price)
    end

    it 'Validar asociación con tienda' do
      should belong_to(:store)
    end

  end
end
