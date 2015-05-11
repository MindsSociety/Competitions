import java.util.Scanner;
 
public class Digging_through {
    public static void main(String[] args) {
        Scanner scn = new Scanner(System.in);
        int N = scn.nextInt();
        int[][] matrix = new int[N][N];
 
        for (int i = 0; i < N; i++) {
            for (int j = 0; j < N; j++) {
                matrix[i][j] = scn.nextInt();
            }
        }
 
        scn.close();
        System.out.println(minPath(matrix));
    }
 
    private static int minPath(int[][] matrix) {
        int[][] D = new int[matrix.length][matrix[0].length];
 
        for (int i = 0; i < D.length; i++) {
            for (int j = 0; j < D[0].length; j++) {
                D[i][j] = matrix[i][j];
            }
        }
 
        for (int i = 1; i < matrix[0].length; i++) {
            for (int j = 0; j < matrix.length; j++) {
                D[j][i] += D[j][i - 1];
            }
 
            for (int j = 1; j < matrix.length; j++) {
                if (D[j - 1][i] + matrix[j][i] < D[j][i]) {
                    D[j][i] = D[j - 1][i] + matrix[j][i];
                }
            }
 
            for (int j = matrix.length - 2; j >= 0; j--) {
                if (D[j + 1][i] + matrix[j][i] < D[j][i]) {
                    D[j][i] = D[j + 1][i] + matrix[j][i];
                }
            }
        }
 
        int min = D[0][D[0].length - 1];
 
        for (int i = 1; i < matrix[0].length; i++) {
            if (min > D[i][D[i].length - 1]) {
                min = D[i][D[i].length - 1];
            }
        }
 
        return min;
    }
}
