module Table

     #com problemas... revisar depois
     def table_for(list)
        html = "" 
        #header
        list.each do |item|
            html = "<thead>\n<tr>\n"
            item.attribute_names.each do |h|
                html << "<th>#{h}</th>\n"
            end
            html << "</tr>\n</thead>\n"
            #rows
            html << "<tbody>\n"
            html << "<tr>\n"
            item.attributes.each do |r|
                html << "<td>#{r[1]}</th>\n"
            end
            html << "</tr>\n" 
        end    
        html << "</tbody>\n"
    end

end