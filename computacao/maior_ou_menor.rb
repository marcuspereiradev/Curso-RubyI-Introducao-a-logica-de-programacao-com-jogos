def da_boas_vindas
    puts "Bem vindo ao jogo da adivinhação"
    puts "Qual é o seu nome:"
    nome = gets

    puts "\n\n"

    puts "Começaremos o jogo para você, " + nome
end

def sorteia_numero_secreto
    puts "Escolhendo um número secreto entre 0 e 200..."
    sorteado = 175
    puts "Escolhido... que tal adivinhar hoje nosso número secreto?"
    sorteado #Em ruby não é necessário colocar o return
             #Por padrão ele retorna a última linha
end

def pede_um_numero(tentativas, limite_de_tentativas)
    puts "\n\n"
    puts "Tentativa " + tentativas.to_s + " de " + limite_de_tentativas.to_s
    puts "Entre com o número"
    chute = gets
    puts "Será que você acertou? Você chutou " + chute
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

limite_de_tentativas = 5
for tentativas in 1..limite_de_tentativas
    chute = pede_um_numero(tentativas, limite_de_tentativas)
    if verifica_se_acertou(numero_secreto, chute)
        break  
    end
end