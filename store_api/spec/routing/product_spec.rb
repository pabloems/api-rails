require 'rails_helper'

describe 'Rutas de producto' do
  # crear
  it 'Ruta POST de products' do
    expect(post: '/v1/products').to route_to(
      format: 'json',
      controller: 'v1/products',
      action: 'create'
    )
  end
# actualizar
  it 'Ruta PUT para actualizar productos ' do
    expect(put: '/v1/products/1').to route_to(
      format: 'json',
      controller: 'v1/products',
      action: 'update',
      id: '1'
    )
  end

  # prueba de ruta
  it 'Ruta index de products' do
    expect(get: '/v1/products').to route_to(
      format: 'json',
      controller: 'v1/products',
      action: 'index'
    )
  end

  it 'Ruta delete de products' do
    expect(delete: '/v1/products/1').to route_to(
      format: 'json',
      controller: 'v1/products',
      action: 'destroy',
      id: '1'
    )
  end

  it 'Ruta restaurar producto' do
    expect(post: '/v1/products/1/restore').to route_to(
      format: 'json',
      controller: 'v1/products',
      action: 'restore',
      product_id: '1'
    )
  end


end