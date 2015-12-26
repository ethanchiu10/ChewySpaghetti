# HSBC IDD

Interactive Digital Directory for the HSBC Main Building in Hong Kong

###### Client: HSBC
###### ID: hsbc-idd
###### Team: Imagination Hong Kong
###### Status: In development

## Installation

1. have **Read** access to the [imagination/hsbc-idd](https://bitbucket.org/imagination/hsbc-idd) repository

1. have your **SSH Keys** installed at [Bitbucket](https://bitbucket.org/)

1. install [GIT](http://git-scm.com/)

1. install [NodeJS](http://nodejs.org/)

1. install **bower**, **gulp**, **browserify** and **cult** globally

        $ npm install -g gulp browserify cult bower

1. via **terminal** change your directory to where you would like to store this project

1. download this repository and install via **Node Package Manager** and **Bower**, and test:

        $ git clone git@bitbucket.org:imagination/hsbc-idd.git
        $ cd hsbc-idd
        $ npm install
        $ bower install


## Running a development server
    $ cult start

## Build for release
    $ gulp release