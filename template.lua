local parserName = "fixme"
local parserVersion = "fixme"

local PARSERNAME = nw.createParser(parserName, "fixme")

nw.logDebug(parserName .. " " .. parserVersion)

--[=[
    Mitch: Is there a doc explaining what the "summary" table paramaters mean and what they do in the UI?  
    Would like to determine which ones are relevant to someone building a custom parser.
--]=]

local summary = {["parserName"] = parserName, ["parserVersion"] = parserVersion}

summary.parserDetails = [=[
fixme
]=]

--[=[
    VERSION

        fixme  11.5.0.0-10941.5  Initial development


    OPTIONS

        "fixme" : default FIXME
        
            fixme


    IMPLEMENTATION

        fixme


    TODO

        fixme

--]=]

summary.dependencies = {
    ["parsers"] = {
        "fixme",
    },
    ["feeds"] = {
        "fixme",
    }
}

summary.conflicts = {
    ["parsers"] = {
        "fixme",
    }
}

summary.keyUsage = {
    ["fixme"] = "fixme",
}

summary.investigation = {
    ["analysis.session"] = {
        [""] = {
            ["inv.category"] = {
                "",
            },
            ["inv.context"] = {
                "",
            },
            ["description"] = "",
            ["reason"] = ""
        },
    },
    ["analysis.service"] = {
        [""] = {
            ["inv.category"] = {
                "",
            },
            ["inv.context"] = {
                "",
            },
            ["description"] = "",
            ["reason"] = ""
        },
    },
    ["analysis.file"] = {
        [""] = {
            ["inv.category"] = {
                "",
            },
            ["inv.context"] = {
                "",
            },
            ["description"] = "",
            ["reason"] = ""
        },
    },
    ["ioc"] = {
        [""] = {
            ["inv.category"] = {
                "",
            },
            ["inv.context"] = {
                "",
            },
            ["description"] = "",
            ["reason"] = ""
        },
    },
    ["boc"] = {
        [""] = {
            ["inv.category"] = {
                "",
            },
            ["inv.context"] = {
                "",
            },
            ["description"] = "",
            ["reason"] = ""
        },
    },
    ["eoc"] = {
        [""] = {
            ["inv.category"] = {
                "",
            },
            ["inv.context"] = {
                "",
            },
            ["description"] = "",
            ["reason"] = ""
        },
    }
}

summary.liveTags = {
    "fixme",
}

local nwll = require('nwll')

--[=[
    Mitch: I suppose the "--define options" section below does not have anything to do with the XXX_options.lua file?
    
    Mitch: Looks like you are defining some things in the UI here, but what does everything else do?
--]=]

-- define options
    local options = ({
        -- each option needs its own definition
        ["fixme"] = ({                 -- name for use within the parser, must be valid as a variable name
            ["name"] = "fixme",        -- name presented in the UI
            ["description"] = "fixme", -- description presented in the UI
            ["type"] = "fixme",        -- "boolean" or "number"
            ["minimum"] = fixme,       -- only for type "number", default 0
            ["maximum"] = fixme,       -- only for type "number", default 4294967295
            ["default"] = fixme        -- value to use if no valid value is given
        }),
    })
-- set options DON'T MODIFY THIS SECTION

--[=[
    Mitch: What's your latest guidance on when to use a pcall?
    
    Mitch: What would happen if there was no options file here?  Is the parser meant to run without it?
 
    Mitch: What would you do differently if the options file was required (mainly for my own parser use case)?
--]=]

    pcall(function()
        local optionsModule = parserName .. "_options"
        optionsModule = require(optionsModule)
        for name,parameters in pairs(options) do
            if optionsModule[name] then
                parameters.value = optionsModule[name]()
            end
        end
    end)
    for name,parameters in pairs(options) do
        -- if the value was put in quotes, get the intended value not a string
        -- e.g., "100"  -> 100
        --       "true" -> true
        if parameters.type == "number" then
            parameters.value = tonumber(parameters.value)
        elseif parameters.type == "boolean" then
            if parameters.value == "false" then
                parameters.value = false
            elseif parameters.value == "true" then
                parameters.value = true
            end
        end
        -- make sure the type of value is correct, use default value if not
        -- e.g., expected a number but got "hello world" so use default instead
        if type(parameters.value) ~= parameters.type then
            parameters.value = parameters.default
        -- make sure number values fall within minimum and maximum
        elseif parameters.type == "number" then
            -- if the definition didn't provide a minimum, use 0
            parameters.minimum = (parameters.minimum and parameters.minimum > 0 and parameters.minimum) or 0
            -- if the definition didn't provide a maximum, use 4294967295
            parameters.maximum = (parameters.maximum and parameters.maximum < 4294967295 and parameters.maximum) or 4294967295
            parameters.value =
               (parameters.value < parameters.minimum and parameters.minimum) or
               (parameters.value > parameters.maximum and parameters.maximum) or
                parameters.value
        elseif parameters.type == "string" then
            -- make sure we don't use an empty string
            if string.len(parameters.value) == 0 then
                parameters.value = parameters.default
            end
        end
    end
-- end options

local indexKeys = {}
table.insert(indexKeys, nwlanguagekey.create("fixme"))
if options.fixme.value then
    table.insert(indexKeys, nwlanguagekey.create("fixme"))
end

PARSERNAME:setKeys(indexKeys)

function PARSERNAME:sessionBegin()
    -- reset session vars
    self.sessionVars = {}
end

function PARSERNAME:streamBegin()
    -- reset stream vars
    self.streamVars = {}
end

function PARSERNAME:fixme(token, first, last)
    
end

PARSERNAME:setCallbacks({
    [nwevents.OnSessionBegin] = PARSERNAME.sessionBegin,
    [nwevents.OnStreamBegin] = PARSERNAME.streamBegin,
    ["fixme"] = PARSERNAME.fixme,
})

--[=[
    Mitch: at the bottom of the traffic flow parser you have this.  What is it doing?

module('traffic_flow')

function subscribe()
    return publish
end
--]=]

return summary