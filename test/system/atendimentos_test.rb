require "application_system_test_case"

class AtendimentosTest < ApplicationSystemTestCase
  setup do
    @atendimento = atendimentos(:one)
  end

  test "visiting the index" do
    visit atendimentos_url
    assert_selector "h1", text: "Atendimentos"
  end

  test "creating a Atendimento" do
    visit atendimentos_url
    click_on "New Atendimento"

    fill_in "Data", with: @atendimento.data
    fill_in "Endereco", with: @atendimento.endereco_id
    fill_in "Etapa", with: @atendimento.etapa
    fill_in "Operadora", with: @atendimento.operadora
    fill_in "Pessoa", with: @atendimento.pessoa_id
    fill_in "Portfolio", with: @atendimento.portfolio
    click_on "Create Atendimento"

    assert_text "Atendimento was successfully created"
    click_on "Back"
  end

  test "updating a Atendimento" do
    visit atendimentos_url
    click_on "Edit", match: :first

    fill_in "Data", with: @atendimento.data
    fill_in "Endereco", with: @atendimento.endereco_id
    fill_in "Etapa", with: @atendimento.etapa
    fill_in "Operadora", with: @atendimento.operadora
    fill_in "Pessoa", with: @atendimento.pessoa_id
    fill_in "Portfolio", with: @atendimento.portfolio
    click_on "Update Atendimento"

    assert_text "Atendimento was successfully updated"
    click_on "Back"
  end

  test "destroying a Atendimento" do
    visit atendimentos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Atendimento was successfully destroyed"
  end
end
