local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Loader", "DarkTheme")

local LoaderTab = Window:NewTab("Loader")
local LoaderSection = LoaderTab:NewSection("Loader")

-- GitHub URL where the key is stored
local keyURL = "https://raw.githubusercontent.com/krusher911/DexoWare/refs/heads/main/key.txt"  -- Replace with your raw GitHub URL

-- Variable to store the entered key
local enteredKey = ""

-- Text Box for Key Input
LoaderSection:NewTextBox("Enter Key", "The Key On GitHub", function(inputKey)
    enteredKey = inputKey  -- Store the entered key
end)

-- Button to Confirm Key
LoaderSection:NewButton("Confirm Key", "Click to Confirm Key", function()
    -- Fetch the key from GitHub
    local keyFromGitHub = game:HttpGet(keyURL)

    -- Check if the entered key is correct
    if enteredKey == keyFromGitHub:match("%S+") then  -- Using match("%S+") to trim any extra whitespace
        -- Attempt to load the main script
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/krusher911/DexoWare/refs/heads/main/DexoWare.lua", true))()
        end)
        
        -- Error handling if script loading fails
        if not success then
            -- You can log the error to the console if needed
            print("Error loading script: " .. err)
        end

        -- Close the UI after loading the script
        Window:Close() 
    else
        -- You can log the wrong key attempt to the console if needed
        print("Wrong key entered.")
    end
end)
