module CalculatorGenerator
  class InputGroup
    attr_reader :inputs
    def initialize(&block)
      @title = ''
      @inputs = []

      if block_given?
        instance_eval(&block)
      end
    end

    def title(string)
      @title = string
    end

    def currency(args)
      input(:currency, args)
    end

    def number_slider(args)
      input(:number_slider, args)
    end

    def percent_slider(args)
      input(:percent_slider, args)
    end

    def input(type, args)
      input = case type
      when :currency
        CalculatorGenerator::CurrencyInput
      when :number_slider
        CalculatorGenerator::NumberSliderInput
      when :percent_slider
        CalculatorGenerator::PercentSliderInput
      else
        CalculatorGenerator::Input
      end

      @inputs << input.new(args)
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
      op = '  <div class="calculator-input-group" id="' + slug + '">' + "\n"
      op += '    <h4 class="calculator-group-title">' + @title + '</h4>' + "\n"
    end

    def html_close
      '  </div>' + "\n"
    end

    def slug
	    @title.gsub(' ', '-').gsub(/[^\w-]/, '').gsub(/(-){2,}/, '-').downcase
    end
  end
end
