sudo -u postgres psql <<EOF
    CREATE DATABASE db1;
    CREATE USER dbuser1 with encrypted password 'pass';
    GRANT ALL PRIVILEGES ON DATABASE db1 TO dbuser1;
EOF