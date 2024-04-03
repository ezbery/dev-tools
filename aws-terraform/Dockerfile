FROM amazon/aws-cli:2.15.34

RUN yum update -y
RUN yum install -y yum-utils
RUN yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
RUN yum -y install terraform-1.7.5-1

#Some dev tools
WORKDIR /root
RUN yum install -y util-linux-user vim zsh
RUN chsh -s /usr/bin/zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
RUN git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
RUN sed -i 's+ZSH_THEME="robbyrussell"+ZSH_THEME="powerlevel10k/powerlevel10k"+g' .zshrc
RUN sed -i 's+plugins=(git)+plugins=(git docker terraform zsh-autosuggestions zsh-syntax-highlighting)+g' .zshrc

RUN echo "alias ll='ls -alh --color=auto'" >> .zshrc

WORKDIR /app

ENTRYPOINT ["sleep", "infinity"]
