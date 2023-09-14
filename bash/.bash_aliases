# ====================================================== prettify terminal
# display fastfetch on terminal
# fastfetch

# display fortune quote inside cowsay tux
# fortune | cowsay -f tux

# specfiy user in terminal - default case
export PS1="[\e[01;32m\]\u\e[m@\e[1;36m\h\e[m] \e[1;35m[\w]\e[m \n$ "

# starship terminal emulator
# eval "$(starship init bash)"

# oh-my-posh terminal emulator
eval "$(oh-my-posh init bash)"
# view available themes: ls $(brew --prefix oh-my-posh)/themes

# my favourite oh-my-posh themes - uncomment to set
# eval "$(oh-my-posh init bash --config /opt/homebrew/opt/oh-my-posh/themes/iterm2.omp.json)"
eval "$(oh-my-posh init bash --config /opt/homebrew/opt/oh-my-posh/themes/kali.omp.json)"

# ====================================================== Aliases
# replace clang GCC/G++ with GNU
alias g++='g++-12'
alias gcc='gcc-12'

# add color support
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# go to directory
alias 1..='cd ..'
alias 2..='cd ../..'
alias 3..='cd ../../..'
alias 4..='cd ../../../..'

# display folders
alias ls='exa -GxF --icons --group-directories-first --color=auto'
alias ll='exa -alhF --icons --group-directories-first --color=auto'

# display tree
alias tree='tree -q --dirsfirst -C --sort name'

# display all mounted drives
alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort"

# count files in directory
alias count='find . -type f | wc -l'

# copy progress bar: cpy ./source ./destination
alias cpv='rsync -ah --info=progress2'

# sort icons in dock
alias sort_dock="defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock"

function cl() {
    DIR="$*";
        # if no DIR given, go home
        if [ $# -lt 1 ]; then
                DIR=$HOME;
    fi;
    builtin cd "${DIR}" && \
    # use your preferred ls command
        ls -F --group-directories-first --color=auto
}
