require 'spec_helper'

describe 'EcmaRe' do
  it 'should fail if regexp is not a string' do
    re = /(\w)/

    expect(EcmaReValidator.valid?(re)).to eql(false)
  end

  it 'should fail if string is not resolvable' do
    re = '(\w'

    expect(EcmaReValidator.valid?(re)).to eql(false)
  end

  it 'passes for a valid regexp' do
    re = "[Ss]mith\\\\b"

    expect(EcmaReValidator.valid?(re)).to eql(true)
  end
end
