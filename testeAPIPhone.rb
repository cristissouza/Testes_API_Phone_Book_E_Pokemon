require 'httparty'

class TesteDeAPI
	include HTTParty
	base_uri "http://localhost:5000"
end 

responseContact = TesteDeAPI.get("/contacts")

RSpec.describe 'Teste de API - POST' do
	it 'Deve cadastrar um elemento' do
		completeUser = {
			'name' => 'Jorge',
			'mobilephone' => '332109456785',
			'homephone' => '0552187654345'
		}
		begin
			response = TesteDeAPI.post('/contacts', body:completeUser)
			expect(response.code).to eql(201)
		end
	end
end



RSpec.describe 'Teste de API - PUT' do
	it 'Deve modificar os dados de um usuário' do
		userUpdate ={
		     'mobilephone': '6545678699876',
		}
		begin 
			response = TesteDeAPI.put('/contacts/56d5efa8c82593800291c02b', body:userUpdate) #update o usuário Tester
			expect(response.code).to eql(204)
		end
	end
end




RSpec.describe 'Teste de API - DELETE' do
	it 'Deve deletar um usuário cadastrado' do
		# usetID ={
		# 	'_id' => '56d5efa8c82593800291c02b'
		# }
		begin 
			response = TesteDeAPI.delete('/contacts/56d5efa8c82593800291c02b') #deleta o usuário tester
			expect(response.code).to eql(204)
			puts response.body
		end
	end

 # 	it 'Não deve deletar o usuário' do 
 # 		begin
 # 			response = TesteDeAPI.delete('/contacts/56d5efa8c82593800291c21y')
	# 		expect(response.code).to eql(404)
	# 	end
	# end
end


RSpec.describe 'Teste de API - GET' do
	it 'Deve verificar a existência de um elemento' do
		begin
			response = responseContact
			expect(response[0]['name']).to eql('Tester')
			expect(response.code).to eql(200)
			puts response.code
		end
	end
end

RSpec.describe 'Teste de API - GET' do
	it 'Deve retornar todos os contatos cadastrados' do
		begin
			response = responseContact
			expect(response.code).to eql(200)
			puts response.body
		end
	end
end
