module Label

    HELPERS_LINKS = "helpers.links"
    
    def self.build(label)
        I18n.t(label, :default => I18n.t("#{HELPERS_LINKS}#{label}"))
    end

end