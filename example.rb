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
