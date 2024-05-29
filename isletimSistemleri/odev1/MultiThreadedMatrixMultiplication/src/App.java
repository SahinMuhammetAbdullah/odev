import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

public class App {
    private static int ROWS_A;
    private static int COLS_A;
    private static int ROWS_B;
    private static int COLS_B;
    private static int NTHREAD;
    private static int MAX_RANDOM_NUMBER_RANGE;
    private static String FILE_NAME = "random_numbers.txt";
    private static String FILE_PATH = "random_numbers.txt";

    public static void main(String[] args) throws InterruptedException {

        if (args.length != 5) {
            System.err.println(
                    "Kullanım şekli: java App <satır_MatrisA> <sütun_MatrisA> <satır_MatrisB> <sütun_MatrisB> <maksimum_sayı_aralığı_tamsayı>");
            System.exit(1);
        }

        long startTime = System.nanoTime();

        ROWS_A = Integer.parseInt(args[0]);
        COLS_A = Integer.parseInt(args[1]);
        ROWS_B = Integer.parseInt(args[2]);
        COLS_B = Integer.parseInt(args[3]);

        MAX_RANDOM_NUMBER_RANGE = Integer.parseInt(args[4]);

        NTHREAD = Math.max(ROWS_A, COLS_B);

        if (COLS_A != ROWS_B) {
            System.err.println(
                    "Oluşturmak istediğiniz ilk matrisin sütün ile ikinci matrisin satırı uyuşmamakta! \nYeniden deneyiniz.");
            System.exit(1);
        }

        int[][] matrixA = new int[ROWS_A][COLS_A];
        int[][] matrixB = new int[ROWS_B][COLS_B];

        Random random = new Random();

        for (int i = 0; i < matrixA.length; i++) {
            for (int j = 0; j < matrixA[i].length; j++) {
                matrixA[i][j] = random.nextInt(MAX_RANDOM_NUMBER_RANGE);
            }
        }

        for (int i = 0; i < matrixB.length; i++) {
            for (int j = 0; j < matrixB[i].length; j++) {
                matrixB[i][j] = random.nextInt(MAX_RANDOM_NUMBER_RANGE);
            }
        }

        writeMatrixToFile(matrixA, matrixB, FILE_NAME);

        MatrixOperations matrixOps = new MatrixOperations(ROWS_A, ROWS_B, COLS_A, COLS_B);

        matrixOps.readMatricesFromFile(FILE_PATH);

        ExecutorService executor = Executors.newFixedThreadPool(NTHREAD);

        long[] threadTimes = new long[NTHREAD];

        int chunkSize = (Math.max(ROWS_A, COLS_B) + NTHREAD - 1) / NTHREAD;

        for (int i = 0; i < NTHREAD; i++) {
            int start = i * chunkSize;
            int end = Math.min(start + chunkSize, Math.max(ROWS_A, COLS_B));
            int threadIndex = i;
            executor.execute(() -> {
                long threadStartTime = System.nanoTime();
                if (ROWS_A >= COLS_B) {
                    for (int row = start; row < end; row++) {
                        matrixOps.multiplyMatricesByRow(row);
                    }
                } else {
                    for (int col = start; col < end; col++) {
                        matrixOps.multiplyMatricesByColumn(col);
                    }
                }
                long threadEndTime = System.nanoTime();
                threadTimes[threadIndex] = threadEndTime - threadStartTime;
            });
        }
        executor.shutdown();
        executor.awaitTermination(1, TimeUnit.MINUTES);

        long endTime = System.nanoTime();

        int[][] resultMatrix = matrixOps.getResultMatrix();

        long processTime = endTime - startTime;
        System.out.println("\nMatris A:");
        matrixOps.printMatrix(matrixA);
        System.out.println("\nMatris B:");
        matrixOps.printMatrix(matrixB);
        System.out.println("\nSonuç Matris:");
        matrixOps.printMatrix(resultMatrix);

        System.out.println("----------------------------------------");
        System.out.println("Toplam işlem süresi: " + processTime + " nanosaniye");
        System.out.println("----------------------------------------");

        for (int i = 0; i < NTHREAD; i++) {
            System.out.println("Thread " + i + " yürütme süresi: " + threadTimes[i] + " nanosaniye");
        }
        long tSum = 0;
        for (int i = 0; i < NTHREAD; i++) {
            tSum += threadTimes[i];
        }
        System.out.println("\nToplam thread yürütme süresi: " + tSum + " nanosaniye\n");
    }

    private static void writeMatrixToFile(int[][] matrixA, int[][] matrixB, String fileName)
            throws InterruptedException {
        try (PrintWriter writer = new PrintWriter(new FileWriter(fileName))) {

            for (int[] row : matrixA) {
                for (int num : row) {
                    writer.print(num + " ");
                }
                writer.println();
            }
            writer.println();
            for (int[] row : matrixB) {
                for (int num : row) {
                    writer.print(num + " ");
                }
                writer.println();
            }
            System.out.println("Matrislerin yazıldığı dosya " + fileName);
        } catch (IOException e) {
            System.err.println("Dosya yazma hatası: " + e.getMessage());
        }
    }
}
