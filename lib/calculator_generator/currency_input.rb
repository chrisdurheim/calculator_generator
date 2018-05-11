module CalculatorGenerator
  class CurrencyInput < Input
    def initialize(opts = {})
      super
      @type = :currency
    end

    def input_prefix
      '      <span class="input-prefix">$</span>' + "\n"
    end

    def input_type
      'text'
    end

    def input_class
      'currency'
    end

    def jsValue
      "                  const #{jsify} = parseCurrencyToFloat(#{jsify}Input.value) || 0;\n"
    end
  end
end
