#!/bin/bash

user=$1
barTabFile="/var/www/html/barTab/barTab.php"

userArrayL=$(grep -n "ADDUSERARRAY" $barTabFile |cut -f1 -d:)
userDivL=$(grep -n "ADDUSERHERE" $barTabFile |cut -f1 -d:)

userDivCom=$(sudo sed -i "$userDivL""i  \$user = \"$user\"""; echo '<a href=\"javascript:name(' . \"'\" . \$user . \"'\" . ')\" class=\"box blue\">'; echo \$imgVar1 . \$people[\$user] . \$imgVar2; echo '<h2>' . \$user . '</h2></a>';" $barTabFile)
userArrayCom=$(sudo sed -i "$userArrayL""i,\"$user\"=>\"new-user.png\"" $barTabFile)
