return {
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    cmd = { "ClaudeCode", "ClaudeCodeFocus", "ClaudeCodeSend", "ClaudeCodeAdd", "ClaudeCodeDiffAccept", "ClaudeCodeDiffDeny" },
    opts = {
      -- Same wrapper the `claude` shell function uses (see zshrc).
      terminal_cmd = "vibe __wrap claude",
    },
  },
}
