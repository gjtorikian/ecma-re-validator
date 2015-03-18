begin
  require 'awesome_print'
  require 'pry'
rescue LoadError; end

require 'ecma-re-validator/anchors'
require 'ecma-re-validator/lookbehind'

module EcmaReValidator

  def self.valid?(input)
    return false unless input.is_a? String
    begin
      Regexp.new(input)
    rescue RegexpError
      return false
    end

    return false unless Anchors.passes?(input)
    return false unless Lookbehind.passes?(input)
    true
  end
end
