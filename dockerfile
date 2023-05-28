FROM node:17.1.0

ARG PORT

ENV PORT=$PORT

RUN apt-get -y update

# 시간대 설정을 위해 tzdata 패키지 설치
RUN apt-get install -y tzdata

# KST로 시간대 변경
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime
RUN echo "Asia/Seoul" > /etc/timezone

WORKDIR /usr/src/app

COPY ./ ./

RUN npm install

RUN npm run build

EXPOSE ${PORT}

CMD ["npm", "run", "start"]
