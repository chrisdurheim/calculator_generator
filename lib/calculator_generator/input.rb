module CalculatorGenerator
  class Input
    def initialize(opts = {})
      @title = opts[:title]
      @type = opts[:type]
      @options = opts
    end

    def to_html
      html = html_open
      html += label
      html += input_prefix
      html += input
      html += html_close
    end

    def html_open
      '    <div class="calculator-input">' + "\n"
    end

    def html_close
      '    </div>' + "\n"
    end

    def label
      lbl = '      <label for="' + slug + '" id="' + slug + '-label">'
      lbl += @title
      lbl += '</label><br />' + "\n"
    end

    def input_prefix
      ''
    end

    def input
      el = '      <input type="'
      el += input_type
      el += '"'

      el += klass
      el += name
      el += id
      el += value if @options[:value]
      el += min if @options[:min]
      el += max if @options[:max]
      el += step if @options[:step]

      el += ' />' + "\n"
    end

    def input_type
      'number'
    end

    def input_class
      ''
    end

    def klass
      (' class="' + input_class + '"')
    end

    def name
      (' name="' + slug + '"')
    end

    def id
      (' id="' + slug + '"')
    end

    def value
      (' value="' + @options[:value].to_s + '"')
    end

    def min
      (' min="' + @options[:min].to_s + '"')
    end

    def max
      (' max="' + @options[:max].to_s + '"')
    end

    def step
      (' step="' + @options[:step].to_s + '"')
    end

    def slug
	    @title.gsub(' ', '-').gsub(/[^\w-]/, '').gsub(/(-){2,}/, '-').downcase
    end

    def jsify
      @title.split.map(&:capitalize).join(' ').gsub(' ', '').gsub(/[^\w-]/, '').gsub(/(-){2,}/, '')
    end

    def jsInput
      "                const #{jsify}Input = calculator.querySelector('input##{slug}');\n"
    end

    def jsLabel
      "                const #{jsify}Label = calculator.querySelector('##{slug}-label');\n"
    end

    def jsValue
      "                  const #{jsify} = parseFloat(#{jsify}Input.value) || 0;\n"
    end

    def jsLabelUpdate
      ''
    end

    def jsValidations
      validations = ''
      validations += jsValidateMin if @options[:min]
      validations += jsValidateMax if @options[:max]
      validations
    end

    def jsValidateMin
      val = ''
      val += "if (#{jsify} < #{@options[:min]}) {\n"
      val += "console.log(#{jsify});\n"
      val += "outputDiv.innerHTML = '';\n"
      val += "outputDiv.appendChild(tag('span', 'Set #{@title.downcase} greater than #{@options[:min]}', 'result-error'));\n"
      val += "return;\n"
      val += "}\n"
    end

    def jsValidateMax
      val = ''
      val += "if (#{jsify} > #{@options[:max]}) {\n"
      val += "outputDiv.innerHTML = '';\n"
      val += "outputDiv.appendChild(tag('span', 'Set #{@title.downcase} less than #{@options[:max]}', 'result-error'));\n"
      val += "return;\n"
      val += "}\n"
    end
  end
end
