local WindUI = require("./src/init")

-- Test



-- Set theme:
--WindUI:SetTheme("Light")

--- EXAMPLE !!!

function gradient(text, startColor, endColor)
    local result = ""
    local length = #text

    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r = math.floor((startColor.R + (endColor.R - startColor.R) * t) * 255)
        local g = math.floor((startColor.G + (endColor.G - startColor.G) * t) * 255)
        local b = math.floor((startColor.B + (endColor.B - startColor.B) * t) * 255)

        local char = text:sub(i, i)
        result = result .. "<font color=\"rgb(" .. r ..", " .. g .. ", " .. b .. ")\">" .. char .. "</font>"
    end

    return result
end

local Confirmed = false

WindUI:Popup({
    Title = "Welcome! Popup Example",
    Icon = "rbxassetid://77799629590713",
    IconThemed = true,
    Content = "This is an Example UI for the " .. gradient("WindUI", Color3.fromHex("#00FF87"), Color3.fromHex("#60EFFF")) .. " Lib",
    Buttons = {
        {
            Title = "Cancel",
            --Icon = "",
            Callback = function() end,
            Variant = "Secondary", -- Primary, Secondary, Tertiary
        },
        {
            Title = "Continue",
            Icon = "arrow-right",
            Callback = function() Confirmed = true end,
            Variant = "Primary", -- Primary, Secondary, Tertiary
        }
    }
})


repeat wait() until Confirmed

-- Start

local Window = WindUI:CreateWindow({
    Title = "WindUI Library",
    Icon = "rbxassetid://77799629590713",
    IconThemed = true,
    Author = "Example UI",
    Folder = "CloudHub",
    Size = UDim2.fromOffset(580, 460),
    Transparent = true,
    Resizable = true,
    Theme = "Dark",
    User = {
        Enabled = true, -- <- or false
        Callback = function() print("clicked") end, -- <- optional
        Anonymous = true -- <- or true
    },
    SideBarWidth = 200,
    -- HideSearchBar = true, -- hides searchbar
    ScrollBarEnabled = true, -- enables scrollbar
    -- Background = "rbxassetid://13511292247", -- rbxassetid only

    -- remove it below if you don't want to use the key system in your script.
    KeySystem = { -- <- keysystem enabled
        Key = { "1234", "5678" },
        Note = "Example Key System. \n\nThe Key is '1234' or '5678",
        -- Thumbnail = {
        --     Image = "rbxassetid://18220445082", -- rbxassetid only
        --     Title = "Thumbnail"
        -- },
        URL = "link-to-linkvertise-or-discord-or-idk", -- remove this if the key is not obtained from the link.
        SaveKey = true, -- saves key : optional
    },
})


-- Window:SetBackgroundImage("rbxassetid://13511292247")
-- Window:SetBackgroundImageTransparency(0.9)


-- TopBar Edit

-- Disable Topbar Buttons
-- Window:DisableTopbarButtons({
--     "Close", 
--     "Minimize", 
--     "Fullscreen",
-- })

-- Create Custom Topbar Buttons
--                        ↓ Name             ↓ Icon          ↓ Callback                           ↓ LayoutOrder
Window:CreateTopbarButton("MyCustomButton1", "bird",         function() print("clicked 1!") end,  990)
Window:CreateTopbarButton("MyCustomButton2", "droplet-off",  function() print("clicked 2!") end,  989)
Window:CreateTopbarButton("MyCustomButton3", "battery-plus", function() Window:ToggleFullscreen() end, 988)


Window:EditOpenButton({
    Title = "Open Example UI",
    Icon = "rbxassetid://77799629590713",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 2,
    Color = ColorSequence.new( -- gradient
        Color3.fromHex("FF0F7B"), 
        Color3.fromHex("F89B29")
    ),
    --Enabled = false,
    Draggable = true,
})


local Tabs = {}

do
    Tabs.ElementsSection = Window:Section({
        Title = "Elements",
        Opened = true,
    })
    
    Tabs.WindowSection = Window:Section({
        Title = "Window Management",
        Icon = "app-window-mac",
        Opened = true,
    })
    
    Tabs.OtherSection = Window:Section({
        Title = "Other",
        Opened = true,
    })

    
    Tabs.ParagraphTab = Tabs.ElementsSection:Tab({ Title = "Paragraph", Icon = "type" })
    Tabs.ButtonTab = Tabs.ElementsSection:Tab({ Title = "Button", Icon = "mouse-pointer-2", Desc = "Contains interactive buttons for various actions." })
    Tabs.CodeTab = Tabs.ElementsSection:Tab({ Title = "Code", Icon = "code", Desc = "Displays and manages code snippets." })
    Tabs.ColorPickerTab = Tabs.ElementsSection:Tab({ Title = "ColorPicker", Icon = "paintbrush", Desc = "Choose and customize colors easily." })
    Tabs.DialogTab = Tabs.ElementsSection:Tab({ Title = "Dialog", Icon = "message-square", Desc = "Dialog lol" })
    Tabs.NotificationTab = Tabs.ElementsSection:Tab({ Title = "Notification", Icon = "bell", Desc = "Configure and view notifications." })
    Tabs.ToggleTab = Tabs.ElementsSection:Tab({ Title = "Toggle", Icon = "toggle-left", Desc = "Switch settings on and off." })
    Tabs.SliderTab = Tabs.ElementsSection:Tab({ Title = "Slider", Icon = "sliders-horizontal", Desc = "Adjust values smoothly with sliders." })
    Tabs.InputTab = Tabs.ElementsSection:Tab({ Title = "Input", Icon = "keyboard", Desc = "Accept text and numerical input." })
    Tabs.KeybindTab = Tabs.ElementsSection:Tab({ Title = "Keybind", Icon = "keyboard-off" })
    Tabs.DropdownTab = Tabs.ElementsSection:Tab({ Title = "Dropdown", Icon = "chevrons-up-down", Desc = "Select from multiple options." })
    
    Tabs.WindowTab = Tabs.WindowSection:Tab({ 
        Title = "Window and File Configuration", 
        Icon = "settings", 
        Desc = "Manage window settings and file configurations.", 
        ShowTabTitle = true 
    })
    Tabs.CreateThemeTab = Tabs.WindowSection:Tab({ Title = "Create Theme", Icon = "palette", Desc = "Design and apply custom themes." })
    
    Tabs.LongTab = Tabs.OtherSection:Tab({ 
        Title = "Long and empty tab. with custom icon", 
        Icon = "rbxassetid://77799629590713", 
        IconThemed = true, 
        Desc = "Long Description" 
    })
    Tabs.LockedTab = Tabs.OtherSection:Tab({ Title = "Locked Tab", Icon = "lock", Desc = "This tab is locked", Locked = true })
    Tabs.TabWithoutIcon = Tabs.OtherSection:Tab({ Title = "Tab Without icon", ShowTabTitle = true })
    Tabs.Tests = Tabs.OtherSection:Tab({ Title = "Tests", Icon = "https://raw.githubusercontent.com/Footagesus/WindUI/main/docs/ui.png", ShowTabTitle = true })
    
    
    Tabs.LastSection = Window:Section({
        Title = "Section without tabs",
        --Opened = true,
    })
    
    Tabs.ConfigTab = Window:Tab({ Title = "Config", Icon = "file-cog" })
end


--[[ Hello Ink Game devs, I am scripter man and you need to collect my pages. 
You may have thought you'd find the beautiful way to patch the Ringta script in here but guess what.
YOU WONT! AHAHAHAHA. Here's a little tip though.
DON'T BOTHER TRYING. It's impossible. Ok, thanks bye. ]]--

print("Ambatukam")
