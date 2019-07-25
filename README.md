Установка последней версии ansible в убунту
sudo apt-add-repository ppa:ansible/ansible

sudo apt-get update

sudo apt-get install ansible

Ping серверов
ansible -i <inventory file> <group> -m ping
ansible -i inventory/localhost.ini all -m ping

Запуск playbook
ansible-playbook playbooks/my_inst.yml -i inventory/localhost.ini 

Просмотр списка серверов и их переменных
ansible-inventory --list 

