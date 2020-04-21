require 'test_helper'

class ConsultaCoberturaControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get consulta_cobertura_search_url
    assert_response :success
  end

end
