# .zprofile

source "$ZDOTDIR/environment"

# Using fgconsole for loldebian compatability
if [[ $(fgconsole 2>/dev/null) -eq 1 && -z $DISPLAY ]]; then
	exec startx &>/dev/null
fi
