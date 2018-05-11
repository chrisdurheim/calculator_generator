module CalculatorGenerator
  class InputGroup
    attr_reader :inputs
    def initialize(opts = {})
      @title = opts[:title] || ''
      @inputs = []
    end

    def add_input(input)
      @inputs << input
    end

    def to_html
      html = html_open
      @inputs.each do |input|
        html += input.to_html
      end
      html += html_close
    end

    def html_open
      op = '  <div class="calculator-input-group" id="' + slug(@title) + '">' + "\n"
      op += '    <h4 class="calculator-group-title">' + @title + '</h4>' + "\n"
    end

    def html_close
      '  </div>' + "\n"
    end

    def slug(title)
	    @title.gsub(' ', '-').gsub(/[^\w-]/, '').gsub(/(-){2,}/, '-').downcase
    end
  end
end
