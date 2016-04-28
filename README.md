# Parser

<a href="https://codeclimate.com/github/marclerodrigues/parser"><img src="https://codeclimate.com/github/marclerodrigues/parser/badges/gpa.svg" /></a>

Quake 3 log parse proposed by Code Miner 42 as a test for admission.

## Proposed Solution

Create a Parse module to parse the log file using Rules that can be found at modules/rules as Regular Expressions, using these Rules and the classes Game, Player and Kill the parser is able to solve the problem proposed, fulfilling all the requirements requested.

## Installation

In order to use this gem you need to build and install.
To build do:
```
$ gem build parser.gemspec
```

To install do:
```
$ gem install parser-0.1.0.gem
```

## Usage

```ruby
require 'parse' #Require the gem

Parser.set_game #Sets the initial conditions to the game
Parset.parse "{PATH_TO_FILE_LOG}" #Parses the log file
game = Parser.games.sample #Takes a random game from file
puts game.hash #Shows the game stats as a hash
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/parser/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request