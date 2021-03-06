#!/bin/bash
path_LASTools="/home/hmurcia/LAStools"
path_src=`pwd`
cd ..
cd data
rm reco_move_output.las
rm reco_move_output.txt
path_data=`pwd`
echo $path_data
cd $path_src
python3 reco_move.py $path_data'/RAW_DATA_from_rosbag.txt' 30
echo "LASTools"
cd $path_LASTools'/bin'
#wine txt2las -i $path_data'/reco_move_output.txt' -parse cinruaxyz -o $path_data'/reco_move_output.las'
wine txt2las -i $path_data'/reco_move_output.txt' -parse xyzi -o $path_data'/reco_move_output.las'
#wine lasview -i $path_data'/reco_move_output.las'
#wine lasground_new -i $path_data'/reco_move_output.las' -o $path_data'/classified_terrain.las'
#wine lasview -i $path_data'/classified_terrain.las'
