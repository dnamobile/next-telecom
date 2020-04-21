require 'test_helper'

class CoberturasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cobertura = coberturas(:one)
  end

  test "should get index" do
    get coberturas_url
    assert_response :success
  end

  test "should get new" do
    get new_cobertura_url
    assert_response :success
  end

  test "should create cobertura" do
    assert_difference('Cobertura.count') do
      post coberturas_url, params: { cobertura: { net: @cobertura.net, oi: @cobertura.oi, vivo: @cobertura.vivo } }
    end

    assert_redirected_to cobertura_url(Cobertura.last)
  end

  test "should show cobertura" do
    get cobertura_url(@cobertura)
    assert_response :success
  end

  test "should get edit" do
    get edit_cobertura_url(@cobertura)
    assert_response :success
  end

  test "should update cobertura" do
    patch cobertura_url(@cobertura), params: { cobertura: { net: @cobertura.net, oi: @cobertura.oi, vivo: @cobertura.vivo } }
    assert_redirected_to cobertura_url(@cobertura)
  end

  test "should destroy cobertura" do
    assert_difference('Cobertura.count', -1) do
      delete cobertura_url(@cobertura)
    end

    assert_redirected_to coberturas_url
  end
end
