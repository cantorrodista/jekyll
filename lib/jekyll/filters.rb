module Jekyll

  module Filters
    def textilize(input)
      RedCloth.new(input).to_html
    end

    def date_to_string(date)
      date.strftime("%d %b %Y")
    end

    def date_to_long_string(date)
      date.strftime("%d %B %Y")
    end

    def date_to_xmlschema(date)
      date.xmlschema
    end

    def xml_escape(input)
      CGI.escapeHTML(input)
    end

    def cgi_escape(input)
      CGI::escape(input)
    end

    def number_of_words(input)
      input.split.length
    end

    def array_to_sentence_string(array)
      connector='and'
      case array.length
      when 0
        ""
      when 1
        array[0].to_s
      when 2
        "#{array[0]} #{connector} #{array[1]}"
      else
        "#{array[0...-1].join(', ')}, #{connector} #{array[-1]}"
      end
    end

    def tag_array_to_sentence_links(array)
      base_path="/tags/"
      connector='y'
      case array.length
      when 0
        ""
      when 1
        "<a href='#{base_path}#{array[0].to_s}'>#{array[0].to_s}</a>"
      when 2
        "<a href='#{base_path}#{array[0].to_s}'>#{array[0].to_s}</a> #{connector} <a href='#{base_path}#{array[1].to_s}'>#{array[1].to_s}</a>"
      else
        str = ""
        array[0...-1].each{|tag| str << "<a href='#{base_path}#{tag.to_s}'>#{tag.to_s}</a>, "}
        str << connector
        str <<  " <a href='#{base_path}#{array[-1].to_s}'>#{array[-1].to_s}</a>"
        str
      end
    end


    def to_month(input)
      return Date::MONTHNAMES[input.to_i]
    end

    def to_month_abbr(input)
      return Date::ABBR_MONTHNAMES[input.to_i]
    end

    def to_month_integer(int)
      case int.to_s.size
      when 1 then '0' + int.to_s
      when 2 then int
      end
    end
  end
end

