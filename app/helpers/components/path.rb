module Path

    HELPERS_LINKS = "helpers.links"

    #Path definition
    def self.show(ref)
        "/#{default(ref.class)}/#{ref.id}".downcase
    end

    def self.edit(ref)
        "/#{default(ref.class)}/#{ref.id}/edit".downcase
    end

    def self.new_path(model_class)
        "#{default(model_class)}/new".downcase
    end

    def self.index(model_class)
        "/#{default(model_class).downcase}"
    end


    private 

    def self.default(model_class)
        "#{model_class}s".downcase
    end

end