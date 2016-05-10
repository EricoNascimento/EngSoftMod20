resposta={0,0,0,0}
tentativa={0,0,0,0}
lista=iup.list{}
tentativas=0
lista=iup.list{}


function getResultado()
--------------------------------------------
--Calcula a quantidade de acertos de posições
-- e cores
--------------------------------------------

local i=1
local j=1
local incPontuacaoCor=true
local qtdAcertosCor=0
local qtdAcertosPos=0

while(j<5) do
	while(i<5) do

		if(tentativa[j]==resposta[i])then
			if(incPontuacaoCor) then
			qtdAcertosCor=qtdAcertosCor+1
			incCor=false
			end
			if(i==j)then
			qtdAcertosPos=qtdAcertosPos+1
			break
			end
		end
	i=i+1
	end
	i=1
	j=j+1
	incPontuacaoCor=true
end

lista[tentativas][2].title=qtdAcertosPos
lista[tentativas][3].title=qtdAcertosCor
tentativas=tentativas+1
resetaTentativa()
local i =0

while(i<10) do
	if(i==tentativas) then
		lista[i].active="YES"
	else
		lista[i].active="NO"
	end
	iup.Refresh(lista[i])
	i=i+1
end


if(qtdAcertosPos>=4 and qtdAcertosCor>=4) then
return "VENCEDOR"
end

if(tentativas==10)then
return "PERDEDOR"
end


end


function geraResposta()
--------------------------------------------
--Sortei aleatoriamente uma resposta a ser
--descoberta
--------------------------------------------
resposta[1]=math.random(1,4)
resposta[2]=math.random(1,4)
resposta[3]=math.random(1,4)
resposta[4]=math.random(1,4)
end

function resetaTentativa()
--------------------------------------------
--Reinicia a tentativa de resposta
--------------------------------------------
tentativa[1]=0
tentativa[2]=0
tentativa[3]=0
tentativa[4]=0
end

function geraTentativa(index,value)
--------------------------------------------
--Preenche uma posição da tentativa de resposta
--------------------------------------------
tentativa[index]=value
end


function geraLinha(index,linha)
--------------------------------------------
--Armazena uma linha do tabuleiro
--------------------------------------------
lista[index]=linha
end

function getTentativa()
--------------------------------------------
--Obtem uma tentativa de resposta
--------------------------------------------
return tentativa
end
