server {
	listen 443 ssl;
	listen [::]:443 ssl;

	server_name vbachele.42.fr;
	# On note le cert et la key (necessaire protocole ssl)
	ssl_certificate		/etc/nginx/ssl/vbachele.crt;
	ssl_certificate_key	/etc/nginx/ssl/vbachele.key;

	# Protocole d'encryptions pour les cles ssl
	ssl_protocols		TLSv1.2 TLSv1.3;

	# Fichiers a afficher et dossier ou les chercher
	root /var/www/html;
	index index.php index.nginx-debian.html;

	# Directive necessaire pour les endpoints, 
	# Fast cgi necessaire pour nginx pour "traduire" le php
	location  {
		try_files $uri $uri/ /index.php$is_args$args;
	}

	location ~ \.php$ {
		fastcgi_split_path_info ^(.+\.php)(/.+)$;
		fastcgi_pass wordpress:9000; #PHP for wordpress will listen on the port 9000
		fastcgi_index index.php;
		include fastcgi_params;
		fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
		fastcgi_param SCRIPT_NAME $fastcgi_script_name;
	}
}