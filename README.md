# ThreadsClone

## 핵심 키워드
- SwiftUI (iOS 16.0) + MVVM
- Firebase
- Modern Swift Concurrency (async- await)

## 🏭 구조
![D2 (1)](https://github.com/woozoobro/ThreadsClone/assets/99154211/60accfac-ae74-4e76-bdba-59a85e93d39b)

직전에 진행했던 Mandarin 프로젝트에서 MVVM에 대해 제대로 이해하지 못한 채 개발을 했다는 걸 깨닫게 됐습니다.
Mandarin을 리팩토링 하기 전 좋은 구조란 어떤 것인지 고민하기 위해 만든 프로젝트입니다.

### 직전 프로젝트 만다린의 문제점.
![D2 (2)](https://github.com/woozoobro/ThreadsClone/assets/99154211/85d23bd9-c393-4c8b-a9c3-8e24c6abaa8b)

- 기획의 변경과 수정을 즉각적으로 반영할 수 없는 구조
- Single Source Of Truth를 제대로 지키지 못한 UserStore


### 현재의 구조 참고 후 만다린에 적용할 변경 방향
1. 하나의 View는 하나의 ViewModel만이 관리하게 하고, ViewModel에서 사용되는 로직은 Singleton 객체를 통해 처리.

2. User Session 데이터가 필요한 경우 해당 View의 ViewModel이 init되는 시점에 Combine을 사용한 subscribe.

3. @main에서 모든 @StateObject를 init하지 않고, 필요한 경우에만 View가 init되는 시점에 객체가 생성되도록 처리.
