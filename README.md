Установка последней версии ansible в убунту
sudo apt-add-repository ppa:ansible/ansible

sudo apt-get update

sudo apt-get install ansible

Ping серверов
ansible -i <inventory file> <group> -m ping
Пример использования
ansible -i inventory/localhost.ini all -m ping
Информация о сервере
ansible all -m setup
Запустить shell команду
ansible all -m shell -a "uptime"
ansible all -m command -a "uptime" #запускает не через shell, соответсвенно не будет переменных окружения
Копирование файлов
ansible all -m copy -a "src=file.txt dest=/home mode=777" -b
-b - запуск из под sudo 
Удаление файлов
ansible all -m file -a "path=/home/file.txt state=absent" -b
Скачивание файлов
ansible all -m get_url -a "url=<> dest=/home" -b
Проверка коннекта
ansible all -m uri -a "url=<> return_content=yes"

Запуск playbook
ansible-playbook playbooks/my_inst.yml -i inventory/localhost.ini 

Просмотр списка серверов и их переменных
ansible-inventory --list 
