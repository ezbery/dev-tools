FROM ubuntu:22.04

RUN apt update -y
RUN apt install -y gnupg software-properties-common wget

#Some dev tools
WORKDIR /root
RUN apt install -y zsh git vim curl docker.io
RUN chsh -s /usr/bin/zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
RUN git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
RUN sed -i 's+ZSH_THEME="robbyrussell"+ZSH_THEME="powerlevel10k/powerlevel10k"+g' .zshrc
RUN sed -i 's+plugins=(git)+plugins=(git docker terraform zsh-autosuggestions zsh-syntax-highlighting)+g' .zshrc

RUN echo "alias ll='ls -alh --color=auto'" >> .zshrc

RUN curl -sS https://webinstall.dev/k9s | bash

#Terraform
RUN wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    tee /etc/apt/sources.list.d/hashicorp.list
RUN apt update && apt install -y terraform

#Azure
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash
RUN az aks install-cli

#Kubernetes
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl"
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

#AWS
#RUN apt install -y awscli

WORKDIR /app

ENTRYPOINT ["sleep", "infinity"]
