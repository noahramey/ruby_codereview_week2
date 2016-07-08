require('rspec')
require('word')

describe(Word) do
  before () do
    Word.clear()
  end

  describe('#word') do
    it('returns the word') do
      word1 = Word.new('pug')
      expect(word1.word()).to(eq('pug'))
    end
  end

  describe('#id') do
    it('returns the id of the word') do
      word1 = Word.new('pug')
      expect(word1.id()).to(eq(1))
    end
  end

  describe('#definitions') do
    it('returns an empty definitions array') do
      word1 = Word.new('pug')
      expect(word1.definitions()).to(eq([]))
    end
  end

  describe('.all') do
    it('returns the words array') do
      expect(Word.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('pushes word into the words array') do
      word1 = Word.new('pug')
      word1.save()
      expect(Word.all()).to(eq([word1]))
    end
  end

  describe('.clear') do
    it('empties the words array') do
      word1 = Word.new('pug')
      word1.save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe('.find') do
    it('returns the word that matches the id in the words array') do
      word1 = Word.new('pug')
      word1.save()
      word2 = Word.new('puppy')
      word2.save()
      expect(Word.find(word2.id())).to(eq(word2))
    end
  end
end
