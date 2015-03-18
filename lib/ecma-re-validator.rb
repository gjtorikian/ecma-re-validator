begin
  require 'awesome_print'
  require 'pry'
rescue LoadError; end

require 'regexp_parser'

module EcmaReValidator

  def self.valid?(input)
    if input.is_a? String
      begin
        input = Regexp.new(input)
      rescue RegexpError => e
        ap e
        return false
      end
    elsif !input.is_a? Regexp
      return false
    end

    tokens = Regexp::Scanner.scan(input)

    items = []
    tokens.each { |a| items << a[1] }

    items.flatten!
    items.none? do |i|
      # JS doesn't have \A or \Z
      i == :bos || i == :eos_ob_eol || \
      # JS doesn't have lookbehinds
      i == :lookbehind || i == :nlookbehind
    end
  end
end
