
local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
--O código fora das funções de evento de cena abaixo será executado apenas UMA VEZ, a menos que
-- a cena é totalmente removida (não reciclada) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local physics = require ("physics")
physics.start ()
physics.setGravity ( 0, 0)
physics.setDrawMode ("normal")

display.setStatusBar (display.HiddenStatusBar)

local grupoBg
local grupoMain
local grupoUi
local bg
local lixos
local LixaMarela
local LixaAzul
local LixaCinza
local LixaVerde
local LixaVermelha
local LixaMarrom
local pontos = 0
local pontuacaoText
local lataamassada
local latasardinha
local radio
local maca
local espinhapeixe
local tvelha
local folhacaderno
local garrafapet
local laptop
local garrafaquebrada
local latarefri 
local jornal
local copoplastico
local cascabanana
local vidroquebrado
local numObj


local bgAudio = audio.loadStream ("audio/8-bit-game-158815.mp3") -- ("pasta/arquivo.formato")
-- Reservando um canal de audio o som de fundo estara (são 32)
audio.reserveChannels (3)
-- Especificar o volume desse canal 
audio.setVolume (0.1, {channel=3})
-- Reproduzindo o audio
--          (audio a reproduzir/a variavel, {canal, loopins (-1 infinito)})
audio.play (bgAudio, {channel=1, loops=-1}) 


-----
local function atualizaPontuacao()
    
    pontos = pontos + 100 -- Incrementa 100 pontos ao colidir com a LixaMarela
end

local function endLevel ()
    if (numObj < 1) then
        composer.gotoScene("parabensScene", { effect = "flip", time = 500 })   
    end
    

end

---- lata refri (1)-----
local function colideCom(objeto1, objeto2)
    local dx = objeto1.x - objeto2.x
    local dy = objeto1.y - objeto2.y
    local distancia = math.sqrt(dx * dx + dy * dy)
    return distancia <= (objeto1.width + objeto2.width) / 2


end

local function toqueObjeto(event)
    local objeto = event.target

    if event.phase == "began" then
        display.getCurrentStage():setFocus(objeto)
        objeto.isFocus = true
        objeto.startX = objeto.x
        objeto.startY = objeto.y
    elseif objeto.isFocus then
        if event.phase == "moved" then
            objeto.x = event.x
            objeto.y = event.y
        elseif event.phase == "ended" or event.phase == "cancelled" then
            display.getCurrentStage():setFocus(nil)
            objeto.isFocus = false

            
            if (objeto == latarefri) then
                if colideCom(LixaMarela, objeto) then
                    atualizaPontuacao()
                    pontuacaoText.text = "Pontuação: " .. pontos
                    
                    
                    objeto:removeSelf()
                    objeto = nil -- Define o objeto como nulo após removê-lo
                    numObj = numObj - 1
                else
                    objeto.x = objeto.startX
                    objeto.y = objeto.startY
                end
            elseif (objeto == lataamassada) then
                if colideCom(LixaMarela, objeto) then
                    atualizaPontuacao()
                    pontuacaoText.text = "Pontuação: " .. pontos

            
                    
                    objeto:removeSelf()
                    objeto = nil -- Define o objeto como nulo após removê-lo
                    numObj = numObj - 1
                else
                    objeto.x = objeto.startX
                    objeto.y = objeto.startY
                end



            elseif (objeto == latasardinha) then
                if colideCom(LixaMarela, objeto) then
                    atualizaPontuacao()
                    pontuacaoText.text = "Pontuação: " .. pontos
                    
                    objeto:removeSelf()
                    objeto = nil -- Define o objeto como nulo após removê-lo
                    numObj = numObj - 1
                else
                    objeto.x = objeto.startX
                    objeto.y = objeto.startY
                end
            elseif (objeto == maca) then
                if colideCom(LixaMarrom, objeto) then
                    atualizaPontuacao()
                    pontuacaoText.text = "Pontuação: " .. pontos
                    
                    objeto:removeSelf()
                    objeto = nil -- Define o objeto como nulo após removê-lo
                    numObj = numObj - 1
                else
                    objeto.x = objeto.startX
                    objeto.y = objeto.startY
                end
            elseif (objeto == cascabanana) then
                if colideCom(LixaMarrom, objeto) then
                    atualizaPontuacao()
                    pontuacaoText.text = "Pontuação: " .. pontos
                    
                    objeto:removeSelf()
                    objeto = nil -- Define o objeto como nulo após removê-lo
                    numObj = numObj - 1
                else
                    objeto.x = objeto.startX
                    objeto.y = objeto.startY
                end
            elseif (objeto == radio) then
                if colideCom(LixaCinza, objeto) then
                    atualizaPontuacao()
                    pontuacaoText.text = "Pontuação: " .. pontos
                    
                    objeto:removeSelf()
                    objeto = nil -- Define o objeto como nulo após removê-lo
                    numObj = numObj - 1
                else
                    objeto.x = objeto.startX
                    objeto.y = objeto.startY
                end
            elseif (objeto == espinhapeixe) then
                if colideCom(LixaMarrom, objeto) then
                    atualizaPontuacao()
                    pontuacaoText.text = "Pontuação: " .. pontos
                    
                    objeto:removeSelf()
                    objeto = nil -- Define o objeto como nulo após removê-lo
                    numObj = numObj - 1
                else
                    objeto.x = objeto.startX
                    objeto.y = objeto.startY
                end
            elseif (objeto == laptop) then
                if colideCom(LixaCinza, objeto) then
                    atualizaPontuacao()
                    pontuacaoText.text = "Pontuação: " .. pontos
                    
                    objeto:removeSelf()
                    objeto = nil -- Define o objeto como nulo após removê-lo
                    numObj = numObj - 1
                else
                    objeto.x = objeto.startX
                    objeto.y = objeto.startY
                end
            elseif (objeto == tvelha) then
                if colideCom(LixaCinza, objeto) then
                    atualizaPontuacao()
                    pontuacaoText.text = "Pontuação: " .. pontos
                    
                    objeto:removeSelf()
                    objeto = nil -- Define o objeto como nulo após removê-lo
                    numObj = numObj - 1
                else
                    objeto.x = objeto.startX
                    objeto.y = objeto.startY
                end
            elseif (objeto == folhacaderno) then
                if colideCom(LixaAzul, objeto) then
                    atualizaPontuacao()
                    pontuacaoText.text = "Pontuação: " .. pontos
                    
                    objeto:removeSelf()
                    objeto = nil -- Define o objeto como nulo após removê-lo
                    numObj = numObj - 1
                else
                    objeto.x = objeto.startX
                    objeto.y = objeto.startY
                end
            elseif (objeto == jornal) then
                if colideCom(LixaAzul, objeto) then
                    atualizaPontuacao()
                    pontuacaoText.text = "Pontuação: " .. pontos
                    
                    objeto:removeSelf()
                    objeto = nil -- Define o objeto como nulo após removê-lo
                    numObj = numObj - 1
                else
                    objeto.x = objeto.startX
                    objeto.y = objeto.startY
                end
            elseif (objeto == garrafaquebrada) then
                if colideCom(LixaVerde, objeto) then
                    atualizaPontuacao()
                    pontuacaoText.text = "Pontuação: " .. pontos
                    
                    objeto:removeSelf()
                    objeto = nil -- Define o objeto como nulo após removê-lo
                    numObj = numObj - 1
                else
                    objeto.x = objeto.startX
                    objeto.y = objeto.startY
                end
            elseif (objeto == vidroquebrado) then
                if colideCom(LixaVerde, objeto) then
                    atualizaPontuacao()
                    pontuacaoText.text = "Pontuação: " .. pontos
                    
                    objeto:removeSelf()
                    objeto = nil -- Define o objeto como nulo após removê-lo
                    numObj = numObj - 1
                else
                    objeto.x = objeto.startX
                    objeto.y = objeto.startY
                end
            elseif (objeto == copoplastico) then
                if colideCom(LixaVermelha, objeto) then
                    atualizaPontuacao()
                    pontuacaoText.text = "Pontuação: " .. pontos
                    
                    objeto:removeSelf()
                    objeto = nil -- Define o objeto como nulo após removê-lo
                    numObj = numObj - 1
                else
                    objeto.x = objeto.startX
                    objeto.y = objeto.startY
                end
            elseif (objeto == garrafapet) then
                if colideCom(LixaVermelha, objeto) then
                    atualizaPontuacao()
                    pontuacaoText.text = "Pontuação: " .. pontos
                    
                    objeto:removeSelf()
                    objeto = nil -- Define o objeto como nulo após removê-lo
                    numObj = numObj - 1
                else
                    objeto.x = objeto.startX
                    objeto.y = objeto.startY
                end
            end
        end
    end

    return true
end

-- -----------------------------------------------------------------------------------
-- Funções de evento de cena
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen
    grupoBg = display.newGroup ()
    sceneGroup:insert (grupoBg)
    grupoMain = display.newGroup ()
    sceneGroup:insert (grupoMain)
    grupoUi = display.newGroup ()
    sceneGroup:insert (grupoUi)
    
    numObj = 15

    bg = display.newImageRect (grupoBg,"imagens/bg.png", 612*2.6, 309*2.6)
    bg.x = display.contentCenterX -- localização horizontal
    bg.y = display.contentCenterY -- localização vertical 
    
    lixos = display.newImageRect (grupoBg, "imagens/lixos.png", 455/1.4, 366/1.4)
    lixos.x = 150
    lixos.y = 550
    
    LixaMarela = display.newImageRect (grupoMain, "imagens/lixeira-amarela.png", 113/1.2, 118/1.2)
    LixaMarela.x = 570
    LixaMarela.y = 500
    
    LixaAzul = display.newImageRect (grupoMain, "imagens/lixeira-azul.png", 113/1.2, 118/1.2)
    LixaAzul.x = 650
    LixaAzul.y = 500
    
    LixaCinza = display.newImageRect (grupoMain, "imagens/lixeira-cinza.png", 113/1.2, 118/1.2)
    LixaCinza.x = 730
    LixaCinza.y = 500
    
    LixaVerde= display.newImageRect (grupoMain, "imagens/lixeira-verde.png", 113/1.2, 118/1.2)
    LixaVerde.x = 810
    LixaVerde.y = 500
    
    LixaVermelha = display.newImageRect (grupoMain, "imagens/lixeira-vermelha.png", 113/1.2, 118/1.2)
    LixaVermelha.x = 890
    LixaVermelha.y = 500
    
    LixaMarrom = display.newImageRect (grupoMain, "imagens/lixeira-marrom.png", 376/4.2, 413/4.2)
    LixaMarrom.x = 970
    LixaMarrom.y = 500
    
    lataamassada = display.newImageRect(grupoMain, "imagens/lata-amassada.png", 151 / 2, 138 / 2)
    lataamassada.x = 140
    lataamassada.y = 390
    
    latasardinha = display.newImageRect (grupoMain, "imagens/lata-sardinha.png", 109/1.2, 96/1.2)
    latasardinha.x = 190
    latasardinha.y = 670
    
    radio = display.newImageRect(grupoMain, "imagens/radio.png", 360/4, 360/4)
    radio.x = 80
    radio.y = 430
    
    maca = display.newImageRect (grupoUi, "imagens/maca.png", 155/1.2, 152/1.2)
    maca.x = 140
    maca.y = 470
    
    espinhapeixe = display.newImageRect (grupoMain, "imagens/espinha-peixe.png", 160/1.2, 158/1.2) -- imagem peixe
    espinhapeixe.x = 190
    espinhapeixe.y = 470
    
    tvelha = display.newImageRect (grupoMain, "imagens/tv-velha.png", 500/3, 500/3)
    tvelha.x = 200
    tvelha.y = 400
    
    folhacaderno = display.newImageRect (grupoMain, "imagens/folha-caderno.png", 178/2, 205/2)
    folhacaderno.x = 170
    folhacaderno.y = 410
    
    garrafapet = display.newImageRect (grupoMain, "imagens/garrafa-pet.png", 100/2, 169/2)
    garrafapet.x = 100
    garrafapet.y = 410
    
    laptop = display.newImageRect (grupoMain, "imagens/laptop.png", 500/3, 500/3)
    laptop.x = 90
    laptop.y = 350
    
    garrafaquebrada = display.newImageRect (grupoMain, "imagens/garrafa-quebrada.png", 164/1.2, 139/1.2)
    garrafaquebrada.x = 200
    garrafaquebrada.y = 350
    
    latarefri = display.newImageRect (grupoMain, "imagens/latarefri.png", 81/1.2, 139/1.2)
    latarefri.x = 260
    latarefri.y = 400
    
    jornal = display.newImageRect (grupoMain, "imagens/jornal.png", 136/1.2, 162/1.2)
    jornal.x = 300
    jornal.y = 675
    
    copoplastico = display.newImageRect (grupoMain, "imagens/copo-plastico.png", 142/1.2, 173/1.2)
    copoplastico.x = 140
    copoplastico.y = 645
    
    cascabanana = display.newImageRect (grupoMain, "imagens/casca-banana.png", 164/1.2, 170/1.2)
    cascabanana.x = 70
    cascabanana.y = 655
    
    vidroquebrado = display.newImageRect (grupoMain, "imagens/vidro-quebrado.png", 176/1.2, 222/1.2)
    vidroquebrado.x = 330
    vidroquebrado.y = 550   

    pontuacaoText = display.newText( grupoMain, "Pontuação: " .. pontos, display.contentCenterX, 200,  display.contentCenterY, 100, left, native.systemFont, 60 )
    pontuacaoText:setFillColor( 0, 0, 0 )


    local imgCpdi = display.newImageRect (sceneGroup,"imagens/do.png", 454/5, 346/5)
    imgCpdi.x = 950
    imgCpdi.y = 650
    
    local logoChamps = display.newImageRect (sceneGroup,"imagens/ecochampes7.png", 470/1.3, 254/1.3)
    logoChamps.x = 900
    logoChamps.y = 170

end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		--O código aqui é executado quando a cena ainda está fora da tela (mas está prestes a aparecer na tela)


	elseif ( phase == "did" ) then
		-- O código aqui é executado quando a cena está inteiramente na tela
        physics.start ()
        latarefri:addEventListener("touch", toqueObjeto)
        lataamassada:addEventListener("touch", toqueObjeto)
        latasardinha:addEventListener("touch", toqueObjeto)
        maca:addEventListener("touch", toqueObjeto)
        cascabanana:addEventListener("touch", toqueObjeto)
        radio:addEventListener("touch", toqueObjeto)
        espinhapeixe:addEventListener("touch", toqueObjeto)
        laptop:addEventListener("touch", toqueObjeto)
        tvelha:addEventListener("touch", toqueObjeto)
        folhacaderno:addEventListener("touch", toqueObjeto)
        jornal:addEventListener("touch", toqueObjeto)
        garrafaquebrada:addEventListener("touch", toqueObjeto)
        vidroquebrado:addEventListener("touch", toqueObjeto)
        copoplastico:addEventListener("touch", toqueObjeto)
        garrafapet:addEventListener("touch", toqueObjeto)
        Runtime:addEventListener ("enterFrame", endLevel)

	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- O código aqui é executado quando a cena está na tela (mas está prestes a sair da tela)

	elseif ( phase == "did" ) then
		-- O código aqui é executado imediatamente após a cena sair totalmente da tela
        Runtime:removeEventListener ("enterFrame", endLevel)
        physics.pause ()
        composer.removeScene ("game")

	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
-- O código aqui é executado antes da remoção da visualização da cena
end


-- -----------------------------------------------------------------------------------
-- Ouvintes de função de evento de cena
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
