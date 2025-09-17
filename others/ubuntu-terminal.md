# Ubuntu Terminal Commands

- `mkdir myproject`
- `cd myproject`
#
- `ls`
- `ls -a` - Hidden files
#
- `touch README.txt`
- `cat README.txt`
#
- `rm -rf filename.txt`



---


PROCESS

# Kill the process on that port
	sudo lsof -i :3000

COMMAND   	PID 		USER    	FD   	TYPE 	DEVICE 		SIZE/OFF 	NODE NAME
node      	12345 		ashok   	22u  	IPv4 	123456      	0t0  		TCP *:3000 (LISTEN)

# Kill
	kill -9 12345


# Finds the PID and kills it in one go
	sudo lsof -t -i :3000 | xargs kill -9


---


SHELL

For Linux operating systems, supported shell tags are:

	bash

	/bin/sh
	

For Windows operating systems, supported shell tags are:

	powershell.exe

	cmd.exe