
#installation des clés publiques/privées
eval `ssh-agent -s`
chmod 0600 /root/key_rsa
ssh-add /root/key_rsa
rm -rf /root/key_rsa
	
#Git en master
cd /home/server_suivi
git init
git pull ssh://git@10.1.152.219:10022/InformationSystemNetworkandCloud/Network-system/Suivi_etudiant/suivi_etudiant.git

sh /home/server_suivi/install/install.sh

rm -rf /root/script.sh