touch /root/$TEST_VAR_ENV
echo $TEST_VAR_ENV

#mise en place du root http	
mkdir /home/server_suivi
rm -rf /var/www/html
ln -sf /home/server_suivi/app-etudiant/dist /var/www/html
ln -sf /etc/apache2/sites-available/vhost_backend.conf /etc/apache2/sites-enabled/vhost_backend.conf
service apache2 restart


# pour passer en dev :
#git branch DEV
#git checkout DEV

#modif config du site
sed -i "s/$password = \"\"/$password = \"root\"/g" /home/server_suivi/studentApi/config/database.php
cd /home/server_suivi/app-etudiant
sed -i "s/localhost\:8080/10.1.152.211\:15808/g" /home/server_suivi/app-etudiant/src/environments/environment.ts
sed -i "s/localhost\:8080/10.1.152.211\:15808/g" /home/server_suivi/app-etudiant/src/environments/environment.prod.ts
#npm install rxjs 
#npm install zone.js
#npm install -g @angular/core --unsafe
#npm install angular2-collapsible
#npm install -g @angular/cli --unsafe
#npm install
#ng build --target=production --environment=prod

#parametrage mysql et chargement des données
mysqladmin password root
#mysql -uroot -proot < /home/server_suivi/sql/DBSuiviEtudiant.sql
#mysql -uroot -proot students_db< /home/server_suivi/sql/Data.sql
sed -i "s/bind-address/\#bind-address/g" /etc/mysql/mysql.conf.d/mysqld.cnf
service mysql restart



