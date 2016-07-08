require('rspec')
require('definition')

describe(Word) do
  describe('#define') do
    it('returns the definition') do
      definition1 = Definition.new('small dog')
      expect(definition1.define()).to(eq('small dog'))
    end
  end
end
