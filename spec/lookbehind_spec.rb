require 'spec_helper'

describe 'EcmaReValidator::Lookbehind' do
  it 'should pass if regexp has no positive lookbehind' do
    re = 'peer'

    expect(EcmaReValidator.valid?(re)).to eql(true)
  end

  it 'should fail if regexp has a positive lookbehind' do
    re = '(?<=a)b'

    expect(EcmaReValidator.valid?(re)).to eql(false)
  end

  it 'should pass if regexp has an escaped positive lookbehind' do
    re = '(?<=a\\)b'

    expect(EcmaReValidator.valid?(re)).to eql(true)
  end
end
