begin
  require 'awesome_print'
rescue LoadError; end

module EcmaReValidator
  def self.valid?(input)
    return false unless input.is_a? String
    begin
      re = Regexp.new(input)
    rescue RegexpError
      return false
    end

    true
  end
end
