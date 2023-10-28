

local composer = require("composer")
local widget = require("widget")
local scene = composer.newScene()

local function onBackButtonTap(event)
    if (event.phase == "ended") then
        composer.gotoScene("menu", { effect = "flip", time = 500 })
    end
    return true
end



local function showCredits(sceneGroup)
   
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



    local creditsTextOptions = {
        text = [[Desenvolvedores:

        Glória Barboza
        Gustavo Maya
        Isabela S.

        Bibliografia e Recursos:
        Linguagem de Programação: Lua
        Motor de Jogo: Solar 2D
        Canvas: Plataforma online de design e comunicação
        Vista Create: Software gratuito de design gráfico
        Pixabay: Site de partilha de midia sem royalties (Grand_Project)
        Lua.org: Manual de Referência de Lua 5.2

        Agradecimentos:
        Ao Comitê para Democratização da Informática (CPDI Fpolis)
        ]],
        x = 70,
        y = 160,
        width = display.contentWidth - 10,
        font = native.systemFont,
        fontSize = 22,
        align = "left",
        }

        local creditsText = display.newText(creditsTextOptions)
        creditsText.anchorX, creditsText.anchorY = 0, 0
        creditsText:setFillColor(0, 0, 0) 
        scrollView:insert(creditsText)
    
        sceneGroup:insert(scrollView)
    end
    
    function scene:create(event)
        local sceneGroup = self.view



    local bg = display.newImageRect (sceneGroup,"imagens/bg.png", 612*2.6, 309*2.6)
    bg.x = display.contentCenterX -- localização horizontal
    bg.y = display.contentCenterY -- localização vertical 

   
    local imgCpdi = display.newImageRect (sceneGroup,"imagens/do.png", 454/4, 346/4)
    imgCpdi.x = 900
    imgCpdi.y = 650

    local creditsTitle = display.newText(sceneGroup, "Créditos", display.contentCenterX, 30, native.systemFontBold, 24)
    creditsTitle:setFillColor(0, 0, 0)

    showCredits(sceneGroup)

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



