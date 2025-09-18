# 2025_SEASONTHON_TEAM_25_FE

<img width="829" height="464" alt="스크린샷 2025-09-18 오후 10 53 47" src="https://github.com/user-attachments/assets/7209dd6c-e9e4-4cca-bb7f-8a003578e917" />

<br><br>

## 프로젝트 소개
금융 학습이 금융 경험으로 확장되는 금융 멀티 시뮬레이션 플랫폼 **"Financial Freedom"** 입니다.

<br><br>

## 주요 기능
- 📖 뉴스 기반 학습 : 매일 경제 뉴스를 읽고 요약 확인

- ❓ 퀴즈 풀이 : 뉴스/경제 상식 기반 퀴즈 풀기

- 🏆 퀘스트 시스템 : 출석/학습 등으로 추가 보상 제공

- 💰 자산 관리 : 리워드 포인트를 모아 금융 상품 체험

- 📊 자산 현황 조회 : 금융 상품 기반 총자산 관리

<br><br>

## 아키텍처 구조
```
lib/
 ┣ core/                       # 공통 테마, 유틸 (디자인 시스템 반영)
 ┃ ┣ theme/                    # 색상, 타이포그래피, 그림자 등
 ┃ ┗ utils/                    # 공용 유틸리티 함수
 ┣ feature/                    # 도메인 단위 기능 모듈
 ┃ ┣ {featureName}/
 ┃ ┃ ┣ data/                   # 데이터 계층
 ┃ ┃ ┃ ┣ datasources/          # 원격/로컬 데이터소스
 ┃ ┃ ┃ ┣ models/               # DTO / Model 정의
 ┃ ┃ ┃ ┗ repository_impl/      # Repository 구현체
 ┃ ┃ ┣ domain/                 # 비즈니스 로직 계층
 ┃ ┃ ┃ ┣ entities/             # Entity 정의
 ┃ ┃ ┃ ┣ repository/           # Repository 인터페이스
 ┃ ┃ ┃ ┗ usecases/             # UseCase 정의
 ┃ ┃ ┗ presentation/            # 프레젠테이션 계층
 ┃ ┃    ┗ provider/            # Riverpod Provider
 ┣ ui/                         # UI 관련 뷰 및 공통 컴포넌트
 ┃ ┣ {PageName}/               # 화면
 ┃ ┣ components/               # 재사용 가능한 UI 컴포넌트
 ┃ ┗ ...
 ┣ gen/                        # 자동 생성된 에셋/리소스 (flutter_gen)

```

<br><br>

## 기술 스택
- Framework: Flutter / Dart

- State Management: Riverpod + Freezed

- Routing: GoRouter

- Codegen: flutter_gen

- Hosting / 배포: Firebase Hosting

<br><br>

## 실행 방법
- flutter 정상 설치 확인 후 레포지토리를 클론합니다.

- 터미널에서 build_runner를 감시 모드로 실행합니다.
```
flutter pub run build_runner watch —delete-conflicting-outputs
```
- 터미널에서 웹으로 빌드합니다.
```
flutter run -d chrome
```
- 웹 또는 다운로드하여 웹앱 환경에서 사용합니다.

<br><br>

## 팀 정보

**2025 SEASONTHON TEAM 25**
- 이연우(기획)
- 장서휘(디자인) [GitHub](https://github.com/oesreen)
- 최영빈(앱/플러터) [GitHub](https://github.com/yb0x00)
- 김기현(서버/백엔드) [GitHub](https://github.com/gihhyeon)
- 노영오(서버/백엔드) [GitHub](https://github.com/NohYeongO)
