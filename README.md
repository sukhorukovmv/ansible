# Ansible

## Установка последней версии ansible в ubuntu
```
    sudo apt-add-repository ppa:ansible/ansible
    sudo apt-get update
    sudo apt-get install ansible
```

## Полезные команды
#### Ping серверов
```
    ansible -i <inventory file> <group> -m ping
```
#### Пример использования
```
    ansible -i inventory/localhost.ini all -m ping
```
#### Информация о сервере
##### Выводит информацию о сервере в переменных, которые можно использовать в дальнейшей работе.
```
    ansible all -m setup
```
#### Запустить shell команду
```
    ansible all -m shell -a "uptime"
    ansible all -m command -a "uptime" #запускает не через shell, соответсвенно переменных окружения не будет
```
#### Копирование файлов
```
    ansible all -m copy -a "src=file.txt dest=/home mode=777" -b
    -b - запуск из под sudo
``` 
#### Удаление файлов
```
    ansible all -m file -a "path=/home/file.txt         state=absent" -b
```
#### Скачивание файлов
```
ansible all -m get_url -a "url=<> dest=/home" -b
Проверка коннекта
ansible all -m uri -a "url=<> return_content=yes"
```
#### Просмотр списка серверов и их переменных
```
    ansible-inventory --list
``` 

## Handlers

    handlers:
    - name: Restart Apache
      service: name=httpd state=restarted

    #Перезагрузит Apache только если файлы были изменены 
    tasks:
    - name: Copy MyHomePage to Servers
      copy: src={{ source_file }} dest={{ destin_file }} mode=0555
      notify: Restart Apache

## Запуск playbook
```
    ansible-playbook playbooks/my_inst.yml -i inventory/localhost.ini
```

## Ansible-galaxy
```
    ansible-galaxy init <name_role> - инициализация ansible роли
```


