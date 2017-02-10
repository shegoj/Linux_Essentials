#  Linux Essentials 1 [ Februrary 2017]

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
     curl http://localhost { will no longer work}
     curl http://localhost:8081

####  Change it back
     Restore backup file
     cp /etc/httpd/conf/httpd.conf_bk  /etc/httpd/conf/httpd.conf . Or simply cp /etc/httpd/conf/httpd.conf{bk,}

     Restart the service
     service httpd restart
     
     Test
     curl http://localhost { show now work}
  
     
     
#### explore the content of  sample.tar without extracting the file
    tar tvf sample.tar | more

#### check the size of the two files (rfc.txt and sample.tar)
    ls -l sample.tar rfc.txt

##### Now extract the content of sample.tar into a new directory ( content)
    mkdir content
    tar xvf sample.tar -C content
#### create a new tar file called newsample.tar . Content of the file should include extracted content of sample file and rfc.txt
    cd content
    tar cvf newsample.tar * ../rfc.txt

#### confirm rfc.txt is included in the new tar.
    tar tvf newsample.tar | more 
    tar tvf newsample.tar | grep rfc.txt


#### use tar to backup 2016 directory (use the name 2016_backup)

    cd 2016
    cd ..
    tar cvf 2016backup.tar 2016

#### now delete 2016 directory and restore it from the backup previously created 

    rm -fr 2016
    tar xvf 2016backup.tar 


### Task 3: Using Apache as a Web Server: Your boss has provided you arifact.tar file which should be deployed in your web sebevr

- Download and deploy the artfact file (artifact.tar)  
- Test that is is working as required 
- Add your name to the index file( as the author of the file)
- Check that the update has taken effect


#### search for all  files and sub-directories in the current directory 
    
     find . ( find . -ls)

#### search for  only files and directories on the current directory. No recussive search . 
     find . -maxdepth 1 -ls

#### Now, try again, search only for files
     find . -maxdepth 1 -type f -ls

#### do a count of the files found

     find . -maxdepth 1 -type f -ls | wc -l

    
#### search for file with contain the word 'FTP' in the current directory 

     grep FTP *
     grep -l FTP *

#### go back one step out of the current directory... and perfom the search again

    grep FTP *

#### now do a recursive search for the word 'FTP'

    grep -rl FTP *

####  Go to the directory where rfc.txt is located and copy the file, name the new file as rfc2.txt

    cp rfc.txt rfc2.txt

#### replace the word 'FTP' in rfc.txt with 'FTP100'

    sed -i 's#FTP#FTP100#g' rfc.txt 

#### search ( recursive) for files with the word 'ftp or FTP' in them

     grep -lri ftp *



### Task 4: Tracking HTTP packets/data

- Verify who is connecting to your webserver [ IP addresses etc]
- select an IP and verify how many times its connected.
- What broswer did the user use?
- Check the log file in real time
- Check for errors logged by the web server

### Task 5: Tracking HTTP packets/data

- Track  packet transaction between a host and the web server 
- verify the IP address connecting to your server, without using access.log file
- Eavesdrop on a user password





***************************************************************************

### Task 6: Troublesshooting Connection issues

- You are no longer able to see your page over the Internet  
- verify the Ip address connecting to your server
- Eavesdrop on a user password

### Task 7: working is IPTABLES for filtering Traffic

- start iptables service 
- check if you are able to connect to the server externally
- update the IPtables filter and ensure you are now able to connect
- Eavesdrop on a user password

wge
#### dis
