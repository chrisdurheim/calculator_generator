module CalculatorGenerator
  class PercentSliderInput < Input
    def initialize(opts = {})
      super
      @type = :percent_slider
    end

    def label
      lbl = '      <label for="' + slug + '" id="' + slug + '-label">'
      lbl += (@options[:value] * 100).to_s + "% " + @title.downcase
      lbl += '</label><br />' + "\n"
    end

    def input_prefix
      ''
    end

    def input_type
      'range'
    end

    def input_class
      'slider slider--percent'
    end

    def jsLabelUpdate
      "        #{jsify}Label.innerHTML = (#{jsify} * 100).toFixed(0) + '% #{@title.downcase}' ;\n"
    end

    def jsValidateMin
      val = ''
      val += "          if (#{jsify} < #{@options[:min]}) {\n"
      val += "            outputDiv.innerHTML = '';\n"
      val += "            outputDiv.appendChild(tag('span', 'Set #{@title.downcase} greater than #{@options[:min] * 100}%', 'result-error'));\n"
      val += "            return;\n"
      val += "          }\n"
    end

    def jsValidateMax
      val = ''
      val += "          if (#{jsify} > #{@options[:max]}) {\n"
      val += "            outputDiv.innerHTML = '';\n"
      val += "            outputDiv.appendChild(tag('span', 'Set #{@title.downcase} less than #{@options[:max] * 100}%', 'result-error'));\n"
      val += "            return;\n"
      val += "          }\n"
    end
  end
end
