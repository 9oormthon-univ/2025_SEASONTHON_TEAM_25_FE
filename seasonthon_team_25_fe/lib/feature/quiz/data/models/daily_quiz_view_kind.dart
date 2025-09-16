enum DailyQuizViewKind {
  firstVisitToday, // 1) 오늘 처음 접속해서 퀴즈를 푸는 경우
  resumeInProgress, // 2) 퀴즈를 다 안풀고 나간 경우 (재방문)
  hasWrong, // 3) 퀴즈가 5개 이하로 남았거나(오답 포함)
  completed, // 4) 퀴즈 다 푼 경우
}
