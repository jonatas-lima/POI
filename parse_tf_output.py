import json

CONTROL_PLANE_PUBLIC_IP_KEY = 'control-plane-public-ip'
CONTROL_PLANE_PRIVATE_IP_KEY = 'control-plane-private-ip'
WORKER_PUBLIC_IP_KEY = 'worker-public-ip'
WORKER_PRIVATE_IP_KEY = 'worker-private-ip'

with open('./terraform/output.json', 'r') as f:
  j = json.load(f)
  control_plane_public_ip = j[CONTROL_PLANE_PUBLIC_IP_KEY]['value']
  workers_public_ip = j[WORKER_PUBLIC_IP_KEY]['value']
  ansible_workers_ip = ''
  for ip in workers_public_ip:
    ansible_workers_ip += f"{ip} ansible_user=ubuntu ansible_ssh_common_args='-o StrictHostKeyChecking=no'" + "\n"

  ansible_hosts = f'''
[control-plane]
{control_plane_public_ip}    ansible_user=ubuntu ansible_ssh_common_args='-o StrictHostKeyChecking=no'

[workers]
{ansible_workers_ip}'''.lstrip()

  with open('./ansible/hosts.ini', 'w') as hosts_ini:
    hosts_ini.write(ansible_hosts)