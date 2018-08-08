def da_boas_vindas
    puts "Bem vindo ao jogo da adivinhação"
    puts "Qual é o seu nome:"
    nome = gets.strip

    puts "\n\n"

    puts "Começaremos o jogo para você, #{nome}"
end

def sorteia_numero_secreto
    puts "Escolhendo um número secreto entre 0 e 200..."
    sorteado = rand(200)
    puts "Escolhido... que tal adivinhar hoje nosso número secreto?"
    sorteado #Em ruby não é necessário colocar o return
             #Por padrão ele retorna a última linha
end

def pede_um_numero(chutes, tentativas, limite_de_tentativas)
    puts "\n\n"
    puts "Tentativa #{tentativas} de #{limite_de_tentativas}"
    puts "Chutes até agora: #{chutes}"
    puts "Entre com o número"
    chute = gets.strip
    puts "Será que você acertou? Você chutou #{chute}"
    chute.to_i
end

def verifica_se_acertou(numero_secreto, chute)
    acertou = numero_secreto == chute

    if acertou
        puts "Você acertou!"
        return true
    end 

    maior = numero_secreto > chute.to_i
    if maior
        puts "O número secreto é maior!"
    else
        puts "O número secreto é menor!"
    end
    false
end


da_boas_vindas
numero_secreto = sorteia_numero_secreto
pontos_ate_agora = 1000
limite_de_tentativas = 5
chutes = []

for tentativas in 1..limite_de_tentativas
    chute = pede_um_numero(chutes, tentativas, limite_de_tentativas)
    chutes << chute
    pontos_a_perder = (chute - numero_secreto).abs / 2.0
    pontos_ate_agora -= pontos_a_perder
    if verifica_se_acertou(numero_secreto, chute)
        break  
    end
end

puts "Você ganhou #{pontos_ate_agora} pontos!"