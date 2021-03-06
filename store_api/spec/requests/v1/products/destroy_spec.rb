require 'swagger_helper'

RSpec.describe 'v1/prodcuts', type: :request do
  path "/v1/products/{id}" do
    delete('Eliminar producto') do
      tags :Products
      consumes "application/json"
      parameter(name: :id, in: :path, description: "Id del producto",
      schema: { "$ref" => "#/components/schemas/product_id"})
      security [Bearer: []]

      response(200, :successful) do
        let(:user) { create(:owner) }
        let(:user_token) { create(:token, user: user) }
        let(:product) { create(:product, store: user.store) }
        let(:id) { product.id }
        let(:Authorization) { "Bearer #{user_token.token}" }
        run_test!
      end

    end

  end

end