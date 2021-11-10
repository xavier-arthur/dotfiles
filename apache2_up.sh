#!/bin/sh

# sobe todos os servidores na pasta
# criado pra na ter que subir servidor da empresa na mao

dir="$1"
APACHE_CONFIG_FOLDER='/etc/apache2/sites-available'

CONFIG=$(cat <<'END_HEREDOC'
<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        ServerName {server_name}
        DocumentRoot {document_root}
 
        <Directory {document_root}>
            Options FollowSymLinks
            AllowOverride none
        </Directory>
 
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
END_HEREDOC
)

if [ $(id -u) -ne 0 ]; then
    echo 'run as root!'
    exit 1
fi

for folder in ${dir}/*; do
    folderName=$(basename "$folder" | sed 's/\s/_/g')

    echo "copying ${folderName} to /var/www/${folderName}"
    cp -r "$folder" /var/www/

    echo 'generating config files'

    echo "$CONFIG" | sed "s/{server_name}/${folderName}/ ; s/{document_root}/\/var\/www\/${folderName}\/public/" > ${APACHE_CONFIG_FOLDER}/${folderName}.com.conf
    echo "127.0.0.1     ${folderName}" >> /etc/hosts

    echo "enabling ${folderName}. . ."
    a2ensite "${folderName}.com"
done

a2enmod rewrite
chmod -R 777 /var/www/*

systemctl restart apache2