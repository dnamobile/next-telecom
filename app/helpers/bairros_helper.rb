module BairrosHelper

    def zonas
        ["Centro", "Norte", "Sul", "Leste", "Sudeste"]
    end

    def cidades
        @cidades = Cidade.all
    end

end
