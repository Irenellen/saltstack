/var/www/html/www.virtualhost1.com:
  file.directory:
    - name: /var/www/html/www.virtualhost1.com

/var/www/html/www.virtualhost1.com/index.html:
  file.managed:
    - source: salt://virtualhost/index.html

#set read permissions to all
/etc/apache2:
  file.directory:
    - user: ir
    - group: users
    - mode: 755

000default-conf-delete:
  file.absent:
    - name: /etc/apache2/sites-available/000-default.conf

/etc/apache2/sites-available/www.virtualhost1.com.conf:
  file.managed:
    - source: salt://virtualhost/www.virtualhost1.com.conf

/etc/apache2/sites-enabled/www.virtualhost1.com.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/www.virtualhost1.com.conf

apache2:
  service.running:
    - enable: True
    - reaload: True
