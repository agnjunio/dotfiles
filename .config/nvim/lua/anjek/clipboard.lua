local function is_wsl()
  local version = vim.fn.readfile("/proc/version")[1] or ""
  return version:match("Microsoft") or version:match("WSL")
end

if is_wsl() then
  vim.g.clipboard = {
    name = "win32yank",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      ["+"] = "bash -c \"powershell.exe -noprofile -command Get-Clipboard | tr -d '\\r'\"",
      ["*"] = "bash -c \"powershell.exe -noprofile -command Get-Clipboard | tr -d '\\r'\"",
    },
    cache_enabled = 1,
  }
else
  vim.g.clipboard = {
    name = "xclip",
    copy = {
      ["+"] = "xclip -selection clipboard",
      ["*"] = "xclip -selection primary",
    },
    paste = {
      ["+"] = "xclip -selection clipboard -o",
      ["*"] = "xclip -selection primary -o",
    },
    cache_enabled = 0,
  }
end
