#! bin/bash 

data=$(date + "%d,%m,%y")

dataHora=$(date + "%H,%M,%S")

status=$(systemctl status httpd)

nomeServico="Apache"
 
if systemctl status httpd | grep -q "active (running)";

then

echo "O servico $nomeServico esta rodando na data $data $dataHora com o status $status"

else
echo "O servico $nomeServico esta com o status offline na data $data e $data Hora"
