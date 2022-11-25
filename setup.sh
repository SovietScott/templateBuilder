#!/bin/bash

REQS=$PWD/requirements.txt
ROOT=$PWD
FRONT_PACKAGES=()
BACK_PACKAGES=()

readarray linhas  < packages.txt
for item in "${linhas[0]}"; do
    FRONT_PACKAGES+=($item)
done
for item in "${linhas[1]}"; do
    BACK_PACKAGES+=($item)
done

read -p 'Nome da pasta do Front-End: ' frontvar
read -p 'Nome do aplicativo Angular: ' frontname
read -p 'Nome da pasta do Back-end: ' backvar
read -p 'Nome do aplicativo Django: ' backname

mkdir -p $frontvar
mkdir -p $backvar

back(){
    cd $ROOT/$backvar
    cp $ROOT/.env.TEMPLATE .env

    case "$(uname -s)" in # Checa qual é o SO utilizado

       Linux) # Caso Linux
        
          virtualenv venv
          source .$PWD/venv/bin/activate
    
          if [ -f "$REQS" ]; then
             pip install -r requirements.txt # Instala as dependências do requirements
          else
             pip freeze > requirements.txt
          fi

          pip install --upgrade pip

         ;;

        CYGWIN*|MINGW32*|MSYS*|MINGW*) # Caso Windows e similares

          py -m venv venv
          . $PWD/venv/Scripts/activate

          if [ -f "$REQS" ]; then
             pip install -r requirements.txt # Instala as dependências do requirements
          else
             pip freeze > requirements.txt
          fi

          py -m pip install --upgrade pip

         ;;

    esac

    pip install Django
    pip install djangorestframework

    for item in ${BACK_PACKAGES[@]}; do
        pip install $item
    done
    pip freeze > requirements.txt

    django-admin startproject $backname
}

front(){
    cd $ROOT/$frontvar
    npm install @angular/cli
    npx -p @angular/cli ng new $frontname

    for item in ${FRONT_PACKAGES[@]}; do
        npm install $item
    done
    
}

back && front && wait
echo "Templates do Front e Back criados com sucesso :D"
kill 0