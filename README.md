Установка последней версии ansible в убунту
sudo apt-add-repository ppa:ansible/ansible

sudo apt-get update

sudo apt-get install ansible

Запуск playbook
ansible-playbook playbooks/my_inst.yml -i inventory/localhost.ini 
