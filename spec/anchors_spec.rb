require 'spec_helper'

describe 'EcmaReValidator::Anchors' do
  it 'should pass if regexp has no \A' do
    re = 'moby'

    expect(EcmaReValidator.valid?(re)).to eql(true)
  end

  it 'should pass if regexp is escaped \A' do
    re = 'moby\\\\A'

    expect(EcmaReValidator.valid?(re)).to eql(true)
  end

  it 'should fail if regexp is not escaped \A' do
    re = 'moby\\A'

    expect(EcmaReValidator.valid?(re)).to eql(false)
  end

  it 'should fail if regexp is not escaped \A, despite backslashes' do
    re = 'moby\\\\\\A'

    expect(EcmaReValidator.valid?(re)).to eql(false)
  end

  it 'should pass if regexp is escaped \A, with many backslashes' do
    re = 'moby\\\\\\\\A'

    expect(EcmaReValidator.valid?(re)).to eql(false)
  end

  it 'should pass if regexp has no \Z' do
    re = 'dick'

    expect(EcmaReValidator.valid?(re)).to eql(true)
  end

  it 'should pass if regexp is escaped \Z' do
    re = 'dick\\\\A'

    expect(EcmaReValidator.valid?(re)).to eql(true)
  end

  it 'should fail if regexp is not escaped \Z' do
    re = 'dick\\A'

    expect(EcmaReValidator.valid?(re)).to eql(false)
  end

  it 'should fail if regexp is not escaped \Z, despite backslashes' do
    re = 'moby\\\\\\Z'

    expect(EcmaReValidator.valid?(re)).to eql(false)
  end

  it 'should pass if regexp is escaped \Z, with many backslashes' do
    re = 'moby\\\\\\\\Z'

    expect(EcmaReValidator.valid?(re)).to eql(false)
  end
end
