


local ReplicatedStorage = game:GetService("ReplicatedStorage") local LMSSongs = ReplicatedStorage :WaitForChild("Sounds") :WaitForChild("Songs") :WaitForChild("LMSSongs") local LOCAL_FOLDER = "GameSounds" local DEFAULT_VOLUME = 1 local TARGET_URL = "https://file.garden/afAJhE1KfUrCTlUD/Breakcore%20Metal%20(1).mp3" -- fetch file from URL using executor local function fetchUrl(url) if syn and syn.request then local r = syn.request({Url = url, Method = "GET"}) if r and r.Body then return r.Body end end if http and http.request then local r = http.request({Url = url, Method = "GET"}) if r and r.Body then return r.Body end end if request then local r = request({Url = url, Method = "GET"}) if r and r.Body then return r.Body end end end local function ensureFolder() if not isfolder(LOCAL_FOLDER) then makefolder(LOCAL_FOLDER) end end local function writeAudio(data) ensureFolder() local path = LOCAL_FOLDER .. "/LMS.ogg" writefile(path, data) return path end local function toAsset(path) if getcustomasset then return getcustomasset(path) elseif getsynasset then return getsynasset(path) end end -- download once local audioData = fetchUrl(TARGET_URL) if not audioData then warn("Failed to download LMS audio") return end local filePath = writeAudio(audioData) local assetId = toAsset(filePath) if not assetId then warn("Failed to register custom asset") return end -- replace every LMS sound for _, sound in ipairs(LMSSongs:GetChildren()) do if sound:IsA("Sound") then sound.SoundId = assetId sound.Volume = DEFAULT_VOLUME sound.Looped = true end end print("[LMS] All default LMS tracks replaced.") 










