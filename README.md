# ecma-re-validator

Pass in a string to validate if it would work in ECMA-262, aka JavaScript.

## Usage

``` ruby
require 'ecma-re-validator'

re = "[Ss]mith\\\\b"

EcmaReValidator.valid?(re) # true
```
