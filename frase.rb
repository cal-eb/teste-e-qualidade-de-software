class Frase
	def initialize(entrada)		
		@entrada = entrada.downcase.gsub(/[,\n:!&@$%^?''^]/, ' ')
	end



	
	contagem = { 'palavra' => 1 }    
	 def conte_palavras			
		array = @entrada.split
		
		saida = {}
		
		for temp in array			
			 saida[temp.downcase] = saida[temp.downcase] != '' ? saida[temp.downcase].to_i + 1 : 1			
		end
		 return saida
	 end
end
