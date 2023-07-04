FROM nl2spec_base:1.0

COPY . /home/nl2spec

WORKDIR /home/nl2spec/src

EXPOSE 5000

CMD ["python3", "frontend.py"]

# 安装&启动
# docker build --tag nl2spec:latest --file artifact.Dockerfile . && docker run --name nl2spec -d nl2spec:latest

# 卸载
# docker stop nl2spec && docker rm nl2spec && docker rmi nl2spec:latest