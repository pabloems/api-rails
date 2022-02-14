require 'rails_helper'

RSpec.describe Store, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'Validaciones del modelo store' do
    subject{ build(:store)}
    it 'Validar si el nombre está presente' do
      should validate_presence_of(:name)
    end

    it 'Validar si tienda tiene un dueño' do
      should have_one(:owner)
    end

    it 'Validar si tienda tiene empleados' do
      should have_many(:employees)
    end

    it 'Validar si existe relación con productos' do
      should have_many(:products)
    end

  end
end
