#!/bin/bash

read -p 'Nome da pasta do Front-End: ' frontvar
read -p 'Nome da pasta do Back-end: ' backvar

back(){
    cd $frontvar
    . ./venv/Scripts/activate 
    python manage.py runserver >> server_log & echo "O servidor do back-end está rodando"
}
    
front(){
    cd $backvar
    npx ng serve >> server_log & echo "O servidor do front-end está rodando"
}

echo "Digite s ou S caso queira parar os servidores"
echo "O servidor do front-end demora um pouco mais, tenha calma :D"
back & front & wait
while :
do
    read -rsn1 -t12 key
    if [[ $key = "s" ]] || [[ $key = "S" ]]; then    
        kill 0

    fi
done    

