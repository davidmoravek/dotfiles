for file in ~/.{bash_prompt,exports,aliases,git-bash-completion.sh}; do
        [ -r "$file" ] && source "$file"
done
unset file

# colors

if [[ $COLORTERM == gnome-* && $TERM == xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
	export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
	export TERM=xterm-256color
fi

# nvm

[[ -s ~/.nvm/nvm.sh ]] && . ~/.nvm/nvm.sh

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh
