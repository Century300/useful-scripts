#!/bin/bash

# check to see which one is the useful ssh port in CTF, -o StrictHostKeyChecking=no to skip answering yes to add the targetIP:port to the list of known host, need to input targetIP
for port in {1..65535}
do
	printf "$port"
	ssh -o StrictHostKeyChecking=no -p $port <target_IP>
done
