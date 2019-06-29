FROM docker.io/centos:latest

# Get 'kubectl' command
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/.

# Get 'kubectx' & 'kubens' command
RUN yum install -y git
RUN git clone https://github.com/ahmetb/kubectx.git
RUN mv ./kubectx/kubectx /usr/local/bin
RUN mv ./kubectx/kubens /usr/local/bin
RUN rm -rf ./kubectx

# Get 'helm' command
RUN curl -LO https://get.helm.sh/helm-v2.13.0-linux-amd64.tar.gz
RUN tar -zxf ./helm-v2.13.0-linux-amd64.tar.gz
RUN mv ./linux-amd64/helm /usr/local/bin
RUN mv ./linux-amd64/tiller /usr/local/bin
RUN rm -rf ./linux-amd64
RUN rm -f ./helm-v2.13.0-linux-amd64.tar.gz

# Copy 'config' file from host
RUN mkdir -p /root/.kube
COPY ./config /root/.kube/config
COPY ./kube_context /root/kube_context.sh
COPY ./bashrc /root/.bashrc
RUN source /root/.bashrc
