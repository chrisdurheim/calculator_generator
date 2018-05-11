# CalculatorGenerator

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/calculator_generator`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'calculator_generator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install calculator_generator

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/calculator_generator. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the CalculatorGenerator project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/calculator_generator/blob/master/CODE_OF_CONDUCT.md).

## Future Feature List (TODO)

- [x] Update .gitignore to filter junk
- [x] Split out input to multiple classes with inheritance
- [x] Improve templating (make blocks/procs and function calls for inputs, groups, etc)
- [ ] Configure output file
- [ ] Add nocss option for sites with pre-existing styling (like KT)
- [ ] Normalize/clearing rules for OTS calcs
- [ ] Set display resolution for slider labels (# of decimal points)
- [ ] Set up to split css for site-wide single styling sheet
- [ ] Fix collisions between KT base style (flexing inputs) and calcgen
- [ ] Add scaffold for tables
- [ ] Add scaffold for charts
- [ ] Structure scripts in folder instead of bin
- [ ] Backport styling differences from projects into generator
- [ ] Utility function: provide URL, scrape html, css, put calculator embedded in page
