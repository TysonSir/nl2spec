docker stop nl2spec && docker rm nl2spec && docker rmi nl2spec:latest
docker build --tag nl2spec:latest --file Dockerfile . && docker run --name nl2spec -d -p 8001:5000 nl2spec:latest
docker logs nl2spec