# Some useful shell scripts
I upload some useful bash scipts here now and then.

### **Clone the repository**
```bash
git clone https://github.com/century300/useful-scripts ~/Downloads/useful-scripts && cd ~/Downloads/useful-scripts && chmod +x *
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
- Example: gobuster brute-force using SecLists subdomains wordlist to discover virtual hosts names, then use for loop to and dirbuster wordlist to find the _flag_ in there
```bash
gobuster vhost -u http://TargetWebsite.com -w /usr/share/wordlists/SecLists/Discovery/DNS/subdomains-top1million-5000.txt -t30

for vhost in subDomain1 subDomain2 subDomain3; do gobuster dir -u http://${vhost}.TargetWebsite.com -w /usr/share/dirbuster/directory-list-2.3-small.txt -x php,txt -t30 -o Output.txt; done
```
