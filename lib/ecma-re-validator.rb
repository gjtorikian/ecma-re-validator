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
      i == :lookbehind || i == :nlookbehind || \
      # JS doesn't have atomic groping
      i == :atomic || \
      # JS doesn't have possesive quantifiers
      i == :zero_or_one_possessive || i == :zero_or_more_possessive || \
      i == :one_or_more_possessive
    end
  end
end
