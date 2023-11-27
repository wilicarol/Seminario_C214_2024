echo $EMAIL
echo $1
echo $2
EMAIL = $1
echo "Mandando e-mail com mail do linux" | mail -s "a subject" $EMAIL