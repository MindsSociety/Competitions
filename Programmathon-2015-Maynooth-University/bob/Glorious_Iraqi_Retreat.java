import java.util.Scanner;
 
public class Glorious_Iraqi_Retreat {
    private static long looted, total;
 
    public static void main(String[] args) {
        Scanner scn = new Scanner(System.in);
        Glorious_Iraqi_Retreat ks = new Glorious_Iraqi_Retreat();
        int C = scn.nextInt();
        int N = scn.nextInt();
        int[] ws = new int[N + 1];
        int[] vs = new int[N + 1];
        total = 0;
 
        for (int i = 1; i <= N; i++) {
            vs[i] = scn.nextInt();
            total += vs[i];
            ws[i] = scn.nextInt();
        }
 
        scn.close();
        ks.knapsack(ws, vs, C, N);
        System.out.println(-1 * (looted - total));
    }
 
    public void knapsack(int[] wt, int[] val, int W, int N) {
        long negativeInfinity = Long.MIN_VALUE;
        long[][] m = new long[N + 1][W + 1];
        long[][] sol = new long[N + 1][W + 1];
 
        for (int i = 1; i <= N; i++) {
            for (int j = 0; j <= W; j++) {
                long m1 = m[i - 1][j];
                long m2 = negativeInfinity;
 
                if (j >= wt[i]) {
                    m2 = m[i - 1][j - wt[i]] + val[i];
                }
 
                m[i][j] = Math.max(m1, m2);
                sol[i][j] = m2 > m1 ? 1 : 0;
            }
        }
 
        long[] selected = new long[N + 1];
 
        for (int n = N, w = W; n > 0; n--) {
            if (sol[n][w] != 0) {
                selected[n] = 1;
                w = w - wt[n];
            } else {
                selected[n] = 0;
            }
        }
 
        looted = 0;
 
        for (int i = 1; i < N + 1; i++) {
            if (selected[i] == 1) {
                looted += val[i];
            }
        }
    }
}
