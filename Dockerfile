FROM nl2spec_base:1.0

# copy project
COPY . $CODE_DIR

# addition pip install
ENV PIP_SRC https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip install -r requirements.txt -i $PIP_SRC

EXPOSE 5000

WORKDIR $CODE_DIR/src
CMD ["python", "frontend.py"]

# 安装&启动
# docker build --tag nl2spec:latest --file Dockerfile . && docker run -v ~/nl2spec_vol:/workspace/nl2spec --name nl2spec -d -p 8001:5000 nl2spec:latest

# 卸载
# docker stop nl2spec && docker rm nl2spec && docker rmi nl2spec:latest