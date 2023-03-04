# :star: SCALE PROJECT
 
# :pushpin: Contents
- [개요](#pushpin-개요)

- [팀 소개 및 주요 기능](#pushpin-팀-소개-및-주요-기능)

- [구현 기능](#pushpin-구현-기능)
   - [스타일 조회](#round_pushpin-스타일-조회)
   - [해쉬태그 검색](#round_pushpin-해쉬태그-검색)
   - [스타일 좋아요](#round_pushpin-스타일-좋아요)
   - [스타일 상세 페이지](#round_pushpin-스타일-상세-페이지)
   - [스타일 신고](#round_pushpin-스타일-신고)
   - [개인 프로필 페이지](#round_pushpin-개인-프로필-페이지)
   - [프로필 정보 수정](#round_pushpin-프로필-정보-수정)
   - [스타일 등록](#round_pushpin-스타일-등록)
   - [스타일 수정](#round_pushpin-스타일-수정)
   - [스타일 삭제](#round_pushpin-스타일-삭제)
   - [관리자 - 스타일 전체 조회](#round_pushpin-스타일-전체-조회)
   - [관리자 - 스타일 조건별 검색](#round_pushpin-스타일-조건별-검색)
   - [관리자 - 스타일 다중 삭제](#round_pushpin-스타일-다중-삭제)
   - [관리자 - 스타일 상세 조회 페이지에서 삭제](#round_pushpin-스타일-상세-조회-페이지에서-삭제)
   - [관리자 - 스타일 신고내역 조건별 조회](#round_pushpin-스타일-신고내역-조건별-조회)
   - [관리자 - 스타일 신고 처리](#round_pushpin-스타일-신고-처리)
   - [관리자 - 사용자 차단](#round_pushpin-사용자-차단)
 
# :pushpin: 개요
- 프로젝트명 : scaleProject

- 보고서 : [SCALE_최종보고서.pptx](https://github.com/Munjiring/scaleProject/files/10866915/_SCALE_.pptx)

- 기획 의도
   - 늘어난 중고거래 속 가품사기 방지 필요성 증가
   - 믿을만한 중간역할 중개자의 필요
   - 1대1 거래서비스에서 원하는 가격에 구매
   - 1대1 거래서비스에서 원하는 가격에 판매

- 개발 환경 <br>
![개발환경](https://user-images.githubusercontent.com/115603677/222312056-5a57df47-f954-4ee4-ac5f-00f9adfd4b5c.png)
<br>

- 개발 일정 <br>
<img width="1519" alt="개발일정" src="https://user-images.githubusercontent.com/115603677/222319085-81ffba90-a87a-4ac5-bf7e-9bd3263ef086.png">
<br>

- UseCase Diagram <br>
![유스케이스](https://user-images.githubusercontent.com/115603677/222319150-9b48e852-b490-415e-9a4b-e781b2c35370.jpg)
<br>

- DB 설계(ERD Cloud) <br>
<img width="1436" alt="DB설계" src="https://user-images.githubusercontent.com/115603677/222319330-aa7294e6-5a6c-4b6f-bfdc-e66e254b8dfe.png">
<br>

# :pushpin: 팀 소개 및 주요 기능
![소개1](https://user-images.githubusercontent.com/115603677/222319480-015da03d-2232-4916-8504-dfcd665f6574.png)
![소개2](https://user-images.githubusercontent.com/115603677/222319517-0a5bb64a-efbb-4cc2-a82b-47205938d292.png)
 
# :pushpin: 구현 기능
## [사용자]
### :round_pushpin: 스타일 조회
![스타일조회](https://user-images.githubusercontent.com/115603677/222878672-626eecc0-98b0-4901-add5-30b0ad0f3cf5.gif)
- 인기순 / 최신순으로 검색 가능
- ajax 통신을 이용하여 무한스크롤 페이징 처리
- 가장 많이 사용된 해쉬태그 상위 6개 조회 가능

### :round_pushpin: 해쉬태그 검색
![해쉬태그검색](https://user-images.githubusercontent.com/115603677/222878683-3ca9d1d5-4073-4c8a-9f81-7f3b3e1de5df.gif)
- 해당 검색어가 포함된 해쉬태그를 사용한 게시글들 조회 가능(키워드 검색)
- ajax 통신을 이용하여 무한스크롤 페이징 처리

### :round_pushpin: 스타일 좋아요
![좋아요기능](https://user-images.githubusercontent.com/115603677/222878690-5c7b58c4-bac5-4ef7-8cfd-afa9d3dfa458.gif)
- 로그인 전 하트 클릭 시 로그인 화면으로 이동
- 로그인 후 🤍 클릭 시 좋아요 가능
- ❤ 클릭 시 좋아요 취소
- ajax 중복요청 방지 처리

### :round_pushpin: 스타일 상세 페이지
![상세페이지](https://user-images.githubusercontent.com/115603677/222878701-4d860cb2-1f54-42ca-9ee8-57f4248dd7ea.gif)
- 스타일 조회 페이지에서 사진 클릭 시 해당 스타일의 상세 페이지로 이동
- ajax 통신을 이용하여 무한스크롤 페이징 처리
- 자동으로 스크롤이 해당 스타일로 이동되도록 구현
- 태그된 상품 클릭 시 상품 구매 페이지로 이동

### :round_pushpin: 스타일 신고
![스타일신고](https://user-images.githubusercontent.com/115603677/222878707-02eeeb0b-e388-4527-945d-2a75ccbd8c83.gif)
- 스타일 신고 클릭 시 모달창 생성
- 신고할 아이디는 자동 입력
- 제목과 내용은 필수 입력(입력하지 않을 시 alert)

### :round_pushpin: 개인 프로필 페이지
![개인프로필](https://user-images.githubusercontent.com/115603677/222878722-8325822e-a97f-47cc-bb04-5df34c246722.PNG)
- 본인 프로필 페이지라면 프로필 편집 버튼 있음
- 타인 프로필 페이지라면 프로필 편집 버튼 없음
- 작성한 스타일들이 최신순으로 정렬
- ajax 통신을 이용하여 무한스크롤 페이징 처리

### :round_pushpin: 프로필 정보 수정
![프로필변경](https://user-images.githubusercontent.com/115603677/222878785-ad7f19c1-a618-45a2-bb95-b09a620a876c.gif)
- 프로필 이미지를 원하는 사진으로 변경 가능
- 삭제 버튼 클릭 시 기본 프로필 사진으로 변경
- 닉네임과 소개글 수정 가능

### :round_pushpin: 스타일 등록
![스타일등록](https://user-images.githubusercontent.com/115603677/222878891-cf730c73-dad9-4665-be34-eceea566af2e.gif)
- 대표이미지 첨부 시 왼쪽 div에 썸네일 형식으로 확인 가능
- 사진 첨부는 10장까지 가능
- 상품 태그 검색 기능은 ajax 통신을 이용하여 실시간 검색 구현
- 영어/한글 둘 다 키워드로 검색 가능
- 해쉬태그를 입력하고 엔터 클릭 시 해쉬태그 생성

### :round_pushpin: 스타일 수정
![스타일변경](https://user-images.githubusercontent.com/115603677/222878752-81bb646c-cc76-438f-8432-fb9c5d624e11.gif)
- 기존에 첨부했던 사진, 상품태그, 내용, 해쉬태그 모두 띄워줌

### :round_pushpin: 스타일 삭제
![스타일삭제](https://user-images.githubusercontent.com/115603677/222878757-8270aecd-4ab5-4647-9d4f-0ac4b6051e86.gif)
- 삭제 버튼 클릭 시 alert 띄운 후 목록에서 삭제


## [관리자]
### :round_pushpin: 스타일 전체 조회
![페이징처리](https://user-images.githubusercontent.com/115603677/222880737-2ca770b3-8023-44a2-8d20-4b8a1a8fe15f.gif)
- 스타일 전체조회 페이징 처리

### :round_pushpin: 스타일 조건별 검색
![조건별검색](https://user-images.githubusercontent.com/115603677/222880876-187f2c14-0b0e-4008-a73e-a174d963c0a4.gif)
- 기간 및 닉네임/해쉬태그로 조건별 검색 가능
- 기간은 필수 입력사항 아님
- 닉네임 혹은 해쉬태그는 검색 시 필수 입력사항

### :round_pushpin: 스타일 다중 삭제
![다중삭제](https://user-images.githubusercontent.com/115603677/222880949-90bdfcd0-7089-46f1-be90-da020d2ba807.gif)
- 관리자가 스타일 다중 삭제 가능

### :round_pushpin: 스타일 상세 조회 페이지에서 삭제
![상세페이지삭제](https://user-images.githubusercontent.com/115603677/222880958-15724899-5b31-4927-8d5f-ff3f8ffd8681.gif)
- 상세조회 페이지에서도 해당 스타일 삭제 가능

### :round_pushpin: 스타일 신고내역 조건별 조회
![신고검색](https://user-images.githubusercontent.com/115603677/222881110-8df6db40-a589-4da3-9e12-f9c0c1b22e5d.gif)
- 신고 처리 상태에 따라 검색 가능

### :round_pushpin: 스타일 신고 처리
![신고처리](https://user-images.githubusercontent.com/115603677/222881181-afa29a4a-3227-43c9-8aa2-b13cc324356b.gif)
- 신고 조회 페이지에서 행 클릭 시 해당 신고 상세페이지로 이동
- 상세페이지에서 신고게시글 보기 클릭 시 어떤 게시물인지 확인 가능
- 신고 처리 / 반려 버튼 클릭으로 신고 처리

### :round_pushpin: 사용자 차단
![스타일 차단](https://user-images.githubusercontent.com/115603677/222881353-4a4ffd36-a71c-4dd4-93a8-afd84bcb8c15.gif)
- 세 번 이상 신고처리 당한 회원은 스타일 게시판에 접근 차단
