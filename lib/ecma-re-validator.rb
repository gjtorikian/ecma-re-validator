begin
  require 'awesome_print'
  require 'pry'
rescue LoadError; end

require 'ecma-re-validator/anchors'

module EcmaReValidator

  def self.valid?(input)
    return false unless input.is_a? String
    begin
      re = Regexp.new(input)
    rescue RegexpError
      return false
    end

    return false unless Anchors.passes?(input, re)
    true
  end
end
