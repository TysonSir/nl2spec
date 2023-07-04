FROM --platform=linux/amd64 ubuntu:jammy

# 换源
RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak
RUN sed -i 's/http:\/\/archive.ubuntu.com/https:\/\/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list
RUN apt-get -q update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -q install -y \
    python3 python3-pip vim

COPY . /home/nl2spec

ENV PIP_SRC https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip3 install --upgrade pip -i $PIP_SRC && \
    pip3 install -r /home/nl2spec/requirements.txt -i $PIP_SRC


WORKDIR /home/nl2spec/src

EXPOSE 5000

CMD ["python3", "frontend.py"]

# 安装&启动
# docker build --tag nl2spec:latest --file artifact.Dockerfile . && docker run --name nl2spec -d nl2spec:latest

# 卸载
# docker stop nl2spec && docker rm nl2spec && docker rmi nl2spec:latest