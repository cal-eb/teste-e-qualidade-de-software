require 'rspec/autorun'
require_relative 'Frase'

describe Frase, '#conte_palavras' do
  context 'contagem de ocorrências de palavras' do
    it 'conta uma palavra' do      
       frase = Frase.new('palavra')
       frase.conte_palavras
       contagem = { 'um' => 1, 'dois' => 1, 'quatro' => 1 }
      contagem = { 'palavra' => 1 }    
      expect(frase.conte_palavras).to eq contagem
      
    end

    it 'conta uma de cada palavra' do
      frase = Frase.new('uma de cada')
      # puts frase.conte_palavras
      contagem = { 'uma' => 1, 'de' => 1, 'cada' => 1 }
      expect(frase.conte_palavras).to eq contagem
    end

    it 'conta múltiplas ocorrências de uma palavra' do
      frase = Frase.new('um peixe dois peixe vermelho peixe azul peixe')
      contagem = { 'um' => 1, 'peixe' => 4, 'dois' => 1,
                   'vermelho' => 1, 'azul' => 1 }
      expect(frase.conte_palavras).to eq contagem
    end
  end

  context 'separação das palavras' do
    it 'separa frases sem espaço' do
      frase = Frase.new('um,dois,quatro')
      contagem = { 'um' => 1, 'dois' => 1, 'quatro' => 1 }
      expect(frase.conte_palavras).to eq contagem
    end

    it 'separa frases com quebras de linha' do
      frase = Frase.new("um,\ndois,\nquatro")      
      # puts frase.conte_palavras
      contagem = { 'um' => 1, 'dois' => 1, 'quatro' => 1 }
      expect(frase.conte_palavras).to eq contagem
    end

    it 'separa frases com pontuações' do
      frase = Frase.new('carro: tapete como java: javascript!!&@$%^&')
      contagem = { 'carro' => 1, 'tapete' => 1, 'como' => 1,
                   'java' => 1, 'javascript' => 1 }
      expect(frase.conte_palavras).to eq contagem
    end

    it 'separa palavras e números' do
      frase = Frase.new('testando, 1, 2 testando')
      contagem = { 'testando' => 2, '1' => 1, '2' => 1 }
      expect(frase.conte_palavras).to eq contagem
    end
   end

  context 'agrupamento' do
    it 'agrupa a mesma palavra em maiúsculo e minúsculo' do
      frase = Frase.new('vai Vai VAI Para para')
      contagem = { 'vai' => 3, 'para' => 2 }
      expect(frase.conte_palavras).to eq contagem
    end

    it 'agrupa a mesma palavra com e sem aspas' do
      frase = Frase.new("Ele quis dizer 'grande' ou grande?")
      contagem = { 'ele' => 1, 'quis' => 1, 'dizer' => 1, 'grande' => 2,
                   'ou' => 1 }
      expect(frase.conte_palavras).to eq contagem
    end
  end
end
