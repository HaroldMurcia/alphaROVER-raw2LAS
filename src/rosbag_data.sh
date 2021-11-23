#!/bin/bash
path_src=`pwd`
cd ..
cd data
rm 'RAW_DATA_from_rosbag.txt'
path_data=`pwd`
echo $path_data
cd $path_src
#
echo "EKF2"
python3 ekf2.py &
echo "scan_mode_rosbag"
python3 scan_mode_rosbag.py 45 &
echo "rosbag play"
rosbag play $path_data'/1969-12-31-19-10-03_citrush.bag' &
#
sleep 222
echo "waiting 50 secs"
sleep 40
echo "waiting 10 secs"
sleep 10
echo "T - 5"
sleep 5
rosnode kill -a
