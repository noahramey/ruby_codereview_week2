require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('./lib/definition')

get('/') do
  @words = Word.all()
  erb(:index)
end

get('/words') do
  @words = Word.all()
  erb(:index)
end

get('/words/new') do
  erb(:words_form)
end

post('/words') do
  @word = Word.new(params.fetch('word'))
  @word.save()
  @words = Word.all()
  erb(:word_success)
end

get('/words/:id') do
  @words = Word.all()
  @word = Word.find(params.fetch('id').to_i())
  erb(:word)
end

get('/words/:id/definitiions/new') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word_definitions_form)
end
