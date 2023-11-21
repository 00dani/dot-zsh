#! zsh
path=(/usr/local/bin $path)
if (( $+commands[brew] )); then
	path=(
		/usr/local/sbin
		~/Library/Python/*/bin(N)
		/usr/local/share/google-cloud-sdk/bin
		$path
	)
fi

path=(/usr/local/texlive/20*/bin/*(N) $path)
path=(~/bin ~/.bin ~/.local/bin $path)
path+=(~/.krew/bin)

# Filter out nonexistent directories, . (the current directory), and duplicate
# paths - there should be no duplicates because of -U but just to be sure. ;)
path=(${(u)^path:#.}(N))
