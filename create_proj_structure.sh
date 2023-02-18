# Author : Srinivas Cheemalapati
# This is a simple script to create a repeatable directory structure for Python Projects

#!/bin/bash

# Create a project tree 
# Pass the argument of the path for the new project


function create_project {
	echo "Calling create project function"
	project=$1
	echo $project
	read -p "Press any key to continue..." key
	mkdir -p $project
	cd $project
	mkdir -p src docs test notebooks data 
	touch .gitignore
	touch Requirements.txt
	touch Setup.py
}

# Get the current directory where a new project will be crated
current_dir=$(pwd)

# Create a new project tree
# 1. Ask for the project name

read -p "Enter the project name: " project_name

#project_path= "{$current_dir}{"/"}{$project_name}"

project_path="$current_dir"/"$project_name"
echo $project_path

# 2. Check if the project already exists in the current directory

if [ -d "$current_dir/$project_name" ]; then
	read -p "A project with same name exists. Do you want to delete and recreate: (yes/no): " input
	if [[ "$input" == "yes" ]]; then
		  echo "The directory being deleted is:  $current_dir/$project_name"
		  rm -rf "$current_dir/$project_name"
		  create_project "$current_dir/$project_name"
	  elif [[ "$input" == "no" ]]; then
		    echo "Exiting..."
		      exit 1
	      else
		        echo "Invalid input. Please enter 'yes' or 'no'."
			  exit 1
	fi
else
	echo "project $project_path does not exist"
	create_project "$project_path"

fi

