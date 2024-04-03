FROM debian:bookworm
WORKDIR /home

RUN sed -i 's/main/main non-free/g' /etc/apt/sources.list.d/debian.sources && \
    apt update && \
    apt install git vim curl hydra nikto build-essential ruby-dev nmap sqlmap golang python3-pip -y

RUN cd /home/ && git clone --depth=1 https://github.com/ffuf/ffuf && cd ffuf && go get && go build && cp ffuf /usr/local/bin && cd ../ && rm -rf ffuf && \
    cd /home/ && git clone --depth=1 https://github.com/maurosoria/dirsearch.git && cd dirsearch && pip install -r requirements.txt --break-system-packages && \
    cd /home/ && git clone --depth=1 https://github.com/aboul3la/Sublist3r.git && cd Sublist3r && pip install -r requirements.txt --break-system-packages

RUN gem install wpscan && \
    echo "alias dirsearch=\"python3 /home/dirsearch/dirsearch.py\"" >> /root/.bashrc && \
    echo "alias sublist3r=\"python3 /home/Sublist3r/sublist3r.py\"" >> /root/.bashrc && \
    echo "alias sublister=\"python3 /home/Sublist3r/sublist3r.py\"" >> /root/.bashrc

ENTRYPOINT [ "/bin/bash" ]
