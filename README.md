# docker-yona

![License](https://img.shields.io/github/license/mashape/apistatus.svg)
[![Latest release](https://img.shields.io/badge/release-v0.8.2-ff69b4.svg)](https://github.com/saltfactory/docker-yona/releases)
[![Build Status](https://travis-ci.org/saltfactory/docker-yona.svg)](https://travis-ci.org/saltfactory/docker-yona)


**docker-yona**는 **git** 기반 협업 프레임워크 [Yona](http://yona.io)를 사용하기 편리하게 docker 컨테이너로 만든 컨테이너 이미지 입니다.


## 변경점
yona로 이전하기 위하여 위하여 fork버전을 수정함

- src에서 빌드 부분을 삭제
- 1.* 버전으로 이전하기 위하여 yona프로젝트의 data-export 바이너리로 빌드함
 - data-export브랜치


## 사용방법

**docker-yona**는 복잡한 설정 없이 현재 운영하고 있는 **yona** 프로젝트를 바로 최신 yona 서비스로 운영할 수 있게 도와줍니다.
간단히 **shell/yona.sh** 쉘 파일을 실행시키면 됩니다.

- **shell/yona.sh build** : yona 0.8.2 풀 패키지 버전을 빌드합니다.
- **shell/yona.sh init** : 빌드한 docker 이미지를 컨테이너로 초기 실행합니다.
- **shell/yona.sh start** : 컨테이너가 존재하면 존재하는 컨테이너를 실행합니다.
- **shell/yona.sh restart** : 컨테이너를 재시작합니다.
- **shell/yona.sh stop** : 커네티너를 중지합니다.
- **shell/yona.sh rm** : 컨테이너를 삭제합니다.
- **shell/yona.sh log** : 컨테이너의 로그를 출력합니다.
- **shell/yona.sh exec** : 운영중인 컨테이너 내부에 **bash** 쉘로 들어가게 됩니다.

쉘 파일은 다음과 같이 **+x** 권한을 추가해 명령어를 간단하게 만들 수 있습니다.

```
chmod +x shell/yona.sh
```
```
./shell/yona start
```

[alias](http://www.linfo.org/alias.html)를 사용하면 더욱 간단하게 만들 수 있습니다. **~/.bash_profile**을 열어서 다음을 추가합니다.

```
alias yona="bash {docker-yona홈}/shell/yona.sh"
```

터미널을 재 시작하거나 **source ~/.bash_profile**을 합니다. 이후에 다음과 같이 **yona** 를 사용하여 간단하게 실행할 수 있습니다.

```
yona start
```


## 설정

`config.sh` 파일을 열어서 필요한 정보를 수정합니다.

만약 기존의 yona를 사용하고 있다면 `yona_HOME`의 경로를 기존의 프로젝트 경로로 지정합니다.
yona_HOME의 `conf/`, `yona.h2.db`, `repo/`, `uploads/` 를 자동으로 읽어 사용하게 됩니다.
새롭게 시작한다면 yona_HOME에 지정한 디렉토리 안에 이 디렉토리와 파일들이 생성됩니다.

```
vi config.sh
```
```bash
#!/bin/bash

############################################################
## docker project name
PROJECT_NAME="docker-yona"
############################################################
## docker configurations
DOCKER_USER="saltfactory"
DOCKER_VERSION="0.8.2"
DOCKER_NAME="yona"
DOCKER_IMAGE="$DOCKER_USER/$DOCKER_NAME:$DOCKER_VERSION"
############################################################
## container configurations
DOCKER_CONTAINER_NAME="demo-yona"
DOCKER_CONTAINER_PORT="7001"
############################################################
## container volumes, if you want to install full package, you must remove yona_SOURCE.
#yona_SOURCE="/Users/saltfactory/shared/yona-0.8.2"
yona_HOME="/Users/saltfactory/shared/yona-0.8.2"
yona_OPT="-Xmx1024m -Xms1024m"
############################################################
```

## 이미지 생성 빌드

### 1. 풀 패키지 이미지 생성

**shell/config.sh** 에서 정의한 풀 패키지 이미지를 생성하기 위해 **build** 옵션을 사용합니다.
한가지 중요하게 중의해야할 것은 만약 **풀 패키지**로 설치를 하려면

> 반드시 **shell/config.sh** 파일의 `yona_SOURCE` 변수를 삭제하고 실행합니다.

```
bash shell/yona.sh build
```
```
./shell/yona build
```
```
yona build
```

## 컨테이너 실행

### 1. 컨테이너 초기 실행
**shell/config.sh** 에서 정의한 컨테이너를 초기 실행하기 위해 **init** 옵션을 사용합니다.

```
bash shell/yona.sh init
```
```
./shell/yona init
```
```
yona init
```

### 2. 컨테이너 실행
컨테이너가 실행했던 적이 있다면 캐시에 있는 정보를 불러와 빠르게 다시 시작하기 위해 **start** 옵션을 사용합니다.

```
bash shell/yona.sh start
```
```
./shell/yona start
```
```
yona start
```

### 3. 컨테이너 재실행
컨테이너가 실행되고 있을 때 컨테이너를 다시 실행하기 위해 **restart** 옵션을 사용합니다.

```
bash shell/yona.sh restart
```
```
./shell/yona restart
```
```
yona restart
```

## 컨테이너 중지

컨테이너가 실행되고 있을 때 컨테이너를 중지하기 위해 **stop** 옵션을 사용합니다.

```
bash shell/yona.sh stop
```
```
./shell/yona.sh stop
```
```
yona stop
```

## 컨테이너 삭제

캐시에 있는 컨테이너를 모두 삭제하기 위해 **rm** 옵션을 사용합니다.

```
bash shell/yona.sh rm
```
```
./shell/yona rm
```
```
yona rm
```

## 컨테이너 내부 접속
컨테이너가 실행되고 있을 때 컨테이너에 접속하기 위해 **exec** 옵션을 사용합니다. 컨테이너 내부에 bash 쉘로 들어가게 됩니다.

```
bash shell/yona.sh exec
```
```
./shell/yona exec
```
```
yona exec
```

## 컨테이너 로그 출력
컨테이너의 로그를 확인하기 위해서 **log** 옵션을 사용합니다.

```
bash shell/yona.sh log
```
```
./shell/yona log
```
```
yona log
```

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
