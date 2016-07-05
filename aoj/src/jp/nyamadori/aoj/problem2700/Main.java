package jp.nyamadori.aoj.problem2700;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Scanner;
import java.util.Set;

public class Main {
	public static String getAbbrName(String name, int k) {
		StringBuilder sb = new StringBuilder();
		sb.append(name.charAt(0));
		String vowels = "aiueo";
		
		for (int i = 0; i < name.length() - 1; i++) {
			char c = name.charAt(i);
			if (sb.length() == k) break;

			if (vowels.indexOf(c) != -1) {
				char nc = name.charAt(i + 1);
				sb.append(nc);
			}
			
		}
		
		return sb.toString();
	}
	
	public static boolean canGiveUniqueName(List<String> names, int k) {
		Set<String> abbrSet = new HashSet<>();

		for (String name : names) {
			String abbr = getAbbrName(name, k);
			if (abbrSet.contains(abbr)) return false;
			abbrSet.add(abbr);
		}
		
		return true;
	}
	
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		while (true) {
			int n = sc.nextInt(); sc.nextLine();
			if (n == 0) break;
			List<String> names = new ArrayList<>();
			
			while (n > 0) {
				String name = sc.nextLine();
				names.add(name);
				n--;
			}
			
			int minK = -1;
			
			for (int k = 1; k <= 50; k++) {
				if (canGiveUniqueName(names, k)) {
					minK = k;
					break;
				}
			}
			
			System.out.println(minK);
		}
		
		sc.close();
	}
}
