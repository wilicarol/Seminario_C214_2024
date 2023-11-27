
echo "Mandando e-mail com mail do linux" | mail -s "a subject" $1

#!/bin/bash

# Configurações do servidor SMTP
SMTP_SERVER="smtp.gmail.com"
SMTP_PORT="587"
SMTP_USERNAME="pedrodaluzmota208@gmail.com"
SMTP_PASSWORD="fpqi qgxq cdvb cbmi"

# Destinatário e remetente
EMAIL="pedrodaluzmota208@gmail.com"

# Criar corpo do e-mail
ASSUNTO="O app foi contruido"
CORPO="Notificação"

# Enviar e-mail usando o comando mail
echo -e "$CORPO" | mail -s "$ASSUNTO" -a "From: $EMAIL" -S smtp="smtp://$SMTP_SERVER:$SMTP_PORT" -S smtp-use-starttls -S smtp-auth=login -S smtp-auth-user="$SMTP_USERNAME" -S smtp-auth-password="$SMTP_PASSWORD" "$EMAIL"
