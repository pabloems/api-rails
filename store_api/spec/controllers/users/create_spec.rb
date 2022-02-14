require 'rails_helper'
# V1 por la versión de la api
# haciendo alusión al controlador a testear

# ------------Prueba de integración ------------#
RSpec.describe V1::UsersController, type: :controller do

  describe 'Registro de usuarios -- ' do
    let(:user) { {email: Faker::Internet.email ,
                  age: rand(30...100), 
                  password: Faker::Internet.password(min_length: 10, max_length: 20),
                  # Prueba de recurso anidado
                  # user --- belongs_to :store
                  store_attributes: {
                    name: Faker::Games::Zelda.game
                    }
                  } 
                }

    context 'Usuario registrado correctamente --' do
      before do
        # necesitamos los params de user
        # además otro user que contiene nuestros datos
        # es por ello el user: user
        post(:create, format: :json, params: { user: user} )
      end

      context 'Respuesta con status created' do
        # response contiene el objeto body y el status
        # nos permite conocer sus propiedades y extraer
        subject  {response}
        # la expectativa es que la respuesta http
        # sea de un objeto creado
        it { is_expected.to have_http_status(:created)}
      end

      context 'Respuesta con valores correctos de user' do
        subject { payload_test }
        it { is_expected.to include(:id, :email, :age, :store, :token)}
      end

      context 'Respuesta con valores correctos de store' do
        subject { payload_test[:store] }
        it { is_expected.to include(:id, :name, :created_at, :updated_at)}
      end

      context 'Respuesta con valores correctos de token' do
        subject { payload_test[:token]}
        it { is_expected.to include(:id, :token, :expires_at)}
      end

    end

      let( :bad_user ) { { email: "test", password: "123456", age: 10 } }

      context 'Usuario incorrecto' do
        before do
          post(:create, format: :json, params: {user: bad_user} )
        end

        context 'Respuesta con status bad request' do
          subject { response }
          it { is_expected.to have_http_status(:bad_request) }
        end

        context 'Respuesta con errores de validación' do
          subject { payload_test }
          it {is_expected.to include(:errors)}
        end
      end

  end
end