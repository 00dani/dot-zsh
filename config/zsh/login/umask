#! zsh
# umask should *never* be zero. If it is, set it to something safer.
if (( $(umask) == 0 )); then
	# Test whether the system uses User Private Groups - if it does, my primary
	# group will have the same name as my user. Basic info on UPG can be found
	# here: https://security.ias.edu/how-and-why-user-private-groups-unix
	if [[ $(id -un) = $(id -gn) ]]; then
		# 002 is a safe umask if the system has UPG.
		umask 002
	else
		# 022 is a safe umask if the system does not have UPG.
		umask 022
	fi
fi
