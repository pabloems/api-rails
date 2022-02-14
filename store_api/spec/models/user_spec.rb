require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validaciones del modelo owner' do
  subject { build(:owner) } 
    it 'Validar si el email está presente' do
      should validate_presence_of(:email)
    end

    it 'Validar si el password está presente' do
          should validate_presence_of(:password_digest)
    end

    it 'Validar si el type está presente' do
      should validate_presence_of(:type)
    end

    it 'Validar si la edad está presente' do
      should validate_presence_of(:age)
    end

    it 'Validar si el correo es único' do
      should validate_uniqueness_of(:email)
    end

    it 'Validar formato del correo' do
      should_not allow_value("test").for(:email)
    end

    it 'Validar edad solo con número entero' do
      should validate_numericality_of(:age).only_integer
    end

    it 'Validar si la edad es >= 18' do
      should validate_numericality_of(:age)
      .is_greater_than_or_equal_to(18)
    end

    it 'Validar si la edad es <= 100' do
      should validate_numericality_of(:age)
      .is_less_than_or_equal_to(100)
    end

    it 'Validar si solo se pueden crear empleados o propietarios' do
      should validate_inclusion_of(:type).in_array(%w[Employee Owner])
    end

    it 'Validar si existe relación con store' do
      # belong_to
      should belong_to(:store)
    end

    it 'Validar si existe relación con token' do
      should have_many(:tokens)
    end

  end

end
