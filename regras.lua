
function avaliaJogada(tentativa)
--------------------------------------------
--Verifica se a tentativa tem alguma posicao
--em branco
--Parameter:
--    tentativa : tentativa de resposta
--------------------------------------------
local i=1
while(i<5) do
	if(tentativa[i]>4 or tentativa[i]<1)then
	return false
	end
	i=i+1
end
return true
end
