#! /bin/sh

tst=`which mysql`
sql=`readlink -f $tst`

$sql -u root -p mademoiselle_borges < ./simple.txt
