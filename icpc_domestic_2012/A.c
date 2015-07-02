#include <stdio.h>

int get_month_days(int year, int month) {
  if (year % 3 == 0) {
    return 20;
  } else {
    return month % 2 == 0 ? 19 : 20;
  }
}

/* 1年1月1日からの日数を取得する */
int get_days(int year, int month, int day) {
  int nday = 0, y, m, d;
  
  for (y = 1; y <= year; y++) {
    for (m = 1; m <= 10; m++) {
      d = get_month_days(y, m);
      if (year == y && month == m) {
        nday += day;
        break;
      } else {
        nday += d;
      }
    }
  }

  return nday;
}

int main(void) {
  int n, y, m, d, mdays, birth;

  mdays = get_days(1000, 1, 1);
  scanf("%d", &n);
  
  while (n > 0) {
    scanf("%d %d %d", &y, &m, &d);
    birth = get_days(y, m, d);
    printf("%d\n", mdays - birth);
    
    n--;
  }
  
  return 0;
}
