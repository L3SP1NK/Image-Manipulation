#!/bin/bash
## Find pictures with a high level of certain color.
## Highly inspired by "https://www.youtube.com/watch?v=RJEqSIuE0KY"
## TODO:
## - check if the RGB value is "+250" instead of "255".
## - "--no-prompt" switch (for removal).

BLUE="\e[34m"
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
GREY="\e[37m"
BOLD="\e[1m"
RESET_COLOR="\e[0m"

if [[ ${1} ]]
	then
		PIC_FOLDER=${1}
	else
		echo -e "${RED}Please, specify a folder containing pictures!${RESET_COLOR}"
		exit 1
fi

WHITE="255,255,255"
BLACK="0,0,0"
FIND_COLOR=${WHITE}

## Print the RBG value of the prominent color of pictures in the specified folder.
for FILE in $(ls ${PIC_FOLDER})
	do
		VALUE=$(convert ${PIC_FOLDER}/${FILE} -colorspace RGB -format %c histogram:info:-\
		| sort -nr \
		| head -n 1 \
		| awk -F'[()]' '{print $2}')
		echo -e "${BOLD}${BLUE}${PIC_FOLDER}/${FILE}:${RESET_COLOR} ${GREY}${VALUE}${RESET_COLOR}"
			if [[ ${VALUE} == ${FIND_COLOR} ]]
				then
					echo -e "${YELLOW}The picture ${BOLD}\e[4m${FILE}${RESET_COLOR}${YELLOW} mostly contain the white color.\nRemove it? (y/n)${RESET_COLOR}"
					read REMOVE
						case ${REMOVE} in
							y|Y)
								rm ${PIC_FOLDER}/${FILE} && echo -e "${GREEN}Picture ${FILE} removed!${RESET_COLOR}" || echo -e "${RED}Something went wrong!"
								;;
							n|N)
								echo -e "${YELLOW}Skipping this file...${RESET_COLOR}"
								;;
							*)
								exit 1
								;;
						esac
			fi

done
