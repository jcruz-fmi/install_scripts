#Update package lists
sudo apt-get update

# Install required packages
sudo apt-get install -y --no-install-recommends \
	        freetds-bin \
		krb5-user \
		ldap-utils \
		libffi6 \
		libsasl2-2 \
		libsasl2-modules \
		libssl1.1 \
		locales \
		lsb-release \
		sasl2-bin \
		sqlite3 \
		unixodbc

# Install database client packages
sudo apt-get install -y postgresql-client mysql-client
