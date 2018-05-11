module CalculatorGenerator
  class Style
    def initialize(opts = {}, &block)
      @site = opts[:site]
      @site_styles = opts[:site_styles] || []
      @options = opts
      @brand_color = opts[:brand_color] || '#558B2F'
      @bg_color = opts[:bg_color] || '#F5F5F5'
      @border_color = opts[:border_color] || '#d6d6d6'
      @focus_color = opts[:focus_color] || '#4DBED2'
      @slider_bar_color = opts[:slider_bar_color] || '#9E9E9E'
      @error_color = opts[:error_color] || '#ac0000'
      @max_width = opts[:max_width] || '90%'

      if block_given?
        instance_eval(&block)
      end
    end

    def site_styles(array);           @site_styles = array;           end
    def brand_color(value);           @brand_color = value;           end
    def bg_color(value);              @bg_color = value;              end
    def border_color(value);          @border_color = value;          end
    def focus_color(value);           @focus_color = value;           end
    def slider_bar_color(value);      @slider_bar_color = value;      end
    def slider_hover_bg_color(value); @slider_hover_bg_color = value; end
    def error_color(value);           @error_color = value;           end
    def max_width(value);             @max_width = value;             end

    def to_html
      html = ""
      @site_styles.each do |style|
        html += "<link rel='stylesheet' href='#{style}' type='text/css' media='all' />\n"
      end
      html += "<style>\n" + to_css + "\n</style>\n"
    end

    private

    def site_class
      @site.gsub(' ', '-').gsub(/[^\w-]/, '').gsub(/(-){2,}/, '-').downcase
    end

    def calc_class
      return '.calculator' unless @site
      ".#{site_class}-calculator"
    end

    def to_css
      css =
%Q(  #{calc_class} {
    background-color: #{@bg_color};
    margin: 2rem auto;
    padding: 2rem 2rem 0;
    border-radius: 0.2rem;
    border: 2px solid #{@brand_color};
    max-width: #{@max_width};
    clear: both;
  }
  #{calc_class} .calculator-input-group {
    padding: 1rem 0;
  }
  #{calc_class} h3.calculator-title, #{calc_class} .calculator-result h4 {
    padding: 1rem 0;
    //font-size: 2rem;
    text-align: center;
    text-transform: uppercase;
  }
  #{calc_class} h4.calculator-group-title {
    background-color: #{@brand_color};
    margin-bottom: 1rem;
    padding: 0.5rem;
    color: white;
    text-align: center;
  }

  #{calc_class} .calculator-input {
    display: flex;
    flex-wrap: wrap;
    margin: 1rem 0 0;
  }
  #{calc_class} .calculator-input label {
    flex: 0 0 100%;
    padding: 0.25rem 0;
    color: black;
  }
  #{calc_class} .calculator-input .input-prefix {
    flex: 0 0 auto;
    padding: 0.5rem;
    margin: 0 0.25rem;
    line-height: 2rem;
  }
  #{calc_class} .calculator-input input {
    flex: 1 0 auto;
    width: auto;
    max-width: 50%;
    padding: 0.5rem;
    margin: 0 0.25rem;
    //font-size: 1rem;
    border: 1px solid #{@border_color};
  }
  #{calc_class} .calculator-input input:focus {
    outline: none;
    border: 1px solid #{@focus_color};
  }
  #{calc_class} .calculator-input select.input-suffix {
    flex: 0 0 auto;
    width: auto;
    padding: 0.5rem;
    margin: 0 0.25rem;
  }
  #{calc_class} input.slider {
    margin-top: 1rem;
    width: 100%;
    max-width: 100%;
  }
  #{calc_class} .slider {
    -webkit-appearance: none;
    appearance: none;
    height: 0.5rem;
    border-radius: 0.5rem;
    border-color: #{@slider_bar_color};
    color: #{@slider_bar_color};
    background: #{@slider_bar_color};
    outline: none;
    opacity: 1;
    -webkit-transition: .2s;
    transition: opacity .2s;
    margin-top: 1rem !important;
    margin-bottom: 1rem !important;
    padding: 0 !important;
  }
  #{calc_class} .slider:hover {
    background: #{@slider_hover_bg_color || @bg_color};
  }
  #{calc_class} .slider::-webkit-slider-thumb {
    -webkit-appearance: none;
    appearance: none;
    width: 1.5rem;
    height: 1.5rem;
    border-radius: 50%;
    background: #{@brand_color};
    cursor: pointer;
  }

  #{calc_class} .slider::-moz-range-thumb {
    width: 1.5rem;
    height: 1.5rem;
    border-radius: 50%;
    background: #{@brand_color};
    cursor: pointer;
  }
  #{calc_class} .calculator-result {
    //font-size: 0.9rem;
    margin-top: 2rem;
    overflow-x: auto;
  }
  #{calc_class} .calculator-result .result-value {
    font-weight: bold;
  }
  #{calc_class} .calculator-result .result-error {
    //font-size: 1.5rem;
    color: #{@error_color};
  }
  #{calc_class} .calculator-result .calculator-highlighted-result {
    text-align: center;
    background-color: #{@error_color};
    color: white;
    //font-size: 1.8rem;
  }
  #{calc_class} .calculator-result-table {
    max-width: 100%;
    overflow-x: scroll;
    //font-size: 0.8rem;
  }
  #{calc_class} .calculator-result-table tr {
    transition: background-color 50ms, color 50ms;
  }
  #{calc_class} .calculator-result-table tr:hover td {
    background-color: #{@brand_color};
    color: white;
  }
  #{calc_class} .calculator-result-table th {
    text-align: center;
  }
  #{calc_class} .calculator-result-table td, .calculator-result-table th {
    padding: 0 0.5rem;
  }
  #{calc_class} .calculator-result-table .currency-column {
    text-align: center;
  }
  #{calc_class} button.calculator-button {
    width: 100%;
    background-color: #{@brand_color};
    margin: 0 auto;
    cursor: pointer;
    text-align: center;
  }
  #{calc_class} .calculator-attribution {
    text-align: center;
    font-size: 0.8rem;
    font-style: italic;
    margin-top: 2rem;
    padding: 1rem 0.5rem;
    border-top: 1px solid #{@border_color};
  }
  #{calc_class} .calculator-attribution a {
    font-size: 0.8rem;
    color: #{@brand_color};
    text-decoration: none;
  }
  #{calc_class} .calculator-attribution a:hover {
    color: #{@focus_color};
    text-decoration: underline;
  })
    end
  end
end
