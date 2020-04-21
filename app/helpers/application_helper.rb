require_relative 'components/button.rb'
require_relative 'components/label.rb'
require_relative 'components/path.rb'

module ApplicationHelper

    include Button
    include Path
    include Label

    #Helpers for Buttons
    def new_button(model_class)
        button(Button::NEW, "", Button::PRIMARY, new_path(model_class))
    end

    def cancel_button(model_class)
        button(Button::CANCEL, "", "default", index_path(model_class))
    end

    def back_button(model_class)
        button(Button::BACK, "", "default", index_path(model_class))
    end

    def edit_button_sm(ref)
        button(Button::EDIT, Button::XS, Button::PRIMARY, edit_path(ref))
    end

    def edit_button(ref)
        button(Button::EDIT, "", Button::PRIMARY, edit_path(ref))
    end

    def delete_button_sm(ref)
        delete(Button::XS, index_path(ref.class))
    end

    def delete_button(ref)
        delete("", index_path(ref.class))
    end

    #Helpers for Path
    def show_path(ref)
        Path.show(ref)
    end

    def edit_path(ref)
        Path.edit(ref)
    end

    def new_path(model_class)
        Path.new_path(model_class)
    end

    def index_path(model_class)
        Path.index(model_class)
    end


    private

    def button(label, size, type, path)
        link_to(Label.build(label), path, 
            :class => "btn #{size} btn-#{type}")
    end


    def delete(size, path)
        label = I18n.t(Button::DESTROY, :default => I18n.t("#{Path::HELPERS_LINKS}#{Button::DESTROY}"))
        
        data = I18n.t(CONFIRM, 
                :default => I18n.t("#{Path::HELPERS_LINKS}#{Button::CONFIRM}", 
                :default => "Are you sure?"))
        
        link_to(Label.build(Button::DESTROY), path,
            :method => :delete,
            :data => { :confirm => data },
            :class => "btn btn-danger #{size}")
    end

end