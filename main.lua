require( "iuplua" )
require("regras")
require("controle")
require("actions")
require("icones")


function getComponente(componente)
--------------------------------------------
--Obtem algum dos componentes graficos do jogo
--Parameter:
--    componente : nome do componente
--------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
if(componente=="MENU_INICIA_JOGO")then
btn_IniciaJogo = iup.button{ title = "Iniciar Jogo", size = "70x30",action=IniciaJogo }
title	= iup.label { title = "SENHA",
                  bgcolor = "255 255 0",
                  fgcolor = "255 0 0",
                  font = "COURIER_BOLD_14",
                  alignment = "ACENTER" }
menu = iup.hbox
		  {
			iup.fill {},
			iup.vbox
			{
			  iup.fill{},
			  iup.fill{},
			  title,
			  iup.fill{},
			  btn_IniciaJogo,
			  iup.fill{},
			  iup.fill{};
			  alignment = "ACENTER",
			},
			iup.fill {}
		  }

dlg_menu = iup.dialog{ menu; title = "Menu", resize = "NO", menubox = "NO", maxbox = "NO", minbox = "NO",size="200x200" }
return dlg_menu

end
-----------------------------------------------------------------------------------------------------------------------------
if(componente=="TABULEIRO")then
jogar = iup.button{ title = "Jogar", size = "216x30",action=FazerJogada}
vbox = iup.vbox {gap="25"}

headerPos	= iup.label { title = "Pos",
                  bgcolor = "255 255 0",
                  fgcolor = "255 0 0",
                  font = "COURIER_BOLD_14"}

headerColor	= iup.label { title = "Cor",
                  bgcolor = "255 255 0",
                  fgcolor = "0 0 255",
                  font = "COURIER_BOLD_14"}
headerTentativa	= iup.label { title = "Tentativas",
                  bgcolor = "255 255 0",
                  fgcolor = "0 0 0",
                  font = "COURIER_BOLD_14"}

headerTab= iup.hbox{ headerPos,headerColor,iup.fill{},headerTentativa,iup.fill{},iup.fill{},
					 ALIGNMENT="ACENTER",
					 margin="0x2"
			  }
iup.Append(vbox,headerTab)

local i = 0
while(i<10) do

	pos	= iup.label { title = "0",
                  bgcolor = "255 255 0",
                  fgcolor = "255 0 0",
                  font = "COURIER_BOLD_14"}

	color	= iup.label { title = "0",
                  bgcolor = "255 255 0",
                  fgcolor = "0 0 255",
                  font = "COURIER_BOLD_14"}

	linha = iup.hbox{	iup.fill{},pos,color,
					iup.button{image = img_1,action=EscolherCor,tip="1"},
				    iup.button{image = img_1,action=EscolherCor,tip="2"},
				    iup.button{image = img_1,action=EscolherCor,tip="3"},
				    iup.button{image = img_1,action=EscolherCor,tip="4"},
					iup.fill{},
					ALIGNMENT="ACENTER",
					margin="0x2"
			  }
	if(i==0) then
	linha.active="YES"
	else
	linha.active="NO"
	end

	geraLinha(i,linha)
	iup.Append(vbox,linha)


	i=i+1;
end

iup.Append(vbox,jogar)
tabuleiro = iup.dialog{vbox; title="Dialog",resize="NO",size="220x405"}
return tabuleiro

end
-------------------------------------------------------------------------------------------------------------------------
if(componente=="MENU_COR")then
escolha= iup.hbox{	iup.fill{},
					iup.button{image = img_2,action=ConfirmaCor,tip="Vermelho"},
				    iup.button{image = img_3,action=ConfirmaCor,tip="Verde"},
					iup.button{image = img_4,action=ConfirmaCor,tip="Azul"},
					iup.button{image = img_5,action=ConfirmaCor,tip="Violeta"},
					iup.fill{},
				    ALIGNMENT="ACENTER",
					margin="0x2"
				 }
dialEscolha=iup.dialog{escolha;title="Escolha uma cor",resize="NO",size="170x50"}
return dialEscolha
end
--------------------------------------------------------------------------------------------------------------------------
if(componente=="MENSAGEM_VITORIA")then
mensagem_vitoria=iup.Message("Você ganhou!!!","Parabéns!!!")
return mensagem_vitoria

end
---------------------------------------------------------------------------------------------------------------------------
if(componente=="MENSAGEM_DERROTA")then

mensagem_derrota=iup.Message("Você perdeu","Mais sorte na próxima.")
return mensagem_vitoria

end
---------------------------------------------------------------------------------------------------------------------------
if(componente=="MENSAGEM_JOGADA_INVALIDA")then

mensagem_error=iup.Message("Erro","Jogada Inválida")
return mensagem_vitoria

end
----------------------------------------------------------------------------------------------------------------------------

end



--Inicia o programa--
tabuleiro=0
menu_jogo=getComponente("MENU_INICIA_JOGO")
menu_jogo:showxy( iup.CENTER, iup.CENTER)



if (iup.MainLoopLevel()==0) then
  iup.MainLoop()
end
