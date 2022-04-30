### 用户管理（以root执行）
```
添加sudo用户和普通用户
ansible-playbook -i projectA_hosts playbook/useradd.yml -k -e "user=super password=superpass sudo=yes"
ansible-playbook -i projectA_hosts playbook/useradd.yml -k -e "user=common_user password=pass"
更改密码
ansible-playbook -i projectA_hosts playbook/useradd.yml -k -e "user=common_user password=newpass"
```

### 系统初始化（以appman执行）
```
ansible-playbook -i projectA_hosts init.yml -k
```

### 重启web组（以appman执行）
```
ansible -i projectA_hosts web -a 'reboot' -u appman -b -k
```

### 安装web（以appman执行）
```
ansible-playbook -i projectA_hosts install_web.yml -k
```

ansible all -m setup
