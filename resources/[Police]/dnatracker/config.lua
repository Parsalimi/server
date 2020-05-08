DnaTracker = {}
local MFD = DnaTracker
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; end)

Citizen.CreateThread(function(...)
  while not ESX do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; end)
    Citizen.Wait(0)
  end
end)

MFD.Version = '1.0.10'

MFD.BloodObject = "p_bloodsplat_s"
MFD.ResidueObject = "w_pi_flaregun_shell"

-- JOB Database Table: LABEL
MFD.PoliceJob = "LSPD"
MFD.AmbulanceJob = "LSFD"

MFD.DNAAnalyzePos = vector3(454.69, -979.95, 30.68)
MFD.AmmoAnalyzePos = vector3(461.17, -979.74, 30.68)
MFD.DrawTextDist = 3.0
MFD.MaxObjCount = 10