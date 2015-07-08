# Change Log
All notable changes to this project will be documented in this file.

## [[0.8.2]](https://github.com/saltfactory/docker-yobi/releases/tag/0.8.2) - 2015-07-08

### Features

- [yobi 0.8.2](https://github.com/naver/yobi/releases/tag/v0.8.2) 적용

### Changed
- 기존의 shell 파일을 **shell/yobi.sh**로 통합
- source 빌드를 위한 **Dockerfile-yobi-sources** 삭제, **bootstrap.sh**에서 통합
- **start.sh** 에 있었던 `docker start`, `docker restart` 명령어 기능 분리
- README 내용 수정

### Added
- [travis-cli](https://travis-ci.org/saltfactory/docker-yobi) 테스트 추가

## [[0.8.1]](https://github.com/saltfactory/docker-yobi/releases/tag/0.8.1) - 2015-06-24

### Features
- yobi 0.8.1 적용
- 호스트에서 YOBI_HOME 디렉토리 공유
- 간단한 shell 파일로 docker-yobi 관리
- Yobi 풀패키지, 소스설치 두가지 빌드 지원

### Changed
- **ubuntu:14.04** 이미지에서 **debian:jessie** 이미지로 변경
- Java 7에서 Java 8 업데이트
- [v0.7](https://github.com/saltfactory/docker-yobi/releases/tag/v0.7)에서 사용하던 shell 파일들 삭제
- README.md 파일 수정

### Added
- `config.sh` docker-yobi 설정파일 추가
- 명령어 shell 파일 추가 (`start.sh`, `stop.sh`, `rm.sh`, `logs.sh`, `exec.sh`)
- `CHANGELOG` 파일 추가
- `Dockerfile-yobi-sources` Yobi 소스버전 설치 도커파일
