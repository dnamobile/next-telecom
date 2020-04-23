class ApplicationController < ActionController::Base
    
    before_action :set_model_class
    before_action :set_field_classes
    before_action :set_ransack, only: [:index, :search]
    before_action :set_ref, only: [:show, :edit, :update, :destroy]    

    
    def index
       set_list
    end
    
    def show
    end
    
    def edit
    end
    
    def new
        @ref = @model_class.new
    end
    
    def create
        @ref = @model_class.new(estado_params)
        
        respond_to do |format|
          if @ref.save
            format.html { redirect_to @ref, notice: "#{@model_class.model_name} criado com sucesso." }
            format.json { render :show, status: :created, location: @ref }
            format.js
          else
            format.html { render :new }
            format.json { render json: @ref.errors, status: :unprocessable_entity }
            format.js
        end
        end
    end
    
    def destroy
        @ref.destroy
        respond_to do |format|
            format.html { redirect_to Path.index(@model_class.model_name), notice: "#{@model_class.model_name} apagado com sucesso." }
            format.json { head :no_content }
        end
    end
    
    def set_model_class
    end
    
    def set_field_classes
        @field_classes = [@model_class]    
    end
    

    def update
        respond_to do |format|
            if @ref.update(model_params)
                format.html { redirect_to @ref, notice: "#{@model_class.model_name} alterado com sucesso." }
                format.json { render :show, status: :ok, location: @ref }
            else
                format.html { render :edit }
                format.json { render json: @ref.errors, status: :unprocessable_entity }
            end
        end
    end
    
    
    def set_ref
        if @model_class != nil
            @ref = @model_class.find(params[:id])
        end
    end

    def set_ransack
        if @model_class != nil
            @q = @model_class.ransack(params[:q])
        end
    end
    
    def set_list
        if @q != nil
            @list = @q.result.page(params[:page])
        end 
    end 
    
    def model_params
        params
    end
    
    def clear
        @ref = nil
        @list = nil
        @model_class = nil
        @field_classes = nil
    end
end
