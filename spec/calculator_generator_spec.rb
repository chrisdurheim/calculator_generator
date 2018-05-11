RSpec.describe CalculatorGenerator do
  it "has a version number" do
    expect(CalculatorGenerator::VERSION).not_to be nil
  end

  it 'is a template DSL for generating HTML, CSS, and JS' do
    calc = CalculatorGenerator::Template.new(<<-'END_TEMPLATE')

      calculator do
        title "Impact of Career Growth Calculator"
        input_group 'Base Case' do
          input 'Starting Salary' do
            type :currency
            default 40000
            min 0
          end
          slider 'Annual Raise' do
            type :percent
            min 0
            max 20
            step 0.5
            default 3
          end
          slider 'Years of Employment' do
            min 1
            max 60
            default 50
          end
        end
      end
    END_TEMPLATE

    expected_output = <<-END_OUTPUT
    <style>
      #impact-of-career-growth-calculator {
        margin: 2rem auto;
        padding: 2rem;
        border: 1px solid black;
        max-width: 600px;
        clear: both;
      }
      #impact-of-career-growth-calculator .calculator__section {
        padding: 1rem 0;
      }
      #impact-of-career-growth-calculator .calculator__section h5 {
        margin-top: 2rem;
      }
      #impact-of-career-growth-calculator h3.calculator__title, #impact-of-career-growth-calculator h3.calculator__result__title {
        padding: 1rem 0;
        text-align: center;
        text-decoration: underline;
        font-size: 2rem;
        text-transform: uppercase;
      }
      #impact-of-career-growth-calculator h4.calculator__section__title, #impact-of-career-growth-calculator h4.calculator__result__title {
        margin-bottom: 1rem;
        background-color: #0000B3;
        color: white;
        padding: 0.5rem;
        text-align: center;
      }

      #impact-of-career-growth-calculator .calculator__input {
        display: flex;
        flex-wrap: wrap;
        margin: 1rem 0 0;
      }
      #impact-of-career-growth-calculator label.calculator__input__label {
        flex: 0 0 100%;
        color: black;
      }
      #impact-of-career-growth-calculator .calculator__input__prefix {
        flex: 0 0 auto;
        padding: 0.5rem;
        margin: 0 0.25rem;
        line-height: 2rem;
      }
      #impact-of-career-growth-calculator .calculator__input input {
        flex: 1 0 auto;
        width: auto;
        max-width: 50%;
        padding: 0.5rem;
        margin: 0 0.25rem;
        font-size: 1rem;
        border: 1px solid #d6d6d6;
      }
      #impact-of-career-growth-calculator .calculator__input input:focus {
        outline: none;
        border: 1px solid #aaaaaa;
      }
      #impact-of-career-growth-calculator input.calculator__slider {
        width: 100%;
        max-width: 100%;
        -webkit-appearance: none;
        appearance: none;
        height: 0.5rem;
        border-radius: 0.5rem;
        border-color: #ddd;
        color: #ddd;
        background: #ddd;
        outline: none;
        opacity: 1;
        -webkit-transition: .2s;
        transition: opacity .2s;
        margin-top: 1rem !important;
        margin-bottom: 1rem !important;
        padding: 0 !important;
      }
      #impact-of-career-growth-calculator input.calculator__slider:hover {
        background: #f5f5f5;
      }
      #impact-of-career-growth-calculator input.calculator__slider::-webkit-slider-thumb {
        -webkit-appearance: none;
        appearance: none;
        width: 1.5rem;
        height: 1.5rem;
        border-radius: 50%;
        background: #0000B3;
        cursor: pointer;
      }

      #impact-of-career-growth-calculator input.calculator__slider::-moz-range-thumb {
        width: 1.5rem;
        height: 1.5rem;
        border-radius: 50%;
        background: #0000B3;
        cursor: pointer;
      }
      #impact-of-career-growth-calculator .calculator__result {
        font-size: 0.9rem;
        margin-top: 2rem;
        overflow-x: auto;
      }
      #impact-of-career-growth-calculator .calculator__result__value {
        font-weight: bold;
      }
      #impact-of-career-growth-calculator .calculator__result__error {
        font-size: 1.5rem;
        color: #ac0000;
      }
      #impact-of-career-growth-calculator .calculator__result__highlighted {
        text-align: center;
        background-color: #ac0000;
        color: white;
        font-size: 1.8rem;
      }
      #impact-of-career-growth-calculator .calculator__result__table {
        max-width: 100%;
        overflow-x: scroll;
        font-size: 0.8rem;
      }
      #impact-of-career-growth-calculator .calculator__result__table tr {
        transition: background-color 50ms, color 50ms;
      }
      #impact-of-career-growth-calculator .calculator__result__table tr:hover td {
        background-color: #0000B3;
        color: white;
      }
      #impact-of-career-growth-calculator .calculator__result__table th {
        text-align: center;
      }
      #impact-of-career-growth-calculator .calculator__result__table td, #impact-of-career-growth-calculator .calculator__result__table th {
        padding: 0 0.5rem;
      }
      #impact-of-career-growth-calculator .calculator__result__table .currency-column {
        text-align: center;
      }
    </style>
    <form id="impact-of-career-growth-calculator" action="#" accept-charset="UTF-8" method="post">
      <h3 class="calculator__title">Impact of Career Growth Calculator</h3>
      <div class="calculator__section">
        <h4 class="calculator__section__title">Base Case</h4>
        <div class="calculator__input">
          <label class="calculator__input__label" id="starting-salary-label" for="starting-salary">Starting Salary</label><br />
          <span class="calculator__input__prefix">$</span>
          <input type="text" class="currency" name="starting-salary" id="starting-salary" value="40,000" min="0" />
        </div>
        <div class="calculator__input">
          <label class="calculator__input__label" id="annual-raise-label" for="annual-raise">3.0% annual raise</label><br />
          <input value="3.0" class="calculator__slider" min="1" max="20" step="0.5" type="range" name="annual-raise[]" id="annual-raise" />
        </div>
        <div class="calculator__input">
          <label class="calculator__input__label" id="years-of-employment-label" for="years-of-employment">50 years of employment</label><br />
          <input value="50" class="calculator__slider" min="1" max="60" type="range" name="years-of-employment[]" id="years-of-employment" />
        </div>
      </div>
      <div class="calculator__result" id="impact-of-career-growth-calculator-result">
      </div>
    </form>
    <script type="text/javascript">
      document.addEventListener('DOMContentLoaded', () => {
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
        function formatCurrencyInput(value) {
          return convertToCurrency(parseCurrencyToFloat(value));
        }

        const calculator = document.querySelector('#impact-of-career-growth-calculator');

        if (calculator) {
          const inputs = calculator.querySelectorAll('input');
          const currencyInputs = calculator.querySelectorAll('input.currency');

          /* Basic inputs */
          const startingSalaryInput = calculator.querySelector('input#starting-salary');
          const startingSalaryLabel = calculator.querySelector('input#starting-salary-label');
          const annualRaiseInput = calculator.querySelector('input#annual-raise');
          const annualRaiseLabel = calculator.querySelector('#annual-raise-label');
          const yearsOfEmploymentInput = calculator.querySelector('input#years-of-employment');
          const yearsOfEmploymentLabel = calculator.querySelector('#years-of-employment-label');

          /* Output */
          const outputDiv = calculator.querySelector('#impact-of-career-growth-calculator-result');

          /* Calculate and update labels and results, flag errors */
          function updateResults() {
            const startingSalary = parseCurrencyToFloat(startingSalaryInput.value) || 0;
            const annualRaise = parseFloat(annualRaiseInput.value) / 100.0 || 0;
            const yearsOfEmployment = parseFloat(yearsOfEmploymentInput.value) || 0;

            /* Update labels */
            let annualRaiseText = (annualRaise * 100).toFixed(1);
            annualRaiseText +=  '% annual raise';
            annualRaiseLabel.innerHTML = annualRaiseText;

            let yearsOfEmploymentText = yearsOfEmployment + ' year';
            if (yearsOfEmployment != 1) {
              yearsOfEmploymentText += 's';
            }
            yearsOfEmploymentText += ' of employment';
            yearsOfEmploymentLabel.innerHTML = yearsOfEmploymentText;

            if (outputDiv) {
              /* Validate Inputs */
              if (startingSalary <= 0.0) {
                outputDiv.innerHTML = '<span class="calculator__result__error">Set a starting salary greater than zero</span>';
                return;
              }

              /* Update output */

              /* TODO: CALCULATE RESULTS HERE */

              let out = '<h4>Results</h4>';
              outputDiv.innerHTML = out;
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
              currencyInputs[i].value = formatCurrencyInput(currencyInputs[i].value);
            });
          }

          /* Update on load */
          updateResults();
        }
      });
    </script>
    END_OUTPUT

    expect(calc.render).to eq(expected_output)
  end
end
