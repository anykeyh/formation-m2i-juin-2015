module HtmlHelper
  def html_form opts={}
    capture do
      concat "<form #{html_attr(opts)}>"
      yield if block_given?
      concat "</form>"
    end
  end

  def html_attr opts={}
    opts.map{ |k,v| "#{k}='#{v}'" }.join
  end

  def html_submit name, opts={}
    capture do
      concat "<input type='submit' value='#{name}' />"
    end
  end

  def html_div opts={}
    capture do
      concat "<div #{html_attr(opts)}>"
      yield if block_given?
      concat "</div>"
    end
  end

  def html_label text, opts={}
    capture do
      concat "<label #{html_attr(opts)}>#{text}</label>"
    end
  end

  def html_text_field opts={}
    capture do
      concat "<input type='text' #{html_attr(opts)} />"
    end
  end

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

  def html_select items, opts={}
    capture do
      concat "<select #{opts.map{|k,v| "#{k}='#{v}'" }.join }>"
      concat items.map{|x| "<option value='#{x}'>#{x}</option>"}.join
      concat "</select>"
    end
  end
end