FROM sonarsource/sonar-scanner-cli:5

LABEL "com.github.actions.name"="SonarQube Scan"
LABEL "com.github.actions.description"="Scan your code with SonarQube Scanner to detect bugs, vulnerabilities and code smells in more than 25 programming languages."
LABEL "com.github.actions.icon"="check"
LABEL "com.github.actions.color"="green"

LABEL version="0.0.2"
LABEL repository="https://github.com/kitabisa/sonarqube-action"
LABEL homepage="https://kitabisa.github.io"
LABEL maintainer="dwisiswant0"

# Actualizar paquetes e instalar dependencias necesarias para agregar un nuevo repositorio
RUN apt-get update && apt-get install -y gnupg software-properties-common

# Agregar el repositorio de OpenJDK
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EA8CACC073C3DB2A
RUN add-apt-repository ppa:openjdk-r/ppa

# Instalar Java 17
RUN apt-get update && apt-get install -y openjdk-17-jdk

# Establecer JAVA_HOME, reemplace este valor si su instalación difiere
ENV JAVA_HOME /usr/lib/jvm/java-17-openjdk-amd64

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
