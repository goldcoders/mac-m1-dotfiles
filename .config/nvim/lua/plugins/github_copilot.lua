require("copilot").setup {
    cmp = {
        enabled = true,
        method = "getCompletionsCycling"
    },
    server_opts_overrides = {
        trace = "verbose",
        settings = {
            advanced = {
                listCount = 10, -- #completions for panel
                inlineSuggestCount = 5 -- #completions for getCompletions
            }
        }
    },
    panel = {
        enabled = true
    }
}
