module CalculatorGenerator
  class OTSStyle < Style
    def initialize(opts = {}, &block)
      super(opts, &block)
      brand_color            '#2e7d32'
      bg_color               '#F5F5F6'
      border_color           '#2e7d32'
      focus_color            '#00bcd4'
      slider_bar_color       '#ffffff'
      slider_hover_bg_color  '#eeeeee'
      error_color            '#b71c1c'
      max_width              '90%'
    end
    private
    def to_css
      css = super
      css += %Q(
  #{calc_class} {
    font-size: 16px;
    font-family: sans-serif;
    border-radius: 1rem;
    border: 1px solid #{@brand_color};
    max-width: 600px;
  }
  #{calc_class} h3, #{calc_class} h4, #{calc_class} h5, #{calc_class} h6 {
    border-radius: 0.5rem;
    text-transform: uppercase;
    margin: 0 auto;
  }
  #{calc_class} h3 {
    font-size: 1.75rem;
  }
  #{calc_class} h4 {
    font-size: 1.5rem;
  }
  #{calc_class} h5 {
    font-size: 1.25rem;
  }
  #{calc_class} h6 {
    font-size: 1.125rem;
  }
  #{calc_class} input, #{calc_class} p, #{calc_class} li {
    font-size: 1.0rem;
  }
  #{calc_class} .calculator-input label {
    color: #555555;
  })
    end
  end
end
