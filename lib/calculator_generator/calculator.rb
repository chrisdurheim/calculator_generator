module CalculatorGenerator
  # A calculator object, containing inputs, outputs, and configurations
  class Calculator
    def initialize(opts  = {})
      @title = opts[:title] || 'Calculator'
      @site = opts[:site] || ''
      @style = opts[:style] || CalculatorGenerator::Style.new
      @input_groups = []
    end

    def add_input_group(group)
      @input_groups << group
    end

    def render(opts = {})
      html = html_open(opts)
      @input_groups.each do |group|
        html += group.to_html
      end
      html += html_close
      open('test.html', 'w') { |f|
        f.puts html
      }
      puts html
    end

    def html_open(opts = {})
      op = '<html>' + "\n" + '<body>' + "\n"
      op += @style.to_html unless opts[:no_css]
      op += '<div class="' + slug(@site) + '-calculator" id="' + slug(@title) + '">' + "\n"
      op += '  <h3 class="calculator-title">' + @title + '</h3>' + "\n"
    end

    def html_close
      cl = '  <div class="calculator-result"></div>' + "\n"
      cl += '</div>' + "\n"
      cl += js_open + js_shared + js_core + js_close
      cl += '</body>' + "\n" + '</html>' + "\n"
    end

    def js_open
      %Q[
        <script type="text/javascript">
          document.addEventListener('DOMContentLoaded', () => {
            console.log("Calculator js running");
        ]
    end

    def js_shared
      %Q[
            function tag(type, value = undefined, klass = undefined, id = undefined) {
              let el = document.createElement(type);
              if (klass) {
                el.setAttribute('class', klass);
              }
              if (id) {
                el.setAttribute('id', id);
              }
              if (value) {
                el.innerText = value;
              }
              return el
            }
            function toCurrency(value) {
              if (value == 0) {
                return '-';
              } else {
                return '$' + value.toFixed(0).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
              }
            }
            function parseCurrencyToFloat(value) {
              result = parseFloat(value.replace(/[($)\s\._\-]+/g, '').replace(/,/g, ''));
              if (isNaN(result)) {
                return 0;
              } else {
                return result;
              }
            }

            function convertToCurrency(value) {
              return value.toLocaleString()
            }
            console.log("Calculator helper functions loaded");
          ]
    end

    def js_core
      core = %Q[
              const calculator = document.querySelector('##{slug(@title)}');

              if (calculator) {
                console.log("Calculator found");

                const inputs = document.querySelectorAll('input');
                const currencyInputs = calculator.querySelectorAll('input.currency');
              ]
      core += "\n"

      @input_groups.each do |group|
        group.inputs.each do |input|
          core += input.jsInput
          core += input.jsLabel
        end
      end

      core += "                const outputDiv = calculator.querySelector('##{slug(@title)} .calculator-result');\n"

      core += %Q[

                /* Calculate and update labels and results, flag errors */
                function updateResults() {
                ]

      core += "\n"

      @input_groups.each do |group|
        group.inputs.each do |input|
          core += input.jsValue
        end
      end

      @input_groups.each do |group|
        group.inputs.each do |input|
          core += input.jsLabelUpdate
        end
      end

      core += %Q[
                  if (outputDiv) {
                  ]

      core += "\n"

      @input_groups.each do |group|
        group.inputs.each do |input|
          core += input.jsValidations
        end
      end

      core += %Q[
                    function calculateResult() {
                      let result = 1000;

                      let outputText = document.createDocumentFragment();

                      let baseText = document.createElement('p');
                      baseText.appendChild(document.createTextNode("The result is "));
                      baseText.appendChild(tag('span', toCurrency(result), 'result-value'));
                      outputText.appendChild(baseText);

                      return outputText;
                    }

                    outputDiv.innerHTML = '';

                    let outputHeading = document.createElement('h4');
                    outputHeading.innerText = 'Results';
                    outputDiv.appendChild(outputHeading);
                    outputDiv.appendChild(calculateResult());
                  }
                }

                /* Set calculator to auto-update on input changes */
                for (let i = 0; i < inputs.length; i += 1) {
                  inputs[i].addEventListener('input', () => {
                    updateResults();
                  });
                }

                /* Auto-format with commas */
                for (let i = 0; i < currencyInputs.length; i += 1) {
                  currencyInputs[i].addEventListener('input', () => {
                    currencyInputs[i].value = convertToCurrency(parseCurrencyToFloat(currencyInputs[i].value));
                  });
                }
                updateResults();
              }
        ]
    end

    def js_close
      %Q[
            });
          </script>
        ]
    end

    def slug(title)
	    title.gsub(' ', '-').gsub(/[^\w-]/, '').gsub(/(-){2,}/, '-').downcase
    end

    def jsify(title)
      title.split.map(&:capitalize).join(' ').gsub(' ', '').gsub(/[^\w-]/, '').gsub(/(-){2,}/, '')
    end
  end
end
