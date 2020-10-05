python grab_stats.py
REM grep -P -o "([A-F0-9]{2}:){5}[A-F0-9]{2}" page.html
sed s/tr/tr\n/g page.html > temp1.txt
grep -P "(?<=([A-F0-9]{2}:){5}[A-F0-9]{2}).*(?=/tr)" temp1.txt > temp2.txt
grep -Po "(?<=([0-9]{3}.)).*(?=)" temp2.txt | awk -F " " "{print $2 $5 $6}" | sed s/[a-z]//g | sed s/[="<>"]//g | sed s/\"80\"//g | sed s/\"180\"//g > temp3.txt
sed s/60:30:D4:xx:xx:xx/x1_Mac/g temp3.txt | sed s/4C:32:75:xx:xx:xx/x2_Mac/g | sed s/68:FF:7B:xx:xx:xx/Eswitch1/g | sed s/68:FF:7B:xx:xx:xx/Eswitch2/g |sed s/D8:0D:17:xx:xx:xx/Eswitch3/g | sed s/D8:0D:17:A2:49:58/Eswitch4/g | sed s/A4:CF:12:xx:xx:xx/Thermter/g | sed s/CA:32:DA:xx:xx:xx/x1_Phone/g | sed s/54:99:63:xx:xx:xx/x1_Phone/g | sed s/34:A8:EB:xx:xx:xx/x2_Phone/g | sed s/88:E9:FE:xx:xx:xx/x3_Mac/g | sed s/DC:2B:2A:xx:xx:xx/x3_Phone/g | sed s/4C:32:75:xx:xx:xx/x1_iPad/g | sed s/C0:99:E1:xx:xx:xx/NestHeat/g | sed s/84:39:BE:xx:xx:xx/PCserver/g | sed s/C0:99:E1:xx:xx:xx/x12Cam/g | sed s/98:E0:D9:xx:xx:xx/x4_Mac/g > temp4.txt
awk -F "/" "{print $1, $2}" temp4.txt | sed -e "s/$/Kbps/" > temp5.txt
"C:\Program Files (x86)\GnuWin32\bin\sort.exe" -nk2 -r temp5.txt > temp6.txt
echo --------------------- >> temp6.txt
echo currently using >> temp6.txt
sed s/,//g temp4.txt | awk -F "/" "{sum+=$2;} END{print sum;}" | sed -e "s/$/Kbps/" >> temp6.txt
echo of the available >> temp6.txt
echo 20000Kbps >> temp6.txt
echo --------------------- >> temp6.txt
rm temp7.txt temp8.txt temp9.txt
date /t >> temp6.txt
time /t >> temp6.txt
cat temp6.txt | sed -e "s/$/<br>/" > temp7.txt
cp head.txt tmphead.txt
cp tail.txt tmptail.txt
cat temp7.txt >> tmphead.txt 
cat tmptail.txt >> tmphead.txt

mv tmphead.txt temp8.txt
cp temp8.txt "c:\inetpub\wwwroot"\index.html
