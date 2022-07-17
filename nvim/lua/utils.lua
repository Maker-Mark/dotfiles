-- get map func for specific mode
local function mode_map(mode)
    return vim.schedule_wrap(function(keys, cmd)
	vim.api.nvim_set_keymap(
	    mode,
	    keys,
	    cmd,
	    { noremap = true, silent = true }
	)
    end)
end


return {
    mode_map = mode_map,
}

