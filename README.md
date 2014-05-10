airport-control [![Code Climate](https://codeclimate.com/github/khushkaran/airport-control.png)](https://codeclimate.com/github/khushkaran/airport-control)
---
Week 3 test at Makers Academy.

We had to create a Ruby application that would display aiport
control. Planes should be able to land and take off from
difference airports. However, we were tasked with an extension;
to include a weather conditions element, so that planes could
only land/take off in sunny conditions.

### Technologies
* Ruby
* Git
* Object-oriented-programming
* Test-driven-development with RSpec


### Instructions
To run the application run `irb`:

```ruby
require "./lib/airport"
=> true
require "./lib/plane"
=> true
ba101 = Plane.new
=> #<Plane:0x007f98c4234380 @state="Flying">
egll = Airport.new
=> #<Airport:0x007f98c4227a40 @capacity=100, @planes=[], @weather="Sunny">
egll.allow_landing(ba101)
=> [#<Plane:0x007f98c4234380 @state="Landed">]
egll.allow_take_off(ba101)
=> #<Plane:0x007f98c4234380 @state="Flying">
egnx = Airport.new
=> #<Airport:0x007f98c41ef528 @capacity=100, @planes=[], @weather="Stormy">
egnx.allow_landing(ba101)
RuntimeError: Airport is under storm conditions, no landing/take off is possible
```

If the airport is under sunny conditions it will allow
landing and take off, or else if it is under stormy conditions
it will produce a runtime error.

### Issues to be resolved
* Single-class responsibility: the weather could be a class by itself.
* Some interface would be great, however, this wasn't the aim of the test.
