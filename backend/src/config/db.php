<?php
class db
{
    public function connect()
    {
        $dbh = new PDO("mysql:dbhost=localhost;dbname=toolManager", 'root', '');
        $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $dbh;
    }
}
