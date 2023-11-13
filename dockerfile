# Use a imagem oficial do Jenkins LTS
FROM jenkins/jenkins:lts

# Switch para o usuário root para instalar dependências
USER root

# Instalação de dependências necessárias
RUN apt-get update && \
    apt-get install -y sudo curl unzip git lcov

# Adiciona o usuário Jenkins ao grupo sudo
RUN usermod -aG sudo jenkins

# Copia o arquivo de configuração JCasC
COPY Jenkins.yaml /usr/share/jenkins/ref/casc_configs/

# Configuração JCasC
ENV CASC_JENKINS_CONFIG=/usr/share/jenkins/ref/casc_configs/jenkins.yaml

# Instalação do Flutter SDK
RUN git clone https://github.com/flutter/flutter.git /opt/flutter
RUN chown -R jenkins:jenkins /opt/flutter

# Permissões específicas
RUN chmod -R 755 /opt/flutter/bin
ENV PATH="/opt/flutter/bin:${PATH}"
RUN flutter doctor

# Instalação do Plugin email-ext (última versão)
RUN jenkins-plugin-cli --latest --plugins email-ext

# Volta para o usuário jenkins
USER jenkins
