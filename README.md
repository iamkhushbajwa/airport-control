airport-control
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
To run the application:

```shell
irb
require "./lib/airport"
require "./lib/plane"
ba101 = Plane.new
egll = Airport.new
egll.allow_landing(ba101)
egll.allow_take_off(ba101)
```
If the airport is under sunny conditions it will allow
landing and take off, or else if it is under stormy conditions
it will produce a runtime error.

### Issues to be resolved
* Single-class responsibility: the weather could be a class by itself.
* Some interface would be great, however, this wasn't the aim of the test.
