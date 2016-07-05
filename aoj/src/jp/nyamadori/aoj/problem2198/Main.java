package jp.nyamadori.aoj.problem2198;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.Comparator;
import static java.util.Comparator.*;

class Crop {
	String name;
	int p;
	int a;
	int b;
	int c;
	int d;
	int e;
	int f;
	int s;
	int m;
	
	public Crop(String name, int p, int a, int b, int c, int d, int e, int f, int s, int m) {
		this.name = name;
		this.p = p;
		this.a = a;
		this.b = b;
		this.c = c;
		this.d = d;
		this.e = e;
		this.f = f;
		this.s = s;
		this.m = m;	
	}
	
	public double calculateEfficiency() {
		int sales = -p;
		int times = 0;
		
		for (int i = 0; i < m; i++) {
			if (i == 0) {
				times += a + b + c + d + e;
			} else {
				times += d + e;
			}
			
			sales += s * f;
		}
		
		return sales / (double)times;
	}
	
	public String getName() {
		return this.name;
	}
}

public class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		while (true) {
			int n = sc.nextInt(); sc.nextLine();
			if (n == 0) break;
			
			List<Crop> crops = new ArrayList<Crop>();
			
			while (n > 0) {
				String line = sc.nextLine();
				String[] inputs = line.split(" ");
				String l = inputs[0];
				int p = Integer.parseInt(inputs[1]);
				int a = Integer.parseInt(inputs[2]);
				int b = Integer.parseInt(inputs[3]);
				int c = Integer.parseInt(inputs[4]);
				int d = Integer.parseInt(inputs[5]);
				int e = Integer.parseInt(inputs[6]);
				int f = Integer.parseInt(inputs[7]);
				int s = Integer.parseInt(inputs[8]);
				int m = Integer.parseInt(inputs[9]);

				crops.add(new Crop(l, p, a, b, c, d, e, f, s, m));
				n--;
			}
			
			crops.sort(comparing(Crop::calculateEfficiency, reverseOrder()).thenComparing(Crop::getName));
			crops.forEach((c) -> System.out.println(c.getName()));
			System.out.println("#");
		}
		
		sc.close();
	}
}
