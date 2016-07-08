require('rspec')
require('definition')

describe(Definition) do
  describe('#define') do
    it('returns the definition') do
      definition1 = Definition.new('small dog')
      expect(definition1.define()).to(eq('small dog'))
    end
  end

  describe('#id') do
    it('returns the id of the definition') do
      definition1 = Definition.new('small dog')
      expect(definition1.id()).to(eq(1))
    end
  end

  describe('.all') do
    it('returns the definitions array') do
      expect(Definition.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('pushes definition into the definitions array') do
      definition1 = Definition.new('small dog')
      definition1.save()
      expect(Definition.all()).to(eq([definition1]))
    end
  end

  describe('.clear') do
    it('empties the definitions array') do
      definition1 = Definition.new('small dog')
      definition1.save()
      Definition.clear()
      expect(Definition.all()).to(eq([]))
    end
  end

  describe('.find') do
    it('returns the definition that matches the id in the definitions array') do
      definition1 = Definition.new('small dog')
      definition1.save()
      definition2 = Definition.new('large dog')
      definition2.save()
      expect(Definition.find(definition2.id())).to(eq(definition2))
    end
  end
end
