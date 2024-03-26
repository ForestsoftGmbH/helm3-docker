FROM debian:latest

ENV HELM_VERSION=3.8.2
ENV RELEASE_ROOT="https://get.helm.sh"
ENV RELEASE_FILE="helm-v${HELM_VERSION}-linux-amd64.tar.gz"

RUN apt-get update && apt-get install curl make git -y && \
    curl ${RELEASE_ROOT}/${RELEASE_FILE} | tar xvz && \
    mv linux-amd64/helm /usr/bin/helm && \
    chmod +x /usr/bin/helm && \
    curl https://storage.googleapis.com/kubernetes-release/release/v1.24.0/bin/linux/amd64/kubectl > /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl
    
RUN helm plugin install https://github.com/databus23/helm-diff && \
    helm repo add forestsoft https://Forestsoft-de.github.io/helm-charts/charts \
    rm -rf /var/lib/apt/lists/
    
