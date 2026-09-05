# Unaliases
# (Omarchy)
unalias ls
unalias lsa
unalias lt
unalias lta
unalias c

# Security
alias sude='sudoedit'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias chmod='chmod --preserve-root'

# Terminal
alias zurs='source ~/.bashrc'
alias ma='batman'

# File-system
alias bashing='nvim ~/.bashrc'
alias aliasing='nvim ~/.bashrc.d/aliases.bashrc'
alias functioning='nvim ~/.bashrc.d/functions.bashrc'
alias exe='chmod +x'

alias .1='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias .6='cd ../../../../../..'
alias .7='cd ../../../../../../..'
alias .8='cd ../../../../../../../..'
alias .9='cd ../../../../../../../../..'

alias npw='pwd | xargs uwsm-app -- nautilus &>/dev/null &'
alias l='eza -1 --icons=auto'
alias lh='eza -a1 --icons=auto'
alias ll='eza -lo --no-user --group-directories-first --sort modified --git --git-repos-no-status --icons=auto'
alias llsize='eza -lo --no-user --group-directories-first --sort modified --total-size --git --git-repos-no-status --icons=auto'
alias lr='eza -loT --no-permissions --no-user --group-directories-last --sort modified --level 3 --git --git-repos-no-status --git-ignore --icons=auto'
alias la='eza -aalo --no-user --group-directories-first --sort modified --git --git-repos-no-status --icons=auto'
alias lasize='eza -aalo --no-user --group-directories-first --sort modified --total-size --git --git-repos-no-status --icons=auto'
alias laf='eza -1faalo --no-user --group-directories-first --sort modified --total-size --git --git-repos-no-status --icons=auto'
alias lafsize='eza -1faalo --no-user --group-directories-first --sort modified --total-size --git --git-repos-no-status --icons=auto'
alias lad='eza -1Daalo --no-user --group-directories-first --sort modified --git --git-repos-no-status --icons=auto'
alias ladsize='eza -1Daalo --no-user --group-directories-first --sort modified --total-size --git --git-repos-no-status --icons=auto'

alias zoe='zoxide edit'
alias shpath='echo $PATH | tr ":" "\n"'

alias mount-mob='jmtpfs ~/phone-mount/'
alias umount-mob='fusermount3 -u ~/phone-mount/'

alias pg-docs='brave /usr/share/doc/postgresql/html/index.html'

# Programs
alias stl='systemctl'
alias sstl='sudo systemctl'
alias jtl='journalctl'
alias ap='apropos'

alias t='btop'
alias st='sudo btop'

alias n='nvim'
alias nd='nvim -d'
alias na='fzf -m | xargs -r -d "\n" nvim'
alias zeda='fzf -m | xargs -r -d "\n" uwsm-app -- zeditor &>/dev/null'
alias mpa='fzf -m | xargs -r -d "\n" mpv'
alias media='mediainfo'
alias lzg='lazygit'
alias lzd='sudo lazydocker'
alias a='yazi'
alias zat='zathura'
alias py='python3'
alias de='delta'

alias c='opencode'
alias co='copilot'
alias ca='claude'
alias setca='echo "@AGENTS.md" > CLAUDE.md'
alias cx='codex'
alias ol='ollama'
alias oll='ollama launch opencode'
alias sb='virsh --connect qemu:///system start arch-sandbox'
alias ssb='ssh arch-sandbox'
alias sbf='sshfs arch-sandbox:/home/arch/agent-sandbox/projects /home/francisco/Documents/Coding-trials/virtual-machines/Arch/vm-projects-mirror/'
alias ssbf='fusermount3 -u /home/francisco/Documents/Coding-trials/virtual-machines/Arch/vm-projects-mirror/'
alias bkbf='rsync -avz arch-sandbox:~/agent-sandbox/projects/ /home/francisco/Documents/Coding-trials/virtual-machines/Arch/vm-projects-copy/'

alias ytvid='mpv --ytdl-format="best[height<=480]"'
alias ytaud='mpv --ytdl-format="best" --no-video'
alias ytaudd='yt-dlp -x'

alias ch='chezmoi'
alias chd='chezmoi cd'
alias cha='chezmoi add'
alias chaen='chezmoi add --encrypt'
alias chatm='chezmoi add --template'
alias chA='chezmoi re-add'
alias chi='chezmoi diff'
alias che='chezmoi edit'
alias chl='chezmoi apply'

alias wlcp='wl-copy'
alias wlps='wl-paste'
alias wlpsw='wl-paste -w wl-paste'

alias ba="upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E 'percentage:|time to empty:|state:' | awk '{print $NF}'"

# Git
alias glo='git log --all --graph --oneline --date=rfc \
--pretty=format:"%C(auto)%h%C(reset) %C(auto)%d%C(reset) %C(green)%an%C(reset): %s %C(cyan)—.%C(reset) %C(dim white)%ad%C(reset)"'

# JS development
alias lsr='live-server'
# NPM
alias mri='npm i'
alias mrci='npm ci'
alias mrd='npm run dev'
alias mrb='npm run build'
alias mrp='npm run preview'
# PNPM
alias pp='pnpm'
alias pri='pnpm install'
alias prci='pnpm install --frozen-lockfile'
alias prcip='pnpm install --frozen-lockfile --production'
alias pra='pnpm add'
alias prd='pnpm run dev'
alias prdh='pnpm run dev --host'
alias prb='pnpm run build'
alias prp='pnpm run preview'
alias prap='pnpm approve-builds'
alias prc='pnpm typecheck'
# NEXT
alias nrd='next dev'
alias nrb='next build'
alias nrp='next start'

# Python3
alias uvgrade='uv tool upgrade --all'

# Cmake
alias cmc='cmake -B build && cmake --build build --j8'
