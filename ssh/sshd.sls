openssh-server:
  pkg.installed

/etc/ssh/sshd_config:
  file.managed:
    - source: salt://sshd_config

/etc/ssh/ssh-banner:
  file.managed:
    - source: salt://sshdbanner

sshd:
  service.running:
    - watch:
      - file: /etc/ssh/sshd_config
