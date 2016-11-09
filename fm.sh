
#!/bin/bash

#trabalho_aula3
#criado por Rodrigo Cardoso da Silva
#data:09/11/16



#segue abaixo comandos solicitados


#Comando para listar as opções diponiveis no sistema
principal() 

{           # Função principal do programa
    clear               # limpa a tela

    echo "[1] Mostrar a localização atual do usuário no sistema de arquivos"  
    echo "[2] Mostrar o tipo de um arquivo"  
    echo "[3] Criar um diretório"
    echo "[4] Apagar um diretório não vazio"
    echo "[5] ler 2 números e indicar qual é o maior deles e qual é o menor"
    echo "[6] Exibir as últimas linhas de um arquivo"
    echo "[7] Exibir as primeiras linhas de um arquivo"
    echo "[8] Mostrar a localização de um comando específico"
    echo "[9] Mostra um diretório informado pelo usuário em formato de árvore"
    echo "[10] Copiar um arquivo para um outro diretório"
    echo "[11] Mover um arquivo para outro diretório"
    echo "[12] Sair"

    echo
#usuário deve selecionar uma opção
    echo -n "Qual a opcao desejada ? "
    read opcao          # faz a leitura da variável "opcao", 
                        # que será utilizada no comando case
                        # para indicar qual a opção a ser utilizada

                        # caso o valor da variável "opcao"...
    case $opcao in
        1)              # seja igual a "1", então faça as instruções abaixo
            clear
			localizacao_arquivos
		;;                                
        2)
            clear
			mostrar_tipo_arquivo           
		;; 

        3)
            clear
           	criar_diretorio
		;; 
        4)
            clear
			deletar_diretorio		
		;; 
        5)
            clear
			mostra_maior   
		;;
        6)
			clear
			ultimas_linhas
        ;; 
        7)
            clear
			primeiras_linhas
        ;; 
		8)
            clear
			localizar_comando          
		;; 
        9)
            clear
			diretorio_form_arvore
        ;; 
        10)
            clear
			copiar_arquivo
        ;; 
        11)
            clear
           	mover_arquivo
		;; 
		12)
            clear
            exit ;;

        *)              
            clear
            echo "Opcao desconhecida."
            read pause
            principal   
        ;;
    esac
}







localizacao_arquivos() {             #localização arquivos
    pwd 
    read pause          # usado para pausar a execução do script
    principal           # volta para a função principal
}

mostrar_tipo_arquivo() {             # mostra se é um arquivo de texto ou shell 
    clear
    echo "digite arquivo"
	read ARQUIVO
	file $ARQUIVO	
    read pause
    principal
}

criar_diretorio() {             # serve pra criar um diretorio e definir o nome dele 
    clear
    echo "digite o diretorio que quer criar"
	read DIRETORIO
	mkdir $DIRETORIO
    read pause
	principal	
}

deletar_diretorio() {             # serve para deletar um diretório
    clear
	echo "digite o diretorio que quer deletar"
	read DIRETORIO
	rm -r $DIRETORIO 	
    read pause
    principal
}

mostra_maior() {             # serve para mostrar o maior entre 2 números
    clear
	echo "digite o primeiro numero"
		read NUMERO1
		echo "digite o segundo numero"
		read NUMERO2
		if [ $NUMERO1 -gt $NUMERO2 ]; then
			
			echo "O numero maior é: " $NUMERO1
		else
			echo "O numero maior é: " $NUMERO2
		fi
	read pause
    principal		
    
}

ultimas_linhas() {             # serve para mostrar as ultimar linhas de um texto
    clear
	echo "digite o nome do arquivo"
	read ARQUIVO
	echo "digite a quantidade de linha que quer exibir"
	read LINHAS
	tail -$LINHAS $ARQUIVO
    read pause 
	principal	
}

primeiras_linhas() {             # serve para mostrar as primeiras linhas de um texto
    clear
	echo "digite o nome do arquivo"
	read ARQUIVO
	echo "digite a quantidade de linha que quer exibir"
	read LINHAS
	head -$LINHAS $ARQUIVO
    read pause
	principal	
}

localizar_comando() {             # serve para mostrar a localização de um comando
	clear
    echo "Digite o comando"
	read COMANDO
	which $COMANDO 
    read pause          
    principal           
}

diretorio_form_arvore() {             # função informa a localização de um arquivo em formato de árvore
    clear
	echo "Digite o Diretorio"
	read DIRETORIO
	tree $DIRETORIO
    read pause          
    principal           
}

copiar_arquivo() {             # serve para copiar um arquivo para um local
    clear
	echo "Digite o arquivo que deseja copiar"
	read ARQUIVO
	echo "Digite para onde deseja copiar o arquivo"
	read LOCAL
	cp $ARQUIVO $LOCAL  
    read pause          
    principal           
}

mover_arquivo() {             # serve pra mover os arquivos
    clear
    echo "Digite o arquivo que deseja mover"
	read ARQUIVO
	echo "Digite para onde deseja mover mais o nome do arquivo"
	read LOCAL
	mv $ARQUIVO $LOCAL  
    read pause          
    principal            
}

opcao_invalida() {      # opção invalida
    clear
    echo "Opcao desconhecida."
    read pause
    principal
}

principal  

#fim do script para verificar as informações necessária e solicitadas           
