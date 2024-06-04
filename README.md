# Dotfiles

These are my unix dotfiles. (inspired from my friend @EmNudge :)

While I spent a lot of time tinkering with neovim in the past, I don't have the patience to keep up with breaking changes in plugin management and language servers. I now use [AstroNvim](https://docs.astronvim.com/).

### Install

- Download a [nerd font](https://www.nerdfonts.com/font-downloads) & install them to your system (double clicking each file should install it)
  - Update your terminal's font setting to use a nerd font you installed, otherwise you'll see missing icons/things won't look right. ie for vs code's integrated terminal, in `settings.json` set `"terminal.integrated.fontFamily": "<Font Name">`
- Customize `scripts/config.sh`
- Customize `zsh/` folder's `aliases.zsh`, `functions/zsh` etc to your liking

```bash
sudo ./scripts/setup.sh
./scripts/install.sh
./scripts/config.sh
```

## CLI Programs

- neovim - better vim
- starship - shell prompt
- ripgrep - better grep
- bat - better cat
- eza - colorized ls
- fnm - node version manager
- tldr - lookup common commands
- fzf - general fuzzy search
- dust - better du
- xh - simpler curl
- trash - faster and safer way to delete content
