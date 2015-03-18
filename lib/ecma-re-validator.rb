begin
  require 'awesome_print'
  require 'pry'
rescue LoadError; end

require 'regexp_parser'

module EcmaReValidator

  def self.valid?(input)
    return false unless input.is_a? String
    begin
      re = Regexp.new(input)
    rescue RegexpError => e
      return false
    end

    tokens = Regexp::Scanner.scan(re)

    items = []
    tokens.each { |a| items << a[1] }

    items.flatten!
    items.none? do |i|
      # JS doesn't have \A or \Z
      i == :bos || i == :eos_ob_eol || \
      # JS doesn't have lookbehinds
      i == :lookbehind
    end
  end
end
