#!/bin/sh
#
# enduraesingartjekk fyrir sil
# tjekkar bara a thvi hvort ad detectorar sjeu keyrandi
# ef ekki, eda of margir tha er sil endurraest
# 
# 2010-11-08 hs@vedur.is

PATH=/usr/local/bin:/bin:/usr/bin:/usr/X11R6/bin:/usr/sil/bin
export PATH

finnurcount=`ps -efw|grep finnur | grep -v grep| wc -l`
evdetcount=`ps -efw|grep evdet | grep -v grep| wc -l`
alertdetcount=`ps -efw|grep alert | grep -v grep| wc -l`
shakedetcount=`ps -efw|grep shakedet | grep -v grep| wc -l`
screamcount=`ps -efw| grep scream | grep -v grep | wc -l`

if [ ! $finnurcount -eq 1 ] || [ ! $evdetcount -eq 1 ] || [ ! $alertdetcount -eq 1 ] || [ ! $shakedetcount -eq 1 ] || [ $screamcount -gt 10 ]
	then 
		date >> /tmp/silautocheck.txt
		echo finnurcount er $finnurcount >> /tmp/silautocheck.txt
		echo evdetcount er $evdetcount  >> /tmp/silautocheck.txt
		echo alertdetcount er $alertdetcount  >> /tmp/silautocheck.txt
		echo shakedetcount er $shakedetcount  >> /tmp/silautocheck.txt
		echo screamcount er $screamcount >> /tmp/silautocheck.txt
		echo endurraesi sil  >> /tmp/silautocheck.txt
		/usr/sil/bin/stopdet
		/usr/sil/bin/silinit
		sleep 30
		/usr/sil/bin/start0
		sleep 60
		/usr/sil/bin/start1
	else
		echo allt i fina og stud i Kina kl `date` >/tmp/silautocheck.txt
fi
	

