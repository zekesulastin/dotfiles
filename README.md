#Zeke's Dotfiles

(Or at least a small subset)

This should be able to be cloned right into (my) home directory (you probably shouldn't if you're just looking ...).  The eventual endstate is to be able to use this repo on every machine I (regularly) use, including my home server and my ancient iBook G3 of awesomeness.  This, of course, adds ~entertainment~ to my setup - note the hostname checks and (eventually) the lowres branch to deal with font sizes.

Note: I removed the separator drawing from i3bar's xcb.c; the kludge is so ugly I refuse to provide a patch :/

Files used but not provided due to licenses - you'll need to get the files or change the entries:
```
	~/.pulse/chimes.wav, ~/.pulse/Windows 98 Startup.wav - both are from Microsoft Windows
	PragmataPro for Powerline - vim-powerline-patched version of PragmataPro, not free
```
Otherwise, vim-pathogen (https://github.com/tpope/vim-pathogen) and vim-fugitive by Tim Pope are under the Vim license (:help license), vim-powerline by Kim Silkebækken is CC-BY-SA 3.0 (https://creativecommons.org/licenses/by-sa/3.0/), and everything else is under WTFPL2 (seriously, they're dotfiles who cares; this section was more about the submodules anyways).
