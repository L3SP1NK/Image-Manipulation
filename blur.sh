#!/bin/bash
## Blur images background in bulk (lossy).

BASE_IMAGES_PATH=${1}
BLURRED_IMAGES_PATH=${2}

if [[ ${1} && ${2} ]]
	then
		for IMAGES in $(ls ${BASE_IMAGES_PATH})
		    do
		        ffmpeg -i ${BASE_IMAGES_PATH}/${IMAGES} -lavfi '[0:v]scale=ih*16/9:-1,boxblur=luma_radius=min(h\,w)/20:luma_power=1:chroma_radius=min(cw\,ch)/20:chroma_power=1[bg];[bg][0:v]overlay=(W-w)/2:(H-h)/2,crop=h=iw*9/16' -vb 800K ${BLURRED_IMAGES_PATH}/blurred-${IMAGES}
		done
	else
		echo -e "Usage:\n./blur.sh <images path> <destination path>"
fi
