import java.util.Scanner;
 
public class Haos_Triangle {
    public static void main(String[] args) {
        Scanner scn = new Scanner(System.in);
        int N = scn.nextInt();
        int rows = 2;
        int[] row;
        int[] prevRow = { scn.nextInt() };
        int i = 0;
 
        while (rows <= N) {
            row = new int[prevRow.length + 1];
 
            while (i < prevRow.length + 1) {
                row[i] = scn.nextInt();
                int prevRIndex = i - 1;
                int prevLIndex = i;
                int right;
                int left;
 
                if (prevRIndex == -1) {
                    right = 0;
                } else {
                    right = prevRow[prevRIndex];
                }
 
                if (prevLIndex >= prevRow.length) {
                    left = 0;
                } else {
                    left = prevRow[prevLIndex];
                }
 
                if (row[i] != right + left) {
                    System.out.println(rows);
                    scn.close();
 
                    return;
                }
 
                i++;
            }
 
            i = 0;
            rows++;
            prevRow = row;
        }
 
        System.out.println(0);
        scn.close();
    }
}
