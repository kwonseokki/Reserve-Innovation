# 같이가예비

### 예비군들의 훈련소 교통편 문제를 해결하기 위해서 주변의 예비군을 매칭부터 정산까지 도와주는 앱
- 진행 기간: 2025.11.05-2025.12.11
- 사용 기술&프레임워크: SwiftUI, MultipeerConnectivity(매칭 기능), SwiftData
- 국방부 예비전력혁신 서비스 공모전 참여

## 기획배경
예비군을 갈 때마다 훈련장이 외진 곳에 위치해있어서 아침 일찍 나가지 않으면 셔틀버스를 탑승하기 힘들고 셔틀버스 운영 여부도 일정하지 않아서 훈련날마다 큰 부담감을 느꼈습니다.
또한 퇴소 시에도 차가 없는 일부 예비군들은 도보로 이동하는 것을 보고 나서 훈련장 이동 과정에서 발생하는 종합적인 문제를 해결할 수 있는 서비스의 필요성을 느끼게 되었습니다.

또한 예비군 개인뿐만 아니라 훈련소 또한 인원 관리와 이동 통제에 추가적인 행정 인력 비용이 발생하고 있음을 확인하였습니다.
이러한 이동문제를 해결하기 위해 간단하고 편리한 매칭기능으로 예비군 간의 동승 및 정산을 자동화하여 이동 효율을 개선하고 훈련소의 관리 부담을 줄이는 방향으로 서비스를 구상했습니다.

## 앱 스크린샷
# 스크린샷

| | | |
|---:|:---:|:---|
| <img src="https://github.com/user-attachments/assets/3b2542b2-0e4f-4a62-8fd5-bf3453f3fd61" alt="메인화면" width="300"/><br>홈 화면 | <img src="https://github.com/user-attachments/assets/2aaf5566-a096-4c48-a3d8-2d9a5b7ba77a" alt="지도뷰" width="300"/><br>지도뷰 | <img src="https://github.com/user-attachments/assets/1c2f803d-d738-4250-bbc8-4f96ef789a49" alt="장소검색" width="300"/><br>장소 검색 |
| <img src="https://github.com/user-attachments/assets/6ea66a69-888e-49fe-b6ce-1396340e654a" alt="매칭뷰" width="300"/><br>예비군 매칭 | <img src="https://github.com/user-attachments/assets/f8cf884c-5deb-404c-a288-73e7b4947561" alt="그룹뷰" width="300"/><br>그룹뷰 | <img src="https://github.com/user-attachments/assets/e5e8e11f-a6e2-4706-9450-7a72a09479df" alt="결제완료" width="300"/><br>결제 완료 |
| <img src="https://github.com/user-attachments/assets/016f8c6e-2f4a-4bdd-9053-1817c9492f09" alt="결제요청" width="300"/><br>결제요청 | <img src="https://github.com/user-attachments/assets/bc0976ee-23ed-4867-a299-46039ca9ea00" alt="정산내역" width="300"/><br>정산 내역 | <img src="https://github.com/user-attachments/assets/b20d2a32-4bae-4894-8b88-c30e5293a296" alt="마이페이지" width="300"/><br>마이페이지 |

## 주요 기능

### 1) 간편한 예비군 매칭
- 사용자가 목적지를 설정하고 '매칭하기'를 누르면 Bluetooth 통신을 활용해 주변 예비군을 자동으로 탐색하고 연결해줍니다.
- 훈련 당일의 사용 환경을 고려하여 복잡한 로그인이나 인증없이 빠르고 직관적인 UI/UX를 설계하였습니다

### 2) 자동 정산 요청
- 이동이 완료된 후 대표 결제자가 정산을 누르면 교통 요금과 결제자 정보가 자동으로 매칭된 예비군들에게 전송됩니다.
- 정산 요청을 받은 예비군은 계좌번호를 복사하여 토스나 카카오뱅크같은 앱으로 결제를 진행합니다.

### 3) 정산 내역 관리
- 정산내역 탭에서 출발지, 도착지, 결제정보를 한눈에 확인할 수 있습니다.
- 미정산 내역이 있는경웅 알림을 통해서 결제를 유도합니다.

## 트러블슈팅
오프라인 지도 띄우기
