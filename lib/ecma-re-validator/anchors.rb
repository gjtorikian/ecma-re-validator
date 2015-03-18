module EcmaReValidator
  module Anchors
    def self.passes?(input, _)
      !slash_a?(input) && !slash_z?(input)
    end

    def self.slash_a?(input)
      input =~ /(?<!\\)\\A/
    end

    def self.slash_z?(input)
      input =~ /(?<!\\)\\Z/
    end
  end
end
