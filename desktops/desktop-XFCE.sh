# ------------------------------------ install

_pih xorg "XORG"
_pi urwfonts
_pi hack-font
_pi mesa-demos
	
_pih xfce "xfce Desktop"
_pih papirus-icon-theme "Papirus icons"

# custom art
. ${CWD}/desktops/wallpapers.sh
. ${CWD}/desktops/icons.sh

# ------------------------------------ configure

printf "[ ${CG}NOTE${NC} ]  Declaring procfs in /etc/fstab\n\n"
if grep -q procfs /etc/fstab ; then
	printf "procfs entry already exists\n\n"
else
	echo "proc		/proc	procfs	rw	0	0" >> /etc/fstab
fi
echo ""

printf "[ ${CG}NOTE${NC} ]  Configuring rc.conf\n\n"
sysrc moused_enable="NO"	# fix mouse scrolling conflict
sysrc dbus_enable="YES"
sysrc hald_enable="YES"		# DEPRECATED
echo ""

dconf update
echo ""
