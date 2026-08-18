# Personal Dotfiles

To be cloned at `~/.local/share/` under the name of `chezmoi`

```bash
gh repo clone EFrMG/chezmoi ~/.local/share/chezmoi
```

---

## Contents

You could find some interesting scripts [in here](./dot_local/bin) to do things such as:

- Managing drives with [Bashmount](https://github.com/jamielinux/bashmount)
- Clear the trash on all drives
- Extract from most filetypes with a modified version of [this script](https://github.com/aviaryan/utility-bash-scripts/blob/master/extract)
- Launch scripts with an fzf picker
- Stop Ollama models with an fzf picker
- Initialize Tmux to have a single session as primary quickly
- Create to-do files interactively
- Run TTS models with a string of text or files containing text

There might be some hardcoded Catppuccin values for themes here and there, although not for the waybar given that I like it to contrast when the battery is running low or high.

> [!NOTE]
> Many of these configurations are meant to be used on the [Omarchy](https://github.com/basecamp/omarchy) Linux distribution.
