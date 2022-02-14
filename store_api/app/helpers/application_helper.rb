
module ApplicationHelper

  # convierte respuesta de servidor a respuesta JSON
  def payload_test
    JSON.parse(response.body, symbolize_names: true)
  end

end