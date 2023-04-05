#Color variables
RED="\e[31m "
GREEN="\e[32m "
YELLOW="\e[33m "
BLUE="\e[34m "
MAGENTA="\e[35m "
CYAN="\e[36m "
RESET="\e[0m "

#Colors
E="echo -e "
R=$E$RED
G=$E$GREEN
Y=$E$YELLOW
B=$E$BLUE
M=$E$MAGENTA
C=$E$CYAN
RE=$E$RESET

which powershell-empire
if [ $? != 0 ]; then
	$R"Downloading PowerShell-Empire"; $RE
	sudo apt install powershell-empire
fi
which evil-winrm
if [ $? != 0 ]; then
	which gem
	if [ $? != 0 ]; then
		$R"Downloading gem"; $RE
		sudo apt install gem
	fi
	$R"Downloading evil-winrm";$RE
	git clone https://github.com/Hackplayers/evil-winrm.git
	cd evil-winrm
	gem install evil-winrm	
fi
$G"All tools needed are installed"; $RE
read -p "Would you like to login with the credentials given on the machine: " answer
if [ $answer == y ]; then
	read -p "RHOST IP?: " RHOST
	evil-winrm -i $RHOST -u sam -p azsxdcAZSXDCazsxdc
else
	$G"Have a nice day :)"
fi

