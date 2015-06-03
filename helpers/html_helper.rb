module HtmlHelper
  def html_table collection, fields
    out = ""
    out << "<table>"

    collection.each do |item|
      out << "<tr>"
      fields.each do |field|
        out << "<td>#{item.send field}</td>"
      end
      out << "</tr>"
    end

    out << "</table>"

    return out
  end
end