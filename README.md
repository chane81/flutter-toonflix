# toonflix

- Flutter webtoon 앱

## versions

- flutter: 3.10.1
- dart: 3.0.2

## settings

```bash
# 3.3.10 버전 사용
$ fvm use 3.10.1 --force

# create
$ fvm flutter create .

# pub get
$ fvm flutter pub get
```

## package

```bash
# http 패칭
$ fvm flutter pub add http
```

## code check

```bash
# 문법 및 에러 체크
$ dart analyze
$ dart fix --dry-run
# or
$ dart fix --apply
```
