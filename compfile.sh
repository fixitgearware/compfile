#!/bin/bash
# script to compare two given files 
# These files are then output to  the path 
# provided by the user. 
# Created by Fixitgearware Security
# Tool Name Compf (comparing two files)

banner_instructions()
{   
    echo "                                                                                                                       "
    echo "                                                                                                                       "
    echo "${RED}                  █████████        ███████       ██████   ██████    ███████████     ███████████                   " 
    echo "${RED}                 ███░░░░░███     ███░░░░░███    ░░██████ ██████    ░░███░░░░░███   ░░███░░░░░░█                  "
    echo "${RED}                ███     ░░░     ███     ░░███    ░███░█████░███     ░███    ░███    ░███   █ ░                    "
    echo "${RED}               ░███            ░███      ░███    ░███░░███ ░███     ░██████████     ░███████                      "
    echo "${RED}               ░███            ░███      ░███    ░███ ░░░  ░███     ░███░░░░░░      ░███░░░█                      "
    echo "${RED}               ░░███     ███   ░░███     ███     ░███      ░███     ░███            ░███  ░                       "
    echo "${RED}                ░░█████████     ░░░███████░      █████     █████    █████           █████          ██    ██    ██"
    echo "${RED}                 ░░░░░░░░░        ░░░░░░░       ░░░░░     ░░░░░    ░░░░░           ░░░░░          ░░    ░░    ░░  ${DEFAULT1}"
    echo "                                                                                                                       "
    echo "                                                                                                                       "
    echo "'COMPF' which stands for 'Compare Files' is a 'Shell' based Script tool created by FixitgearwareSecurity that enables the sorting and comparing of large based text files..."
    echo "The tool was created for Bug-Bounty Hunters, Penetration testers, Security Auditors, and more... who handle bulk recon *.txt files, or *txt based documents.."
    echo "and desire to sort two different files, compare there differences and pass the output to a path, specified by the user of this tool."
    echo ""
    echo "- It gives the user of this tool, the ability to pull the text file from different file path locations, irrespecstive of their location as long as the appropriate full path was specified."
    echo "- The user can then in-turn, specify their desired location or path, they want the file difference to be stored, or output to."
    echo "- What makes it even an amazing tool, is that it sorts these outputs in alphabetical order, making it easy for logs and content to be traced."
    echo "- Bug-Bounty Hunters and Penetration testers are able to have a seamless bird eye view of a particular entry point they want to target, by viewing the sorted output or list."
    echo "- Behind the scene this two files are first sorted and then compared each line, by line with the speed of light...if no difference where discovered the user of the tool, will be notified."
    echo ""
    echo ""
    echo "So how does 'COMPF' works?..."
    echo ""
    echo "- Typing the command 'compfile' after following the documentation as described on GitHub launches the tool."
    echo "- Follow the onscreen instruction, and provide full path /home/user/location/filename.txt e.g. /home/fixitgearwaresecurity/Desktop/test1.txt"
    echo "- Files can be in seperate directory, just specify the paths, follow the onscreen instruction, and leave the rest to 'COMPF'..."
    echo "- File output path specified will hold the sorted text file, making it easy to scan through and choose your target."
    echo "- If only the filename.txt is specified without an appropriate path, the file-output will be saved in the rootfile system."
    echo "- Inspired by anew TomNomNom and challenges faced running anew on virtualbox machines."
    echo "- This shell script, runs on 'Linux' 'MacOS' and any OS that supports shell binary files.."
    echo "- Visit our website https://www.fixitgearware.com"
    echo
    echo
}

banner_instructions


GREEN="\033[0;32m"
BLUE="\033[0;34m"
RED="\033[0;31m"
YELLOW="\033[1;33m"
MAGENTA="\033[0;35m"
CYAN="\033[0;36m"
DEFAULT1="\033[0m"

path_get_location() {
    local user_path
    read -p "$(printf "${LEMON_GREEN}Please Enter the Text-File Path:${DEFAULT1}") " user_path
    specified_path=$(find "$user_path")
    printf "$specified_path"
}

file_compare() {
    cmp -s "$1" "$2"
}

printf "${GREEN}Specify the path to the first file with its file extension (e.g., /home/fixitgearwaresecurity/Desktop/mybug.txt)${DEFAULT1}"
firstfile=$(path_get_location)
if [ -z "$firstfile" ]; then
    printf "${RED}You did not provide the accurate path of the first file or the file doesn't exist. Program will terminate....${DEFAULT1}"
    exit 1
fi

printf "${BLUE}Specify the path to the second file with its file extension (e.g., /home/fixitgearwaresecurity/Downloads/newrecon.txt)${DEFAULT1}"
secondfile=$(path_get_location)
if [ -z "$secondfile" ]; then
    printf "${RED}You did not provide the accurate path of the second file or the file doesn't exist. Program will terminate....${DEFAULT1}"
    exit 1
fi

if file_compare "$firstfile" "$secondfile"; then
    printf "${YELLOW}No changes in both files. Program will exit...."
    exit 0
else
    printf "${MANGENTA}Enter the file output path and end it with a *.txt:"
    read outputfile
    if [ -z "$outputfile" ]; then
        printf "${RED}Output file path not specified. Program will terminate....${DEFAULT1}"
        exit 1
    fi
    
    sort "$firstfile" > /tmp/sorted_firstfile
    sort "$secondfile" > /tmp/sorted_secondfile
    diff /tmp/sorted_firstfile /tmp/sorted_secondfile | sed -e 's/^<//' -e '1d' -e 's/^>//' -e 's/ //g' | grep -v '^[0-9,]*[acd][0-9]*$' | grep -v '^---$' | grep -Ev '[0-9]+a[0-9]+,[0-9]+' > "$outputfile"
    if [ ! -s "$outputfile" ]; then
        printf "${YELLOW}There are no differences between the two files.${DEFAULT1}"
        rm "$outputfile"
    else
        printf "${CYAN}Check '$outputfile' to get your saved file....${DEFAULT1}"
    fi
    
    rm /tmp/sorted_firstfile /tmp/sorted_secondfile
fi




