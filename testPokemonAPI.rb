require 'httparty'
#teste com rspec

class TestPokemomAPI
	include HTTParty
	base_uri 'https://pokeapi.co/api/v2'
end


RSpec.describe 'TESTE DE API - GET' do
	it 'Deve retornar todos os pokemon cadastrados e suas respectivas url' do 
		begin
			response = TestPokemomAPI.get('/type/3/')
			expect(response.code).to eql(200)
     	    puts response
		end
	end

	it 'Deve retornat status code 404 not found' do
		begin
			response = TestPokemomAPI.get('/type/3/PIKACHU')
			expect(response.code).to eql(404)
			#puts response.body
		end
	end
end



