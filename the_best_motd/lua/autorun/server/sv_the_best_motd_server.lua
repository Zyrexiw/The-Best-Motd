util.AddNetworkString("TheBestMotd::NetsOpen")
function Spawn(ply)
    net.Start("TheBestMotd::NetsOpen")
    net.Send(ply)
end

hook.Add( "PlayerSpawn", "TheBestMotd::Hooks", Spawn )