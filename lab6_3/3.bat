@echo off

net stop Dnscache
timeout /T 5
sc queryex type=service state=all > newresult.txt
C:\Users\vadik\Desktop\OS\lab6_3\comparator.bat > result-newresult.txt
net start Dnscache
