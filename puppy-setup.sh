#!/bin/bash

#DEFINE VARIABLES
boinc_path="$(pwd)"
startup_path="$XDG_CONFIG_HOME/autostart/"
rosetta_dir="$startup_path/boinc_datagrid_rosetta.desktop"
runall_dir="$boinc_path/runall.sh"


#CREATE RUNALL
# this will automate ./boinc and ./boinccmd --project_attach
echo "Creating runall at '$boinc_path/runall.sh'"
echo > "$boinc_path/runall.sh"
echo "Runall created."


#CREATE BOOTSTART
echo "Creating bootstart at '$rosetta_dir'"
echo "[Desktop Entry]" >> "$rosetta_dir"
echo "Encoding=UTF-8" >> "$rosetta_dir"
echo "Version=1.0" >> "$rosetta_dir"
echo "Type=Application" >> "$rosetta_dir"
echo "NoDisplay=true" >> "$rosetta_dir"
echo "Name=\"Rosetta@home | BOINC\"" >> "$rosetta_dir"
echo "Exec=bash $runall_dir" >> "$rosetta_dir"
echo "Bootstart set."


#AUTOSTART
echo "This will automatically run the 'runall' script. ctrl+c to 'cancel'."
sleep 5
bash "$runall_dir"
echo "Success, '$runall_dir' has executed."

echo "exitting...."
sleep 2
echo "done."