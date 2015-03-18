module EcmaReValidator
  module Anchors
    def self.passes?(input, _)
      !slash_a?(input) && !slash_z?(input)
    end

    def self.slash_a?(input)
      slashes = input.match(/(\\+)?(\\A)/)
      slash_check(slashes)
    end

    def self.slash_z?(input)
      slashes = input.match(/(\\+)?(\\Z)/)
      slash_check(slashes)
    end

    def self.slash_check(slashes)
      return false if slashes.nil?
      return true if slashes[1].nil? && !slashes[2].nil?
      return false if slashes[1].length == 1
      modulo = slashes[1].length % 2
      return true if modulo == 0
      modulo == 1
    end
  end
end
