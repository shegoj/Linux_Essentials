#  Linux Essentials 1 [ May 2017]

## Lecture 2 [ File Access And Manipulaton ]

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

###  Task 1: File creation and Manipulation with VIM/VI: You have been asked by a senior admininstrator to perform the following tasks
- create a file [ config.txt ] using vi/vim with the following content: " This is a simple config file created using vim"
- Add a second line to the file : "Config file is now created and saved"
- Add a line between first ad second line with this content:  "Config file has been cehcked for errors"
- Delete the 3rd line, then undo the action
- Copy the 3rd line and paste below it
- Delete the new line added ( line 4)
- Copy all the line created so far, the paste the lines 3-times
- Add a line label to each of the lines in the file
- Replace the word 'config' with the word 'configuration' in the file
- go to the top of the file , then bottom of the file
- save the file with a new name 'config2.txt'

#### create a file [ config.txt ] using vi/vim with the following content: " This is a simple config file created using vim"

    type: vim config.txt
    press escape button, then press 'i' to go into insert mode. 
    type in the text you want to add, then press esc, then ':x!' ( to save and exit)

#### Add a second line to the file : "Config file is now created and saved"

    type: vim config.txt
    press escape button, then press 'o' to go into insert mode- on the next line 
    type in the text you want to add, then press esc, then ':x!' ( to save and exit)


#### Add a line between first ad second line with this content:  "Config file has been checked for errors"

    type: vim config.txt
    navigate to the 2nd line
    press escape button, then press 'O' to go into insert mode- on the next line 
    type in the text you want to add, then press esc, then ':x!' ( to save and exit)


####  Delete the 3rd line, then undo the action

    type: vim config.txt
    navigate to the 3rd line
    press escape button, then press 'dd' to delete the line
    press escape button, then press 'u' to undo the change
    press esc, then ':x!' ( to save and exit)

####  Copy the 3rd line and paste below it

    type: vim config.txt
    navigate to the 3rd line
    press escape button, then press 'yy' to copy the line
    press escape button, then press 'p' to paste
    press esc, then ':x!' ( to save and exit)

####  Delete the new line added ( line 4)

    type: vim config.txt
    navigate to the 4th line
    press escape button, then press 'dd' to copy the line
    press esc, then ':x!' ( to save and exit)


#### Copy all the line created so far, then paste the lines 3-times

    type: vim config.txt
    press escape button, then type '3yy' to copy the 3 lines
    navigate to the bottom of the file, then press 'p'
    press esc, then ':x!' ( to save and exit)

####  Add a line label to each of the lines in the file

    type: vim config.txt
    press escape button, then type ':set number' 

#### Replace the word 'config' with the word 'configuration' in the file

    type: vim config.txt
    press escape button, then type ':%s/config/configuration/g' 
    press esc, then ':x!' ( to save and exit)

#### Go to the top of the file , then bottom of the file
    type: vim config.txt
    press escape button, then type 'gg'  to go to top of the file
    press escape button, then type 'shift+g'  to go to bottom of the file
    press esc, then ':x!' ( to save and exit)

#### save the file with a new name 'config2.txt'
    type: vim config.txt
    press escape button, then type ':w config2.txt'  to save
    press esc, then ':q!' ( to exit)


### Task 2. Working with internet files and tar command.

- View the text file here without downloading it http://www.rfc-base.org/txt/rfc-959.txt. Then download the file
- download this tar file  http://www.dynaexamples.com/examples-manual/ls-dyna_example.tgz/at_download/file
- delete the two files downloaded
- Download the two files again as  rfc.txt and sample.tar  respectively
- explore the content of  sample.tar without extracting the file
- check the size of the two files (rfc.txt and sample.tar)
- Now extract the content of sample.tar into a new directory ( content)
- create a new tar file called newsample.tar . Content of the file should include extracted content of sample file and rfc.txt
- confirm rfc.txt is included in the new tar.
- use tar to backup 2016 directory (use the name 2016_backup)
- now delete 2016 directory and restore it from the backup previously created


####  View the text file here without downloading it http://www.rfc-base.org/txt/rfc-959.txt. Then download the file
    curl http://www.rfc-base.org/txt/rfc-959.txt

#### download files
    wget http://www.rfc-base.org/txt/rfc-959.txt
    wget http://www.dynaexamples.com/examples-manual/ls-dyna_example.tgz/at_download/file

####  delete the two files downloaded
    rm  rfc-959.txt file

####  Download the two files again as  rfc.txt and sample.tar  respectively
    wget http://www.rfc-base.org/txt/rfc-959.txt -O file.txt ( curl -o rfc.txt http://www.rfc-base.org/txt/rfc-959.txt)
    wget http://www.dynaexamples.com/examples-manual/ls-dyna_example.tgz/at_download/file -O sample.tar ( curl -o sample.tar http://www.dynaexamples.com/examples-manual/ls-dyna_example.tgz/at_download/file)

#### explore the content of  sample.tar without extracting the file
    tar tvf sample.tar | more

#### check the size of the two files (rfc.txt and sample.tar)
    ls -l sample.tar rfc.txt . ALso try ls -lh sample.tar rfc.txt 

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


### Task 3: greping and finding files

- search for all  files and sub-directories in the current directory 
- search for  only files and directories on the current directory. No recussive search 
- Now, try again, search only for files
- do a count of the files found
- go to the directory where rfc.txt is located
- search for file with contain the word 'FTP' in the current directory 
- go back one step out of the current directory... and perfom the search again
- now do a recursive search for the word 'FTP'
- Go to the directory where rfc.txt is located and copy the file, name the new file as rfc2.txt
- replace the word 'FTP' in rfc.txt with 'FTP100'
- search ( recursive) for files with the word 'ftp or FTP' in them


#### search for all  files and sub-directories in the current directory 
    
     find .  Also consider  find . -ls

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


### Task 4: awk, sort and command chaining

- download address.csv file from here 
- backup the file as addressbook.csv
- display the content of addressbook.csv
- display the content of the file without the header
- display the content of addressbook.csv
- display the content of the file without the header and order the content by name ( in ascending , then descending order)
- display content of the file with records of people from London
- display content of the file with records of people NOT from London  
- display content of the file with records of people who are male
- display content of the file with records of people who are not  male
- create a new ordered file ( by name), replace "," in file with ":" and name it processed.csv
- display only the  names of users on this Linux machine  provisioned with bash shell

#### - download address.csv file from here https://github.com/shegoj/Linux_Essentials/blob/master/address.csv
      wget https://raw.githubusercontent.com/shegoj/Linux_Essentials/master/address.csv (or copy the content and use vim/vi to create the file)

####  backup the file as addressbook.csv

      cp address.csv addressbook.csv

#### display the content of the file
      cat addressbook.csv


#### display the content of the file with header
      cat addressbook.csv | tail -7. You can also use cat addressbook.csv | grep -v ^Name

#### display the content of the file without the header and order the content by name ( in ascending , then descending order)

     cat addressbook.csv | grep -v ^Name | sort
     cat addressbook.csv | grep -v ^Name  | sort -r 

#### display content of the file with records of people from London

     cat addressbook.csv | grep London
 

#### display content of the file with records of people NOT from London

     cat addressbook.csv | grep -v London

#### - display content of the file with records of people who are male
     
     cat addressbook.csv | grep  -i m$

    
#### - display content of the file with records of people who are NOT male
     
     cat addressbook.csv | grep  -iv m$

#### create a new ordered file ( by name), replace "," in file with ":" and name it processed.csv

     cat addressbook.txt | grep -v ^Name | sort| awk -F, '{ print $1 ":" $2 ":" $3 ":" $4}' >> processed.csv

#### display only the  names of users on this Linux machine  provisioned with bash shell
     cat /etc/passwd | grep bash$

   

### Task 5. process management and control
- check status of current proceesses on the system, with emphasis on cpu , memory and io
- display all the current processes running on the system , page by page
- display only processes related to running as rpc user
- how many processes are running as root user
- use vim to create a file (file100.txt)
- put the process in background
- repeat the process for file220.txt
- check hw many jobs running in background
- bring the first process to foreground, then back to background
- use the second process job number to kill the processs
- what is the process number of the first processs ( not job number)?
- kill the process using its process number ( not its job number)

#### - check status of current proceesses on the system, with emphasis on cpu , memory and io

   	top ( explain how its used)

#### display all the current processes running on the system , page by page

     ps aux | more

#### display only processes related to running as rpc user
    ps aux | grep ^rpc

####  how many processes are running as root user
    ps aux | grep ^root | wc -l

#### use vim to create a file (file100.txt)
   
    vim file100.txt

#### put the process in background
    ctrl z ( to temporarily stop the process)  a

    jobs ( to get the job number)
    bg %jobnumber ( to put the job in the background, running)

     REPEAT

#### check hw many jobs running in background

    jobs

#### bring the first process to foreground, then back to background
     fg 
     ctrl +z 
     jobs
     bg %jobnumber

#### use the second process job number to kill the processs
    jobs
    kill %jobnumber


#### what is the process number of the first processs ( not job number)?
     ps aux | grep vi

     kill -9 processid



try the execise here:
http://evc-cit.info/cit052/grep1.html 

And here if you are feeling confident: https://www.hackerrank.com/domains/shell/grep-sed-awk

---


