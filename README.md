docker-yobi
===========

Run yobi on docker

docker-yobi는 docker에서 [Yobi](http://yobi.io)를 운영하기 위한 dockerfile 입니다.
docker-yobi는 로컬에 있는 yobi 디렉토리를 **mount**하여 사용합니다. 즉, docker-yobi를 실행할 때 docker 이미지에 내 로컬 PC에 있는 yobi 디렉토리를 그대로 사용할 수 있습니다.


docker-yobi 사용방법
==================

먼저 github에서 yobi를 `clone`합니다. 설치 예제를 설명하기 위해서 yobi를 `clone` 받은 경로는 `/Users/saltfactory/yobi`라고 가정합니다.

```
git clone https://github.com/naver/yobi.git
```

docker나 boot2docker를 시작한 후 `build`를 합니다.

```
docker build -t saltfactory/yobi .
```

docker-yobi의 `run-yobi.sh`를 실행합니다. 이때, 로컬에 `clone`한 yobi의 디렉토리를 지정합니다. 설치 예제로 `clone` 받은 경로는 `/Users/saltfactory/yobi`라고 가정합니다.

```
sh run-yobi.sh /Users/saltfactory/yobi
```

docker-yobi가 정상적으로 실행되고 있는지 확인하기 위해서 `docker ps` 명령어로 확인합니다.

```
docker ps
```
정상적으로 실행이되면 docker ps 목록에 yobi가 보입니다. docker-yobi가 정상적으로 실행되면 [play](https://www.playframework.com/)가 실행되면서 필요한 패키지를 다운받고 컴파일합니다. 만약 설치되는 로그를 보고 싶을 경우는 `docker logs` 명령어로 확인할 수 있습니다.

```
docker logs yobi
```

play가 정상적으로 시작이되고 난 다음 브라우저에서 확인합니다.

```
http://localhost:9000
```

docker-yobi 활용방법
==================

docker-yobi는 yobi를 사용하는데 필요한 이미지와 컨테이너를 만들게 됩니다. 한번 만들어진 컨테이너를 재사용하면 play가 시작하면서 다운받고 컴파일한 패키지를 다시 다운받고 컴파일하지 않기 때문에 yobi 시작 시간을 줄일 수 있습니다. 새롭게 `docker build`를 하지 않는 이상 빠르게 yobi를 실행할 수 있습니다.

docker에 커네이너로 만들어진 yobi를 정지하기 위해서는 `docker stop` 명령어를 사용합니다.

```
docker stop yobi
```

다시 yobi 컨테이너를 실행하고 싶을 경우 `run-yobi.sh`를 명령어를 사용합니다.

```
sh run-yobi.sh /Users/saltfactory/yobi
```

다른 서버에서 docker-yobi 사용하여 이전하기
===================================

docker 환경을 갖춘 모든 리눅스 서버에서 docker-yobi를 사용하여 이전에 사용하던 yobi를 그대로 사용할 수 있습니다.
만약 yobi를 다른 서버로 이전할 경우, docker-yobi를 설치하고 로컬 PC에 저장된 yobi 디렉토리만 복사해서 이전하는 서버에 복사하여 `run-yobi.sh`를 할 때 이전한 서버에 복사한 yobi 경로를 지정하여 사용하면 됩니다.


Mac OS X에서 boot2docker를 사용할 경우
==================================

docker는 리눅스 환경에서 사용하지만 Mac OS X에서 [boot2docker](http://docs.docker.com/installation/mac/)를 사용하여 docker-yobi를 사용할 수 있습니다.
boot2docker 설치방법은 http://docs.docker.com/installation/mac/ 문서를 참조하세요.

boot2docker를 사용하기 위해서는 [VirtualBox](https://www.virtualbox.org)에서 forwarding port를 하기 위해서 docker-yobi 안에 있는 'boot2dockr-ports.sh'를 실행합니다.

```
sh boot2docker-ports.sh
```

boot2docker에서 로컬 PC에 있는 디렉토리를 마운트하기 위해서 VirtualBox에서 shared directory를 지정해야 합니다.

다음 사이트에 자세한 방법이 나와 있습니다.

  1. https://medium.com/boot2docker-lightweight-linux-for-docker/boot2docker-together-with-virtualbox-guest-additions-da1e3ab2465c
  2. http://viget.com/extend/how-to-use-docker-on-os-x-the-missing-guide

```
boot2docker down
```

```
curl http://static.dockerfiles.io/boot2docker-v1.2.0-virtualbox-guest-additions-v4.3.14.iso > ~/.boot2docker/boot2docker.iso
```

```
VBoxManage sharedfolder add boot2docker-vm -name home -hostpath /Users
```

```
boot2docker up
```
