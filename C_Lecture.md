#  Linux Essentials 1 [ August  2017]
![screengrab](screengrab.png?raw=true "screengrab")

## Lecture 3 [  Managing Applications [Yum and Apache ]

This guide provides simple practical steps to learning and using Linux. It will take about an hour to complete

---

## 

You will try out different Linux commands to  solve real life problems as a way of familiarising yourself with the environment.

---

## Intended Audience

Users who undertand basic concept of the computer system.

---

## Requirements

Ensure the following is installed and working

- putty https://www.dropbox.com/sh/cho8pwn3tlfz37o/AADcF15c1vXwVhu4LE23BkVIa?dl=0 
- set it up as directed by the instructor

**DO NOT PROCEED UNTIL THESE ARE PRESENT**

---

## Getting started

- Make sure you can login and have access to shared Linux server and https://www.tutorialspoint.com/unix_terminal_online.php

---

###  Task 1: Getting package Details and installing Apache 
- Find out how many applications are installed on your server
- Check if openssl package is installed. If it is, find out the  version installed
- Do a listing of the files in openssl package
- Search for possible http  [httpd.x86_64] package (Apache) that we can install
- verify you are able to get http version 2.2.15
- Now install it

 

#### Find out how many applications are installed on your server

    yum list installed

#### Check if openssl package is installed. If it is, find out the  version installed

    yum list installed | grep -i openssl
    yum info openssl.x86_64


#### Do a listing of the files in openssl package

    rpm -ql openssl.x86_64


####  Search for possible http  [httpd.x86_64] package (Apache) that we can install

     yum search httpd

####  verify you are able to get http version 2.2.15

     yum info httpd.x86
       

####  Now install it

    yum install httpd



### Task 2. Working with Apache [httpd].

- Start Apache Web Server [httpd] and ensure its running 
- Verify its process ID
- Verify the Port number it is running on and the network interfaces it is bound to
- Change the port number to 8081 and ensure its working as required
- [to try] Also change the bind interface to eth1
- Change  back to 80




####  Start Apache Web Server [httpd] and ensure its running
    service httpd start
    ps -ef | grep httpd

    Note: you can also use curl http://localhost. Also install lynx application and test with it
    
    
#### Verify its process ID
    ps -ef | grep httpd

####  Verify the Port number it is running on and the network interfaces it is bound to
    netstat -anop | grep {pid}

####  Change the port number to 8081 and ensure its working as required
     First backup the configueation file
     cp /etc/httpd/conf/httpd.conf  /etc/httpd/conf/httpd.conf_bk . Or simply cp /etc/httpd/conf/httpd.conf{,bk}

     Now edit ythe file
     vim /etc/httpd/conf/httpd.conf [change line with {Listen 80} to {Listen 8081} 

     Restart the service
     service httpd restart
     
     Test
     lynx http://localhost { will no longer work}
     lynx http://localhost:8081

####  Change it back
     Restore backup file
     cp /etc/httpd/conf/httpd.conf_bk  /etc/httpd/conf/httpd.conf . Or simply cp /etc/httpd/conf/httpd.conf{bk,}

     Restart the service
     service httpd restart
     
     Test
     lynx http://localhost { show now work}
     

### Task 3: Using Apache as a Web Server: Your boss has provided you arifact.tar file which should be deployed in your web sebevr

- Download and deploy the artfact file (https://github.com/shegoj/Linux_Essentials/blob/master/artifacts.tar?raw=true)  
- Test that it is working as required 
- Add your name to the index file( as the author of the file)
- Check that the update has taken effect


#### Download and deploy the artfact file 
    
     cd /var/www/html
     wget https://github.com/shegoj/Linux_Essentials/blob/master/artifacts.tar?raw=true -O artifacts.tar
     tar xvf artifacts.tar && rm -f artifacts.tar

#### Test that it is working as required . 
     lynx http://localhost

#### Add your name to the index file( as the author of the file)
     vim /var/www/html/index.html  
     look for the word tutor and replace with your name

#### Check that the update has taken effect

     lynx http://localhost


### Task 4: Tracking HTTP packets/data..You web page should be exposed to the Internet for this exercise

- Explore the page, click all weblink and login page . Try connect from different browsers, phones and pads. Also each student should ask another ( or as many as possible) to connect to hsi web server
- Verify who has connected to your webserver [ IP addresses etc]
- select an IP and verify how many times its connected.
- What broswer did the user/IP address use?
- Check the log file in real time
- Check for errors logged by the web server


#### Explore the page, click all weblink and login page


#### Verify who has connected to your webserver [ IP addresses etc]

    more /var/log/httpd/access_log

#### select an IP and verify how many times its connected

    grep {ip} /var/log/httpd/access_log
    grep {ip} /var/log/httpd/access_log | wc -l

####  What broswer did the user/IP address use?

    more /var/log/httpd/access_log

#### Check the log file in real time

    tail -f /var/log/httpd/access_log

#### Check for errors logged by the web server

     more /var/log/httpd/error_log
     Note: do you know what the error codes mean??

### Task 5: Tracking HTTP packets/data

- Track  packet transaction between a host and the web server 
- connect with your browser to the web server and start tracking the transaction via tcpdump on the server
- verify the IP address connecting to your server, without using access.log file
- use your broswer to go to the Login page. Put in a username and password and Eavesdrop on a user password on  the server



#### Track  packet transaction between a host and the web server 

    First install tcpdump package for this exrecise

    tcpdump -A -i eth1 port 80  


####  connect with your browser to the web server and start tracking the transaction via tcpdump on the server

    You might need the tutor to explain certain tcp concepts to you here

#### verify the IP address connecting to your server, without using access.log file

    check the tcpdump output

#### use your broswer to go to the Login page. Put in a username and password and Eavesdrop on a user password on  the server

    check the tcpdump output
    



***************************************************************************

[ Instructor's Help Required ]

### Task 6: Troublesshooting Connection issues

- You are no longer able to see your page over the Internet. Fix the issue  


### Task 7: working is IPTABLES for filtering Traffic

- start iptables service 
- check if you are able to connect to the server externally
- update the IPtables filter and ensure you are now able to connect



