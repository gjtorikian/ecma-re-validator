begin
  require 'awesome_print'
rescue LoadError; end

module EcmaReValidator
  def self.valid?(re)
    return false unless re.is_a? String
    begin
      Regexp.new(re)
    rescue RegexpError => e
      return false
    end

    true
  end
end
