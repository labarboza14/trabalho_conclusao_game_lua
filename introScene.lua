

local composer = require("composer")
local widget = require("widget")
local scene = composer.newScene()

local function onBackButtonTap(event)
    if (event.phase == "ended") then
        composer.gotoScene("menu", { effect = "flip", time = 500 })
    end
    return true
end


local function showIntroScene(sceneGroup)
   
    local scrollView = widget.newScrollView(
        {
            x = display.contentCenterX,
            y = display.contentCenterY,
            width = display.contentWidth,
            height = display.contentHeight +20 ,
            backgroundColor = { 0, 0, 0, 0 }, -- Define o scroll como transparente
            horizontalScrollDisabled = true,
            hideScrollBar = false
        }
    )



   
        local introTextOptions = { text = [[
           O Eco Champs é uma atividade divertida sobre o descarte correto do lixo.
            
           - Há um container cheio de resíduos que devem ser descartados de acordo com a sua origem.
            
           - Para jogar arraste e solte o lixo (resíduo) na lixeira correta. Ganhe 100 pontos a cada acerto.
            
           - Não se preocupe, se errar, o resíduo retorna para o container e você tem nova chance de acertar!
            
           - O desafio só termina quando você descarta os 14 resíduos corretamente. 
            
           Divirta-se, aprenda e mostre que você é um especialista no descarte seletivo! 
                    
            ]],

            x = 10,
            y = 390,
            width = display.contentWidth - 10,
            font = native.systemFont,
            fontSize = 20,
            align = "left",
            }
    
            local introText = display.newText(introTextOptions)
            introText.anchorX, introText.anchorY = 0, 0
            introText:setFillColor(0, 0, 0) 
            scrollView:insert(introText)
        
            sceneGroup:insert(scrollView)
        end
        
        function scene:create(event)
            local sceneGroup = self.view

    
    local bg = display.newImageRect (sceneGroup, "imagens/bg.png", 612*3, 309*3)
    bg.x = display.contentCenterX
    bg.y = display.contentCenterY
        

    local logoChamps = display.newImageRect (sceneGroup,"imagens/ecochampes7.png", 470, 297)
	logoChamps.x = 500
	logoChamps.y = 220
	

    local imgCpdi = display.newImageRect(sceneGroup, "imagens/do.png", 453 / 4, 356 / 4) 
    imgCpdi.x = 900 
    imgCpdi.y = 650

    local introTitle = display.newText(sceneGroup, "Como jogar Eco Champs", display.contentCenterX, 30, native.systemFontBold, 24)
    introTitle:setFillColor(0, 0, 0)


    showIntroScene(sceneGroup)

    local backButton = widget.newButton(
        {
            label = "Menu",
            fontSize = 18,
            font = native.systemFontBold,
            labelColor = { default = { 000 }, over = { 128 } },
            onEvent = onBackButtonTap
        }
    )
    backButton.x = 900
    backButton.y = 590
    sceneGroup:insert(backButton)

end

function scene:hide(event)
    local sceneGroup = self.view
    local phase = event.phase

    if (phase == "will") then
        if (sceneGroup.scrollView) then
            sceneGroup.scrollView:removeSelf()
            sceneGroup.scrollView = nil
        end
    end
end

function scene:show(event)
    local phase = event.phase

    if (phase == "will") then
        local sceneGroup = self.view
        if (sceneGroup.scrollView) then
            sceneGroup.scrollView.isVisible = true
        end
    end
end

scene:addEventListener("create", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("show", scene)

return scene



