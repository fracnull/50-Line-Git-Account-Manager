# 50-Line Git Account Manager
A 50-line program to switch between different git accounts

watch a [demo](https://youtu.be/iDqjc7VKgAI)

## Usage
1. download source code
2. convert the Ruby file into an executable
3. place the executable in `usr/local/bin`
4. run the command `gitname` from anywhere in the terminal

## Commands
```
gitname {nickname} - call git config using credentials under nickname
gitname list - list all nicknames
gitname set {nickname} {name} {email} - store credentials under nickname
gitname delete {nickname} - delete credentials under nickname
```
