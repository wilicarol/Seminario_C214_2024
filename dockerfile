# Use a imagem oficial do Jenkins LTS
FROM jenkins/jenkins:lts

# Switch para o usuário root para instalar dependências
USER root

# Instalação de dependências necessárias
RUN apt-get update && \
    apt-get install -y sudo curl unzip git

# Instalação do Flutter SDK
RUN git clone https://github.com/flutter/flutter.git /opt/flutter
ENV PATH="/opt/flutter/bin:${PATH}"
RUN flutter doctor

# Volta para o usuário jenkins
USER jenkins
