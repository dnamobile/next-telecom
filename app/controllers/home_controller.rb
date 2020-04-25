class HomeController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @appName = "Next Telecom"
        
        @pessoa = Pessoa.where(user: @user).first
        if @pessoa.blank?
            @pessoa = Pessoa.new()
        end
    end

    private

    def set_field_classes
      @field_classes = []    
    end
  
    def set_model_class
      @model_class = Pessoa  
    end
    
    def model_params
      params.require(:pessoa).permit(:nome, :telefone, :email)
    end
end
