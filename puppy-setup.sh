#!/bin/bash

#DEFINE VARIABLES
boinc_path="$(pwd)"
startup_path="$XDG_CONFIG_HOME/autostart/"
rosetta_dir="$startup_path/boinc_datagrid_rosetta.desktop"
runall_dir="$boinc_path/runall.sh"


#CREATE RUNALL
# this will automate ./boinc and ./boinccmd --project_attach
echo "Creating runall at '$boinc_path/runall.sh'"
echo "#!/bin/bash
cd $boinc_path
sleep 20;
function runall_auto(){
	if [[ \"$(curl ifconfig.me)\" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
		for sign_beep in .11 .11 .11 .11 .11 1 .11 .11 .11 .11 .8 .11 .11 .30 .15 .15; do
			echo -ne \"\007\";
			sleep \$sign_beep;
		done
		# automate boinc
		./boinc & sleep 25; ./boinccmd --project_attach http://boinc.bakerlab.org/rosetta/ 2087518_c1b580e38ff9dc51bb1a89b8dc8e7ac2
	else
		for sign_beep in 0.2 0.2 0.7 1 0.2 0.2 0.7 1; do
			echo -ne \"\007\";
			sleep \$sign_beep;
		done
		runall_auto;
	fi
}
runall_auto;" > "$boinc_path/runall.sh"
echo "Runall created."


#CREATE BOOTSTART
echo "Creating bootstart at '$rosetta_dir'"
echo "[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
NoDisplay=true
Name=\"Rosetta@home | BOINC\"
Exec=bash $runall_dir" > "$rosetta_dir"
echo "Bootstart set."


#AUTOSTART
echo "This will automatically run the 'runall' script. ctrl+c to 'cancel'."
sleep 5
bash "$runall_dir"
echo "Success, '$runall_dir' has executed."

echo "exitting...."
sleep 2
echo "done."
