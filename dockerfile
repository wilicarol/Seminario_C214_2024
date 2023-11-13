# Use a imagem oficial do Jenkins LTS
FROM jenkins/jenkins:lts

# Switch para o usuário root para instalar dependências
USER root

# Instalação de dependências necessárias
RUN apt-get update && \
    apt-get install -y sudo curl unzip git lcov

# Adiciona permissões ao usuário jenkins
RUN usermod -aG sudo jenkins

# Copia o arquivo de configuração JCasC
COPY Jenkins.yaml /usr/share/jenkins/ref/casc_configs/

# Configuração JCasC
ENV CASC_JENKINS_CONFIG=/usr/share/jenkins/ref/casc_configs/jenkins.yaml

# Instalação do Flutter SDK
RUN git clone https://github.com/flutter/flutter.git /opt/flutter
ENV PATH="/opt/flutter/bin:${PATH}"
RUN flutter doctor

# Instalação do Plugin email-ext
RUN jenkins-plugin-cli --plugins email-ext

# Volta para o usuário jenkins
USER jenkins
