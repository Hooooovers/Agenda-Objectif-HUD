surface.CreateFont( "FontObjectif", {
	font = "Arial",
	size = 20,
	weight = 500,

})

surface.CreateFont( "FontTitre", {
	font = "IMPACT",
	size = 25,
	weight = 500,

})

hook.Add("HUDPaint", "DrawMyHuddd", function()


	draw.RoundedBox(2,ScrW()-210,10,200,50,Color(0,0,0,130))
	draw.RoundedBox(2,ScrW()-210,70,200,50,Color(0,0,0,130))

	draw.DrawText(AgendaConfig.AgendaText[1][2], "FontTitre", ScrW()-210 , 10, Color(255,255,255) , TEXT_ALIGN_LEFT ) 
	draw.DrawText(AgendaConfig.AgendaText[2][2], "FontObjectif", ScrW()-210 , 40, Color(255,255,255) , TEXT_ALIGN_LEFT ) 
	draw.DrawText(AgendaConfig.AgendaText[3][2], "FontTitre", ScrW()-210 , 70, Color(255,255,255) , TEXT_ALIGN_LEFT ) 
	draw.DrawText(AgendaConfig.AgendaText[4][2], "FontObjectif", ScrW()-210 , 100, Color(255,255,255) , TEXT_ALIGN_LEFT ) 
	surface.SetDrawColor( 255, 255, 255)
	surface.DrawLine(ScrW()-210, 35, ScrW()-10, 35 ) 
	surface.DrawLine(ScrW()-210, 95, ScrW()-10, 95 ) 
end)




net.Receive("ObjectifDerma", function()

	local frame = vgui.Create( "DFrame" )
	frame:SetSize( 500, 300 )
	frame:SetTitle( "Menu Agenda" )
	frame:Center()
	frame:ShowCloseButton(false)
	frame:MakePopup()
	frame.Paint = function()
		draw.RoundedBox( 0, 0, 0, frame:GetWide(), frame:GetTall(), Color(24,24,24) )

	end

	local closeButton = vgui.Create("DButton", frame)
	closeButton:SetSize( 70, 20 )
	closeButton:SetPos( 430 , 0 )
	closeButton:SetColor( Color( 255, 255, 255 ))
	closeButton:SetText("X")


	closeButton.Paint = function( )
		if closeButton.isHover then
			draw.RoundedBox( 0, 0, 0, closeButton:GetWide(), closeButton:GetTall(), Color( 192, 57, 43 ) )
		else
			draw.RoundedBox( 0, 0, 0, closeButton:GetWide(), closeButton:GetTall(), Color( 231, 76, 60 ) )
		end
	end

	closeButton.OnCursorEntered = function()
		closeButton.isHover = true
	end

	closeButton.OnCursorExited = function()
		closeButton.isHover = false
	end

	closeButton.DoClick = function()
		frame:Close()
	end

	for i = 1,4 do
		local LabelObjectif = vgui.Create("DLabel", frame)
		LabelObjectif:SetPos(25, (60*i)-20)
		LabelObjectif:SetText(AgendaConfig.AgendaText[i][1])
		LabelObjectif:SetFont("FontObjectif")

		local TextObjectif = vgui.Create( "DTextEntry", frame )
		TextObjectif:SetPos(25, (60*i))
		TextObjectif:SetSize( 425, 25 )
		TextObjectif:SetText(AgendaConfig.AgendaText[i][2])
		TextObjectif.OnEnter = function( self )
			AgendaConfig.AgendaText[i][2] = self:GetValue()
		end

	end


end)