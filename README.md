## viceversa_assignment

## 실행
```sh
flutter pub get
dart run build_runner build --delete-conflicting-outputs /// freezed 모델 빌드
flutter run
```

## 데모
![Simulator Screen Recording - iPhone 14 Pro Max - 2023-07-09 at 16 18 30](https://github.com/nain93/viceversa-assignment/assets/73378472/00746fcb-0e22-419f-b206-13ac4e04b64a)

## 구현 기술
- 그리드 이미지 뷰 리스트 구현
- 페이지네이션 구현
- 상세화면, 이미지 확대 축소 구현


## 사용 모듈
| 모듈명                  |   사용 이유                                                                                                        |
| :-------------------- | :----------------------------------------------------------------------------------------------------------------- |
| dio      |   api 통신을 편하게 하기 위해서 사용
| freezed, json_serializable, build_runner, freezed_annotation, json_annotation |   모델 클래스를 쉽게 관리하기 위해서 사용
