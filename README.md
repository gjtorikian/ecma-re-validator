# ecma-re-validator

[![Build Status](https://travis-ci.org/gjtorikian/ecma-re-validator.svg?branch=master)](https://travis-ci.org/gjtorikian/ecma-re-validator)

Pass in a string to validate if it would work in ECMA-262, aka JavaScript.

The information for what is valid and what isn't comes from <http://www.regular-expressions.info/javascript.html>.

## Usage

``` ruby
require 'ecma-re-validator'

re = "[Ss]mith\\\\b"

EcmaReValidator.valid?(re) # true
```
