class AtendimentosController < ApplicationController
  before_action :authenticate_user!

  def new
    @ref = @model_class.new
    @ref.build_pessoa
    authorize @ref
  end
  
  def edit
    if @ref.pessoa.blank?
      @ref.build_pessoa
    end
    authorize @ref
  end

  private
  
    def set_field_classes
      @field_classes = []    
    end

    def set_model_class
      @model_class = Atendimento  
    end
  
    def model_params
      params.require(:atendimento)
        .permit(:pessoa, :endereco, :data, :etapa, :operadora, :portfolio,
          pessoa_attributes: [:nome, :telefone, :email])
    end
end
