FROM kalilinux/kali-rolling

RUN apt update

RUN apt-get install -y build-essential wget curl 

RUN apt-get -y install python3 python3-pip

RUN python3 -m pip --version

COPY requirement.txt /requirement.txt

RUN python3 -m pip install -r /requirement.txt

RUN apt-get -y install texlive-xetex

RUN apt-get -y install pandoc

RUN apt-get -y install default-jre

RUN python3 --version

RUN apt-get -y install git sudo

RUN apt-get -y install nmap curl unicornscan nikto hping3 xprobe2 sqlmap wpscan iputils-ping

RUN apt-get -y install metasploit-framework

RUN apt-get -y install dnsutils

RUN useradd -ms /bin/bash jupyter

RUN echo "jupyter     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN usermod -a -G sudo jupyter

RUN chsh -s /bin/bash jupyter

WORKDIR /home/jupyter/

USER jupyter

RUN git clone https://github.com/maurosoria/dirsearch.git

RUN cd dirsearch; python3 -m pip install -r requirements.txt

EXPOSE 8888
