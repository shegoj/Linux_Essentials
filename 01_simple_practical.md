#  Linux Essentials 1 [ Februrary 2017]

This guide provides a simple practical steps to learning and using Linux. It will take about an hour to complete

---

## 

You will try out different Linux commands to  solve real life problems as a way of familiarising yourself with the environment.

---

## Intended Audience

Users who undertand basic concept of the compuet system.

---

## Requirements

The following installed and working

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

#### Linux Type, version and kernel number

    cat /etc/*release*
    uname -r ; uname -a

#### Name, IP address, number of network card (interface) and how long it has been up

    ```
    hostname ; uname -n
    ip address ; ifconfig

    ```

#### How long it has been up 

    ```
    uptime -s
    ```

#### System start, stop, crash history

    ```
    last
    ```
#### Determine if you are running out of space on the system 

    ```
    df -h
    ```

#### Number of users currently connected to the machine

    ```
    who -u
    ```

### Step 2. Working with shortcut keys.

-working with tab key
-working with reverse search key
-working with ! key 
### Step 3

- Now we're ready to create a repository, and show our awesome code to our team

    1. navigate to https://git.yoox.net/projects/train
    2. create a new repository YOURNAME-helloworld

- git init, add, commit and push your code

- Navigate to https://ci-jenkins.yoox.net/job/train/

    _Note how there is no entry for your repository, it won't appear until you add a `Jenkinsfile`_

### Step 4

- Create a `Jenkinsfile`

    ```
    #!/usr/bin/env groovy

    // docker tags must be in lower case
    env.DOCKER_TAG = BUILD_TAG.toLowerCase()

    stage("build") {
      node {
        checkout scm
        sh 'docker build -t $DOCKER_TAG .'
        sh 'docker run --rm $DOCKER_TAG'
      }
    }
    ```

- git add, commit, push

- Navigate to https://ci-jenkins.yoox.net/job/train/

    _Jenkins polls every 1min, so you may need to wait/refresh_

    _You should see an entry for YOURNAME-helloworld, navigate into it and watch it build_

### Step 5

- Let's modify the script, and see the changes in CI, replace `hello-world.go` with the following

    ```
    package main

    import(
      "fmt"
      "runtime"
    )

    func main(){
      fmt.Printf("hello world, I'm running on %s with an %s CPU ", runtime.GOOS, runtime.GOARCH)
    }
    ```

- git add, commit, push

- watch the job in jenkins, you should see something like the following as the output

    ```
    hello world, I'm running on linux with an amd64 CPU
    ```

---

## Summary

This is a very basic example, hopefully you can see how easy it was to perform basic CI against a script.  This becomes far more powerful when it runs against a Pull Request, allowing others to see your change and that it worked successfully.

For a far more intensive practical, see the [02_intense_practical](02_intense_practical.md) file

