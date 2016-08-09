#!/bin/bash

drink=$1
price=$2
barTabFile="/var/www/html/barTab/barTab.php"

priceArrayL=$(grep -n "ADDPRICEARRAY" $barTabFile |cut -f1 -d:)
drinkArrayL=$(grep -n "ADDDRINKARRAY" $barTabFile |cut -f1 -d:)
drinkDivL=$(grep -n "ADDDRINKHERE" $barTabFile |cut -f1 -d:)

#drinkArrayStr=",\"$drink\"=>\"drink-icon.png\""
#priceArrayStr=",\"$drink\"=>\"$price\""

drinkDivCom=$(sudo sed -i "$drinkDivL""i\$drink = $drink""; echo '<a href=\"javascript:drink(\\\'' . \$drink . '\\\', \\\'' . \$price[\$drink] . '\\\')\" class=\"box bluefish\">'; echo \$imgVar1 . \$drinks[\"\$drink\"] . \$imgVar2; echo '<h2>' . \$drink . '</h2>'; echo '<h2R>\$' . \$price[\"\$drink\"] . '</h2R>'; echo '</a>';" /var/www/html/barTab/barTab.php)
priceArrayCom=$(sudo sed -i "$priceArrayL""i,\"$drink\"=>\"$price\"" /var/www/html/barTab/barTab.php)
drinkArrayCom=$(sudo sed -i "$drinkArrayL""i,\"$drink\"=>\"drink-icon.png\"" /var/www/html/barTab/barTab.php)

#drinkDivCom=$("sudo sed -i \"$drinkDivL""i$drinkDivStr\" $barTabFile")
#drinkDivCom="sudo sed -i \"$drinkDivL""i$drinkDivStr\" $barTabFile"
#eval "$drinkDivCom"


drinkDivStr1="echo '<a href=\"javascript:drink(\'' . \$drink . '\', \'' . \$price[\$drink] . '\')\" class=\"box bluefish\">';"
drinkDivStr2="$drinkDivStr1 echo \$imgVar1 . \$drinks[\"\$drink\"] . \$imgVar2;"
drinkDivStr3="$drinkDivStr2 echo '<h2> . \$drink . '</h2>'; echo '<h2R>\$' . \$price[\"\$drink\"] . '</h2R>';"
drinkDivStr="$drinkDivStr3 echo '</a>';"
#drinkDivStr1="echo '<a href=\\"javascript:drink(\'' . \$drink . '\', \'' . \$price[\$drink] . '\')\\" class=\\"box bluefish\\">';"
#drinkDivStr2="$drinkDivStr1 echo \$imgVar1 . \$drinks[\\"\$drink\\"] . \$imgVar2;"
#drinkDivStr3="$drinkDivStr2 echo '<h2> . \$drink . '</h2>'; echo '<h2R>\$' . \$price[\\"\$drink\\"] . '</h2R>';"
#drinkDivStr="$drinkDivStr3 echo '</a>';"
