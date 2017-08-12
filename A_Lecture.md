#  Linux Essentials 1 [ August  2017]
![screengrab](screengrab.png?raw=true "screengrab")

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

###  Task 1: System Info: You have been asked by a senior admininstrator to provide the following information of a Linux server

- Linux Type, version and kernel number 
- Name, IP address, number of network card (interface) 
- How long it has been up 
- System start, stop, crash history
- Determine if you are running out of space on the system
- Number of users currently connected to the machine
- Check how much memory is on the system and how much is used and free.
- Check the number of CPUs on the system and its details 
- list the entire content (including hidden files) in /tmp directory
- create an alias (use your name as the alias) for the command usd above



#### Linux Type, version and kernel number

    cat /etc/*release*
    uname -r ; uname -a

#### Name, IP address, number of network card (interface) and how long it has been up

    hostname ; uname -n
    ip address ; ifconfig


#### How long it has been up 

    uptime -s

#### System start, stop, crash history

    last

#### Determine if you are running out of space on the system 

    df -h

#### Number of users currently connected to the machine

    who -u

####   Check how much memory is on the system and how much is used and free

    free -m .You can also try cat /proc/meminfo

#### Check the number of CPUs on the system and its details
    lscpu

####   list the entire content (including hidden files) in /tmp directory

    ls -altr /tmp

#### create an alias (use your name as the alias) for the command usd above
    alias olu='ls -altr /tmp'
    olu


### Task 2. Working with shortcut keys.

- working with tab key
- working with reverse search key
- working with ! key 

### Task 3. Navigating across the system

Note: Now that we are famil	iar with some of Linux commands, let's explore navigating and creating directories ( and files)

- determine your current location on the system
- go to your home directory and confirm you are in your home directory.
- go back to where you were before getting your home directory
- go to your home directory and confirm you are in your home directory.
- create a directory called `events and  go into the the directory
- create `2016` directory in `events`
- Now create Jan-Mar, and  1..7 directories in `2016`.
- Now list all the directories created.
- Determine the absolute directory of `Jan` directory.

####  Determine your current location on the system
        pwd

####  Go to your home directory and confirm you are in your home directory.
        cd ~  Note: you could also use cd
        pwd
####  Go back to where you were before getting your home directory.
        cd  
        pwd
####  Go to your home directory and confirm you are in your home directory. 
        cd ~  Note: you could also use cd
        pwd

####  Create a directory called `events`and go into the directory
        mkdir events
        cd events

####  Create `2016` directory in `events`
        mkdir 2016

####  Create Jan-Mar ( or 1-12) directories in `2016` : 
        cd 2016
        mkdir Jan 
        mkdir Feb 
        mkdir Mar 


####  Create 1..7 directories in `2016` : 
        pwd  . To ensure  you are still in `2006` directory
        mkdir {1..7}   . Using curl bracket makes multiple creation of directories possible. See also mkdir {a..f}, mkdir {A..Z}, mkdir Project{1..4}
        
####  Now list all the directories created: 
        ls -latr

### Task 4: Working with `echo` command 


    echo I am your tutor
    echo "I am your tutor"
    echo "which directory am I?"
    echo "you are in $(pwd) directory" 
    echo -e "which directory am I? \n You are in `pwd` directory"
    echo -e "Even Linux is good with color...  \033[32mGreen\033[m and \033[41mRed(underlined)\033[m and \033[0;36mCyan\033[m ..."

### Task 5:  Direct each of the commands above to a file 


    echo I am your tutor > file1.txt
    echo "I am your tutor" > file2.txt
    echo "which directory am I?" > file3.txt
    echo "you are in $(pwd) directory" > file4.txt 

### Task 6: view the content of the file(s) with `cat` `more` and `less` commands   


    cat file1.txt
    cat file1.txt file2.txt
    cat *.txt

    more file3.txt
    less file3.txt

### Task 7: Merge all the files created into one mega file . Call it mega.txt. Check the content

    cat *.txt >> mega.txt
    cat mega.txt

### Task 8: Working with file copying, renaming/moving and deleting files and directories 

- copy mega.txt to a new file called database.db
- delete mega.txt
- rename file1.txt to firstfile.txt
- move all the .txt files to Jan directory
- rename Jan directory to January 
- copy January directory to February 
- delete Feb directory 

#### copy mega.txt to a new file called database.db
     cp mega.txt database.db

#### Delete meg.txt
     rm mega.txt 

#### Rename file1.txt to firstfile.txt
     mv  file1.txt firstfile.txt

#### Move all the .txt files to Jan directory
     mv *.txt Jan

#### Rename Jan directory to January directory
     mv Jan January . You could also use mv Jan{,uanry}

#### Copy January directory February
     cp -r January February 

#### Delete Feb directory
    rm -rf Feb


### Task 9: System PATH
- show current System PATH value
- create bin directory in /tmp , then add the directory to the System PATH. Test that it is added
- log out of Linux and log back in. Check System Path again and see if /tmp/bin is still included.

#### show current System PATH value
     echo $PATH

#### create bin directory in /tmp, add the directory to the System PATH.
     mkdir /tmp/bin
     export PATH=$PATH:/tmp/bin
     echo $PATH


#### log out of Linux and log back in. Check System Path again and see if /tmp/bin is still included
     exit
     connect back and run  echo $PATH



### Task 10: Working with Linux  root/sudo

- create a "message of the day"  motd as a root user
- check that it works


#### create a "message of the day"  motd as root
     become root usr with command sudo su - (or use sudo -i) . Note please check with tutor to further explain the command in detail
     echo -e "************************\n\n Message of The Day\n DAY 1 Tutorila \n\n***********************************" > /etc/motd

#### check that it works
     To test, exit the Linux instance and reconnect or create a new connect
     exit
     exit
---

## Summary

We have looked at Linux basic commands, directory and files manipulation.For more challenging practical over what we have covered today, check here

Here is Linux timeline representation of the distros.. ![https://github.com/shegoj/Linux_Essentials/blob/master/image1.svg](https://github.com/shegoj/Linux_Essentials/blob/master/image1.svg)
