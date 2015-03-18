module EcmaReValidator
  module Lookbehind
    def self.passes?(input)
      !positive_lookbehind?(input) # && !negative_lookbehind?(input)
    end

    # we want to match (?<=a), and there can be all sorts of parens in the way.
    def self.positive_lookbehind?(input)
      scanner = StringScanner.new(input)
      open_paren = close_paren = 0
      pos = scanner.scan(/\(\?\<\=/)

      binding.pry
      return false if pos.nil? # nothing resembling a backreference found!

      while scanner.scan(/[^()]+/)
        case s = scanner.scan(/(?<!\\)[\(\)]+/)
        when '('
          open_paren += 1
        when ')'
          close_paren += 1
        end
      end
      ap open_paren
      ap close_paren
      open_paren == close_paren - 1
    end

    def self.negative_lookbehind?(input)
      input =~ /(?<!\\)\\Z/
    end

  end
end
