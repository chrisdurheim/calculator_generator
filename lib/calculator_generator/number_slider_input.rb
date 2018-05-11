module CalculatorGenerator
  class NumberSliderInput < Input
    def initialize(opts = {})
      super
      @type = :number_slider
    end

    def label
      lbl = '      <label for="' + slug + '" id="' + slug + '-label">'
      lbl += @options[:value].to_s + " " + @title.downcase
      lbl += '</label><br />' + "\n"
    end

    def input_prefix
      ''
    end

    def input_type
      'range'
    end

    def input_class
      'slider'
    end

    def jsLabelUpdate
      "                  #{jsify}Label.innerHTML = #{jsify} + ' #{@title.downcase}' ;\n"
    end
  end
end
