# docker-yona

![License](https://img.shields.io/github/license/mashape/apistatus.svg)
[![Build Status](https://travis-ci.org/pokev25/docker-yona.svg)](https://travis-ci.org/pokev25/docker-yona)


**docker-yona**는 **git** 기반 협업 프레임워크 [Yona](http://yona.io)를 사용하기 편리하게 docker 컨테이너로 만든 컨테이너 이미지 입니다.


## 변경점
yona로 이전하기 위하여 위하여 fork버전을 수정함

- src에서 빌드 부분을 제거
- 1.* 버전으로 이전하기 위하여 yona프로젝트의 data-export 바이너리로 빌드함
 - data-export브랜치


## 간단 사용방법

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

상세 사용법은 wiki 참조

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
