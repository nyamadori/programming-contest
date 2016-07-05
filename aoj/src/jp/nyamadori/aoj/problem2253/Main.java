package jp.nyamadori.aoj.problem2253;

import java.util.LinkedList;
import java.util.Queue;
import java.util.Scanner;

class Walker {
	int[][] map;
	int maxTurn, nTile;

	public Walker(int[][] map, int turn) {
		this.map = map;
		this.maxTurn = turn;
		this.nTile = 0;
	}

	public boolean canWalk(int x, int y) {
		return (x >= 0 && x <= 60 && y >= 0 && y <= 60) && map[y][x] == 0;
	}

	public void walk(int x, int y, Queue<Integer[]> queue) {
		queue.offer(new Integer[] { 0, x, y });

		while (true) {
			Integer[] args = queue.poll();
			if (args == null)
				break;

			int t = args[0];
			int cx = args[1];
			int cy = args[2];

			nTile++;
			map[cy][cx] = 1;

			int[][] dirs = { { 0, 1 }, { 1, 1 }, { 1, 0 }, { 0, -1 }, { -1, -1 }, { -1, 0 } };
			// printMap();

			for (int[] dir : dirs) {
				int nx = cx + dir[0];
				int ny = cy + dir[1];

				if (canWalk(nx, ny)) {
					map[ny][nx] = 1;
					if (t < maxTurn)
						queue.offer(new Integer[] { t + 1, nx, ny });
				}
			}

		}
	}

	public void printMap() {
		printMap(5, 5);
	}

	public void printMap(int w, int h) {
		System.out.println();
		for (int y = -h; y <= h; y++) {
			int i = 60 - (y + 30);
			for (int k = 0; k < y + h; k++)
				System.out.print(" ");

			for (int x = -w; x <= w; x++) {
				int j = x + 30;
				System.out.printf("%2d", new Object[] { map[i][j] });
			}

			System.out.println();
		}
	}
}

class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		while (true) {
			int t = sc.nextInt();
			int n = sc.nextInt();

			if (t == 0 && n == 0)
				break;

			int[][] map = new int[61][61];

			for (; n > 0; n--) {
				int x = sc.nextInt() + 30;
				int y = sc.nextInt() + 30;
				map[y][x] = 2;
			}

			int sx = sc.nextInt() + 30;
			int sy = sc.nextInt() + 30;

			Walker w = new Walker(map, t);
			w.walk(sx, sy, new LinkedList<Integer[]>());
			System.out.println(w.nTile);
		}

		sc.close();
	}
}