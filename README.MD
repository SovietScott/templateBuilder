# Template Builder
Este script é dedicado para a criação automática de um template para o modelo de projetos com API + Front-end, atualmente com Django + DjangoRest e Angular

## Execução
1. Primeiramente é necessário escrever quais pacotes serão necessários de instalar nos projetos caso o tenham no arquivo `packages.txt`.
A ***primeira*** linha é dedicada para os pacotes do Front-End e a ***segunda*** para os pacotes do Back-End.
Os nomes dos pacotes devem ser separados por espaço apenas 

2. Após isso é necessário rodar o script `setup.sh` via Git Bash ou similares utilizando o comando `./setup.sh`. 
   > Ciclo de setup: 
   ```
   Criação dos diretórios ➤ Cópia dos arquivos de ambiente ➤ Instalação dos Frameworks e dependências ➤ Criação e execução dos projetos
   ```

3. A partir daqui os templates base estão prontos e ambos os projetos devem receber as adaptações manuais, como a atualização da `.env` e `Settings.py` do Django, e das configurações do Angular
   > A `.env` é copiada para dentro do projeto Django a partir do `.env.TEMPLATE` automaticamente 

4. Após isso, o script `run.sh` pode ser executado para rodar o Front-End e Back-end de forma paralela em um terminal único

## Pontos que ainda faltam implementar
* Atualização automática dos componentes do Django como o `Settings.py`
* Reconhecimento das versões dos pacotes
* Customizações em geral