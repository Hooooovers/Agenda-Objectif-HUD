util.AddNetworkString( "ObjectifDerma" )

hook.Add("PlayerSay", "Objectif" , function(ply , text)
	if string.lower(string.sub(text , 1 , 9)) == "!objectif" then

		if table.HasValue(AgendaConfig.AdminRanks,ply:GetUserGroup()) then
			net.Start("ObjectifDerma")
			net.Send(ply)

		end
	end

end)