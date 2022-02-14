require 'rails_helper'

RSpec.describe Token, type: :model do

  describe 'Validación del model token' do
    subject {build(:token)}

    it 'Validar presencia de token' do
      should validate_presence_of(:token)
    end

    it 'Validar presencia de user_id' do
      should validate_presence_of(:user_id)
    end

    it 'Validar si expires_at está presente' do
      should validate_presence_of(:expires_at)
    end

    it 'Validar si existe relación con user' do
      should belong_to(:user)
    end


  end
end
