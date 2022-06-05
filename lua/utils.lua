utils = {}

local function get_os_name()
    local BinaryFormat = package.cpath:match('%p[\\|/]?%p(%a+)')
    local os_name
    if BinaryFormat == 'dll' then
        os_name = 'Windows'
    elseif BinaryFormat == 'so' then
        os_name = 'Linux'
    elseif BinaryFormat == 'dylib' then
        os_name = 'MacOS'
    end
    return os_name
end

utils.os_name = get_os_name()

return utils
