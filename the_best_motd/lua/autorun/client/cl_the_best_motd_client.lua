surface.CreateFont( "The_fonts1", {
    font = "Bubbleboddy", 
    extended = false,
    size = ScreenScale(25),
} )

surface.CreateFont( "The_fonts_b_1", {
    font = "Bubbleboddy", 
    extended = false,
    size = ScreenScale(15),
} )

local function rx(x) return x/1920*ScrW() end
local function ry(y) return y/1080*ScrH() end
local MotdFrame

function remove()
    if IsValid(MotdFrame) then 
        MotdFrame:Remove()
    end
end
-- variable
local gradientMaterial = Material("vgui/gradient-l", "smooth")

function TheBestMOTDOpen()
    MotdFrame = vgui.Create("DFrame")
    MotdFrame:SetSize( ScrW(), ScrH() )
    MotdFrame:SetPos( 0, 0 )
    MotdFrame:SetTitle("")
    MotdFrame:MakePopup()
    MotdFrame:SetDraggable(false)
    MotdFrame:ShowCloseButton(false)
    function MotdFrame:Paint(w, h)
        surface.SetDrawColor(ThebestMotdConfig.ColorTable["Background"])
        surface.SetMaterial(gradientMaterial)
        surface.DrawTexturedRect(0, 0, w, h)


        surface.SetDrawColor(color_white)
        surface.SetMaterial(ThebestMotdConfig.avatarserver)
        surface.DrawTexturedRect(rx(20), ry(40), rx(148), ry(148))
    end

    
    local Link = vgui.Create("DHTML", MotdFrame)
    Link:SetSize(rx(800), ry(600))
    Link:SetPos(rx(1000), ry(80))
    Link:OpenURL(ThebestMotdConfig.link)

    local TitleButton = vgui.Create("DLabel", MotdFrame)
    TitleButton:SetText(ThebestMotdConfig.TitleServer)
    TitleButton:SetPos(rx(200), ry(70))
    TitleButton:SetFont("The_fonts1")
    TitleButton:SetTextColor(color_white)
    TitleButton:SizeToContents()

    local panelB = vgui.Create("DPanel", MotdFrame)
    panelB:SetSize(rx(500), ry(600))
    panelB:SetPos(rx(50), ry(250))
    panelB.Paint = nil

    for k , v in pairs(ThebestMotdConfig.buttons) do
        local button = vgui.Create("DButton", panelB)
        button:SetSize(rx(0), ry(50))
        button:Dock(TOP)
        button:DockMargin(5, 25, 5, 5)
        button:SetText("")
        button.OnCursorEntered = function( self ) self.hover = true surface.PlaySound("UI/buttonrollover.wav") end
        button.OnCursorExited = function( self ) self.hover = false end
        button.Slide = 0
        button.Paint = function(s, w ,h)
            surface.SetDrawColor(ThebestMotdConfig.ColorTable["Buttons"])
            surface.SetMaterial(gradientMaterial)
            surface.DrawTexturedRect(0, 0, w, h)

            draw.SimpleText(v.name, "The_fonts_b_1", rx(10), ry(2), color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
            if s.hover then
                s.Slide = Lerp( 0.05, s.Slide, w )

                draw.RoundedBox(1, 0, ry(46), s.Slide, ry(4), Color( 26, 188, 156, 255 ) )
            else
                s.Slide = Lerp( 0.05, s.Slide, 0 )
                draw.RoundedBox(1, 0, ry(46), s.Slide, ry(4), Color( 26, 188, 156, 255 ) )
            end
        end
        button.DoClick = v.func
    end

end
net.Receive("TheBestMotd::NetsOpen", TheBestMOTDOpen)

concommand.Add("cl_openmotd", function()
    TheBestMOTDOpen()
end)


