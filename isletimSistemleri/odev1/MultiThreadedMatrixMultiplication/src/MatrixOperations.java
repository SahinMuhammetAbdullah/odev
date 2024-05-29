import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class MatrixOperations {
    private final int[][] matrixA;
    private final int[][] matrixB;
    private final int[][] resultMatrix;
    private final int rowsA;
    private final int rowsB;
    private final int colsA;
    private final int colsB;

    public MatrixOperations(int rowsA, int rowsB, int colsA, int colsB) {
        this.rowsA = rowsA;
        this.rowsB = rowsB;
        this.colsA = colsA;
        this.colsB = colsB;
        this.matrixA = new int[rowsA][colsA];
        this.matrixB = new int[rowsB][colsB];
        this.resultMatrix = new int[rowsA][colsB];
    }

    public void readMatricesFromFile(String filePath) {
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            readMatrix(matrixA, reader);
            readMatrix(matrixB, reader);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void readMatrix(int[][] matrix, BufferedReader reader) throws IOException {
        String line;
        for (int i = 0; i < matrix.length; i++) {
            line = reader.readLine();
            String[] elements = line.trim().split(" ");
            for (int j = 0; j < elements.length; j++) {
                matrix[i][j] = Integer.parseInt(elements[j]);
            }
        }

        reader.readLine();
    }

    
    public void multiplyMatricesByColumn(int col) {
        for (int i = 0; i < rowsA; i++) {
            int sum = 0;
            for (int k = 0; k < colsA; k++) {
                sum += matrixA[i][k] * matrixB[k][col];
            }
            resultMatrix[i][col] = sum;
        }
    }

    public void multiplyMatricesByRow(int row) {
        for (int j = 0; j < colsB; j++) {
            int sum = 0;
            for (int k = 0; k < colsA; k++) {
                sum += matrixA[row][k] * matrixB[k][j];
            }
            resultMatrix[row][j] = sum;
        }
    }

    public int[][] getResultMatrix() {
        return resultMatrix;
    }

    public int[][] getMatrixA() {
        return matrixA;
    }

    public int[][] getMatrixB() {
        return matrixB;
    }

    public void printMatrix(int[][] matrix) {
        for (int[] row : matrix) {
            for (int element : row) {
                System.out.print(element + " ");
            }
            System.out.println();
        }
    }
}
