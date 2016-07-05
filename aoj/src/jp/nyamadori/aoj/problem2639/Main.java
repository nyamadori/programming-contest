package jp.nyamadori.aoj.problem2639;
import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);		
		int a = sc.nextInt();
		int b = sc.nextInt();
		int c = sc.nextInt();
		int t = 0;

		while (t < Integer.MAX_VALUE - 120) {
			int w1 = t;
			int w2 = t + a;
			int r = t / 60;
			int arrive = 60 * r + c;

			if (w1 <= arrive && arrive <= w2) {
				System.out.println(arrive);
				return;
			}

			t += a + b;
		}
		
		System.out.println(-1);
	}
}
