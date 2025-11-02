--user leader key (before plugins)
require("config.leader")

--setup plugins
require("config.lazy")
require("config.plugins")

--user configuration
require("config.options")
require("config.keymaps")
