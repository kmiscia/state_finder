# State Finder

Finds which state a given coordinate is located in. States and borders are incomplete, and defined in states.json

## Usage

To start server `./state-server &`

To query server `curl -d "longitude=-77.036133&latitude=40.513799" http://localhost:8080/`

(Note: Because of the state-server wrapper surrounding the Sinatra app start, the printed
PID of the process is not the actual server proc PID)

## Requirements

Ruby 1.9+ (https://www.ruby-lang.org/en/news/2014/11/13/ruby-1-9-3-p551-is-released/)

RubyGems (https://rubygems.org/pages/download if `which gem` returns nothing)

## References

Ray Casting Algorithm - https://en.wikipedia.org/wiki/Point_in_polygon

Formula of Line - http://www.purplemath.com/modules/strtlneq.htm

## Potential Improvements

- Unit tests on models. Integration testing of the query end-point.

- Environment setup as a part of server start-up (for users who do not have Ruby and/or RubyGems installed)