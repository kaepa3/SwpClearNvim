package.loaded["swpclear"] = nil
package.loaded["swpclear.module"] = nil
vim.api.nvim_create_user_command("SwpClear", require("swpclear").swpclr, {force=true})

