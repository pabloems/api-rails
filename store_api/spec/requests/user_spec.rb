require 'rails_helper'

RSpec.describe "Users", type: :model do

  describe 'Validaciones del modelo user ' do
    # subject { build(:user) } 

    # it 'Validar si el email está presente' do
    #   should validate_presence_of(:email)
    # end

    # it 'Validar si el password está presente' do
    #       should validate_presence_of(:password_digest)
    # end

    # it 'Validar si el type está presente' do
    #   should validate_presence_of(:type)
    # end

    # it 'Validar si la edad está presente' do
    #   should validate_presence_of(:age)
    # end

    # it 'Validar si el correo es único' do
    #   should validate_uniqueness_of(:email)
    # end

    # it 'Validar formato del correo' do
    #   should_not allow_value("test").for(:email)
    # end

    # it 'Validar edad solo con número entero' do
    #   should validate_numericality_of(:age).only_integer
    # end

    # it 'Validar si la edad es >= 18' do
    #   should validate_numericality_of(:age)
    #   .is_greater_than_or_equal_to(18)
    # end

    # it 'Validar si la edad es <= 100' do
    #   should validate_numericality_of(:age)
    #   .is_less_than_or_equal_to(100)
    # end

  end



  # type: :request
  # describe "GET /email" do
  #   it "returns http success" do
  #     get "/user/email"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET /age:integer" do
  #   it "returns http success" do
  #     get "/user/age:integer"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET /password_digest" do
  #   it "returns http success" do
  #     get "/user/password_digest"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET /type" do
  #   it "returns http success" do
  #     get "/user/type"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
