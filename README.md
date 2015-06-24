# docker-yobi


![yobi image](http://assets.hibrainapps.net/images/rest/data/484?size=full&m=1435125394)
(이미지출처 : http://yobi.io)

**docker-yobi**는 **Naver**의 **git** 기반 협업 프레임워크 [Yobi](http://yobi.io)를 사용하기 편리하게 docker 컨테이너로 만든 컨테이너 이미지 입니다.

## 사용방법

**docker-yobi**는 복잡한 설정 없이 현재 운영하고 있는 **Yobi** 프로젝트를 바로 최신 Yobi 서비스로 운영할 수 있게 도와줍니다. 간단히 `.sh` 쉘 파일을 실행시키면 됩니다.

* `config.sh` : docker-yobi에 관한 설정 정의
* `build.sh` : docker-yobi 이미지를 생성
* `start.sh` : docker-yobi 컨테이너를 실행
* `stop.sh` : docker-yobi 컨테이너를 중지
* `rm.sh` : docker-yobi 컨테이너를 삭제
* `logs.sh` : docker-yobi의 로그 확인

## 설정

`config.sh` 파일을 열어서 필요한 정보를 수정합니다.
* `YOBI_HOME` : 내 컴퓨터에 있는 **Yobi 홈 디렉토리**를 경로를 입력합니다. 기본 값은 현재 디렉톨리 안에 `yobi` 디렉토리입니다.
* `DOCKER_YOBI_NAME` : docker-yobi 컨테이너의 **이름**을 지정합니다. docker에서 관리하기 위한 이름입니다.
* `DOCKER_YOBI_PORT` : docker-yobi 컨테이너의 외부 **포트번호**입니다. 이 포트번호는 실제 외부에서 접속하는 포트번호로 docker-yobi 컨테이너 내부의 yobi의 포트번호인 9000으로 연결됩니다.

만약 기존의 yobi를 사용하고 있다면 `YOBI_HOME`의 경로를 기존의 프로젝트 경로로 지정합니다. YOBI_HOME의 `conf/`, `yobi.h2.db`, `repo/`, `uploads/` 를 자동으로 읽어 사용하게 됩니다. 새롭게 시작한다면 YOBI_HOME에 지정한 디렉토리 안에 이 디렉토리와 파일들이 생성됩니다.

```
vi config.sh
```
```bash
#!/bin/bash

YOBI_HOME="$(PWD)/yobi"
DOCKER_YOBI_NAME="yobi-0.8.1"
DOCKER_YOBI_PORT="9000"
```

## 빌드

`Dockerfile`에 정의한 docker-yobi 이미지를 생성합니다.

```
sh build.sh
```

## 시작

`config.sh`에 정의한 docker-yobi 컨테이너를 실행합니다.

```
sh start.sh
```

## 중지

`config.sh`에 정의한 docker-yobi 컨테이너를 중지합니다.

```
sh stop.sh
```

## 삭제

`config.sh`에 정의한 docker-yobi 컨테이너를 삭제합니다.

```
sh rm.sh
```

## 기부하기

> 기부금은 연구활동과 블로그 운영에 사용됩니다.

기부방법은 [PayPal](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=NR99D2BERKK8Y&lc=KR&item_name=donate%2esaltfactory%2enet&item_number=net%2esaltfactory%2edonate&currency_code=USD&bn=PP%2dDonationsBF%3abtn_donateCC_LG%2egif%3aNonHosted)을 이용하는 방법이 있습니다.

[![paypal button](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=NR99D2BERKK8Y&lc=KR&item_name=donate%2esaltfactory%2enet&item_number=net%2esaltfactory%2edonate&currency_code=USD&bn=PP%2dDonationsBF%3abtn_donateCC_LG%2egif%3aNonHosted)


The MIT License (MIT)

Copyright (c) 2014 SungKwang Song

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
