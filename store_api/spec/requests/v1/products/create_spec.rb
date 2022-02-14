require 'swagger_helper'

RSpec.describe 'v1/products', type: :request do

  path '/v1/products/' do
    post("Registro de productos ") do
      tags :Products
      consumes "application/json"
      parameter(name: :payload, in: :body, description: "Atributos para crear el producto",
      schema: { "$ref" => "#/components/schemas/product" })
      security [Bearer: []]
      response(201, :successful) do
        # por qué :owner? tiene relacion con las pruebas
        # controllers/products/create_spec.rb
        let(:user) { create :owner}
        let(:user_token) { create :token, user: user }
        # authorization existe en application_controller = token
        let(:Authorization) { "Bearer #{user_token.token}"}
        let(:payload) {
          {
            product: {
              name: :test,
              description: :example,
              price: 50
            }
          }
        }
        run_test!
      end

    end
  end

end