#! bin/bash 

nomeServico="Apache"
data=$(date + "%d/%m/%y")
dataHora=$(date + "%H:%M:%S")
status=$(systemctl is-active httpd.service)
touch statusApache2.txt
 
#condicao para verifificar se o apache esta rodando na instancia ec2 

if systemctl status httpd | grep -q "active (running)";

then

#envia as informacoes para o diretorio EFS 

echo "O servico $nomeServico esta online rodando na data $data $dataHora com o status $status" >> statusApache.txt
mv statusApache.txt /mnt/efs/guilherme/online

else

echo "O servico $nomeServico esta offline na data $data e $data Hora" >> statusApache2.txt

fi

#envia as informacoes para outro diretorio EFS caso o apache esta offline
mv statusApache2.txt /mnt/efs/guilherme/offline
