#!/bin/sh

aliasFile=~/.bash_aliases;

[ ! -f "$aliasFile" ] && touch "$aliasFile";

[ "$(grep -q 'alias la' $aliasFile; echo $?)" -eq 1 ] && echo "alias la='ls -la'" >> $aliasFile;

[ "$(grep -q 'alias ips' $aliasFile; echo $?)" -eq 1 ] && echo "alias ips='ip address | grep \"inet\\s\"'" >> $aliasFile;

[ "$(grep -q 'alias ipsv6' $aliasFile; echo $?)" -eq 1 ] && echo "alias ipsv6='ip address | grep inet6'" >> $aliasFile;

### docker
[ "$(grep -q 'alias dstats' $aliasFile; echo $?)" -eq 1 ] && echo "alias dstats='sudo docker stats'" >> $aliasFile;

[ "$(grep -q 'alias dnls' $aliasFile; echo $?)" -eq 1 ] && echo "alias dnls='sudo docker network ls --format \"{{.ID}}\t{{.Driver}}\t{{.Scope}}\t{{.Name}}\"'" >> $aliasFile;

[ "$(grep -q 'alias dils' $aliasFile; echo $?)" -eq 1 ] && echo "alias dils='sudo docker image ls'" >> $aliasFile;

[ "$(grep -q 'alias dvls' $aliasFile; echo $?)" -eq 1 ] && echo "alias dvls='sudo docker volume ls'" >> $aliasFile;

[ "$(grep -q 'function dcls' $aliasFile; echo $?)" -eq 1 ] &&
cat >> $aliasFile <<EOF 

function dcls {
	sudo docker ps -a \
	-f name=\$1 \
	--format "{{.ID}}\t{{.RunningFor}}\t{{.Status}}\t{{.Names}}\n{{.Networks}}\n{{.Ports}}\n-------------------------------------------------------------------"
}
EOF

[ "$(grep -q 'function dlogs' $aliasFile; echo $?)" -eq 1 ] &&
cat >> $aliasFile <<EOF

function dlogs {
	sudo docker logs \$1
}
EOF

[ "$(grep -q 'function dexec' $aliasFile; echo $?)" -eq 1 ] &&
cat >> $aliasFile <<EOF

function dexec {
	sudo docker exec -it \$1 \$2
}
EOF
