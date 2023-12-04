#!/bin/bash
main_menu() {
        PS3=("main: ")
        main=("edit zsh/bash rc file" "add scripts to bashrc/zshrc" "add neofetch to rc" "add a custom neofetch art")
        select main in "${main[@]}"; do
        case $main in
        "edit zsh/bash rc file")
        zsh_bash_rc
        ;;
        "add scripts to bashrc/zshrc")
        bsh_zsh_addscr
        ;;
        "add neofetch to rc")
        add_nf
        ;;
	"add a custom neofetch art")
	nf_custom
	;;
esac
done
}
zsh_bash_rc() {
if [ $SHELL = "/usr/bin/bash" ]

then
	sudo nano ~/.bashrc

elif [ $SHELL = "/usr/bin/zsh" ]

then
	sudo nano ~/.zshrc
fi

}
bsh_zsh_addscr() {
if [ $SHELL = "/usr/bin/bash" ]
then
	read -p $'\e[1;31mEnter path to script you wish to add(include quotations): \e[0m' addedscr
	echo -en '\n'
	read -p $'\e[1;31mAlias for the script?(name to get it to run): \e[0m' alias
	echo -en '\n'
	echo "alias $alias=$addedscr" >> ~/.bashrc
	echo "Script has been added to .rc file!, to run, type $alias"
elif [ $SHELL = "/usr/bin/zsh" ]
then
        read -p $'\e[1;31mEnter path to script you wish to add(include quotations): \e[0m' addedscr
        echo -en '\n'
        read -p $'\e[1;31mAlias for the script?(name to get it to run): \e[0m' alias
        echo -en '\n'
        echo "alias $alias=$addedscr" >> ~/.zshrc
	echo "Script has been added to .rc file!, to run, type $alias"
fi
}
add_nf() {
if [ $SHELL = "/usr/bin/bash" ]
then
	echo "neofetch" >> ~/.bashrc
elif [ $SHELL = "/usr/bin/zsh" ]
then
	echo "neofetch" >> ~/.zshrc
fi
}
nf_custom() {
echo -en '\n'
tput setaf 1 ; echo "First make sure the art you want to display in neofetch is ready, and copied to your clipboard" ; tput sgr0
echo -en '\n'
tput setaf 1 ; echo "the script will open a nano editor at the location convienent for neofetch to locate" ; tput sgr0
echo -en '\n'
tput setaf 1 ; echo "you can paste any type of asci art that you like but make sure there is appropriate space after the image" ; tput sgr0
echo -en '\n'
tput setaf 1 ; echo "(to the right, before the neofetch text is displayed)" ; tput sgr0
echo -en '\n'
tput setaf 1 ; echo "Press Ctrl+x to save and exit after your art has been pasted" ; tput sgr0
echo -en '\n'
tput setaf 1 ; echo "after your done, type this command: 'sudo nano ~/.config/neofetch/config.conf'" ; tput sgr0
echo -en '\n'
tput setaf 1 ; echo "go to line 701 with ctrl /, or locate image_source with ctrl w, and paste '~/.config/neofetch/myart.txt' in the appropriate section" ; tput sgr0
echo -en '\n'
read -p $'\e[1;31mContinue?(yes/no)' input
if [ $input = "yes" ] || [ $input = "y" ] || [ $input = "ye" ] || [ $input = "Y" ]
then
	cd ~/.config/neofetch &&
	sudo touch myart.txt &&
	sudo nano myart.txt
elif [ $input = "no" ] || [ $input = "n" ] || [ $input = "N" ]
then
	exit
fi

}
main_menu
