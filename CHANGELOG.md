# Change Log
All notable changes to this project will be documented in this file.

## [[0.8.1]](https://github.com/saltfactory/docker-yobi/releases/tag/0.8.1) - 2015-06-24

### Features
- yobi 0.8.1 적용
- 호스트에서 YOBI_HOME 디렉토리 공유
- 간단한 shell 파일로 docker-yobi 관리

### Changed
- **ubuntu:14.04** 이미지에서 **debian:jessie** 이미지로 변경
- Java 7에서 Java 8 업데이트
- [v0.7](https://github.com/saltfactory/docker-yobi/releases/tag/v0.7)에서 사용하던 shell 파일들 삭제

### Added
- `config.sh` docker-yobi 설정파일 추가
- 명령어 shell 파일 추가 (`start.sh`, `stop.sh`, `rm.sh`, `logs.sh`)
- `CHANGELOG` 파일 추가
