
function IniciaJogo()
--------------------------------------------
--Exibe o tabuleiro do jogo
--------------------------------------------
  tabuleiro=getComponente("TABULEIRO")
  tabuleiro:showxy( iup.CENTER, iup.CENTER)
  menu_jogo:hide()
  geraResposta()

end

function EscolherCor(posicao)
--------------------------------------------
--Abre a interface que permite a escoha da cor
-- para uma posi��o da tentativa.
--Parameter:
--    posicao : posicao da tentativa
--------------------------------------------
btnAtual=posicao
cores=getComponente("MENU_COR")
cores:showxy( iup.CENTER, iup.CENTER)
end

function ConfirmaCor(color)
--------------------------------------------
--Registra a cor escolhida para uma posi��o
--da tentativa.
--Parameter:
--   color : objeto da cor escolhida
--------------------------------------------
btnAtual.image=color.image

local i =tonumber(btnAtual.tip)

if(color.tip=="Vermelho")then
geraTentativa(i,1)
elseif(color.tip=="Verde")then
geraTentativa(i,2)
elseif(color.tip=="Azul")then
geraTentativa(i,3)
elseif(color.tip=="Violeta")then
geraTentativa(i,4)
end

cores:hide()

end


function FazerJogada()
--------------------------------------------
--Realiza a tentativa de uma resposta para o resultado.
--------------------------------------------

if(avaliaJogada(getTentativa()))then
	resultado=getResultado()
	if(resultado=="VENCEDOR")then
		mensagem=getComponente("MENSAGEM_VITORIA")
		tabuleiro:hide()
	elseif(ressultado=="PERDEDOR")then
		mensagem=getComponente("MENSAGEM_DERROTA")
		tabuleiro:hide()
	end

else
	mensagem=getComponente("MENSAGEM_JOGADA_INVALIDA")

end


end