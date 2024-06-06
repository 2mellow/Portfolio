/**
 * Models a mathematical matrix supporting Gaussian row operations.<br>
 * In this version, row and column indexes start at 0 as is typical in programming.
 *
 * @author CSC142
 */
public class Matrix {

    private double[][] data;

    /**
     * instantiates a matrix
     *
     * @param rowCount the number of rows
     * @param colCount the number of columns
     */
    public Matrix(int rowCount, int colCount) {
        data = new double[rowCount][colCount];
    }

    /**
     * sets the value of a particular element in the matrix
     *
     * @param row   the row of the element; must be a valid row
     * @param col   the column of the element; must be a valid column
     * @param value the value to be stored
     */
    public void setValue(int row, int col, double value) {
        data[row][col] = value;
    }

    /**
     * returns the value of a particular element in the matrix
     *
     * @param row the row of the element
     * @param col the column of the element
     * @return the value at the requested row/col of the matrix
     */
    public double getValue(int row, int col) {
        return data[row][col];
    }

    /**
     * swaps entire rows in the matrix
     *
     * @param row1 one of the rows to swap
     * @param row2 the other row to swap
     */
    public void swapRows(int row1, int row2) {
        double[] temp = data[row1];
        data[row1] = data[row2];
        data[row2] = temp;
    }

    /**
     * multiplies one row by a non-zero constant
     *
     * @param multiple constant to multiply by; must be non-zero
     * @param row      the row to update
     */
    public void multiplyRow(int multiple, int row) {
        if (multiple == 0) {
            throw new IllegalArgumentException("multiple must not be 0");
        }
        for (int i = 0; i < data[0].length; i++) {
            data[row][i] *= multiple;
        }
    }

    /**
     * adds row1 into row2; equivalent to the mathematical row2 = row1 + row2
     *
     * @param r1 the row to add
     * @param r2 the row to add into (update)
     */
    public void addRows(int r2, int r1) {
        for (int i = 0; i < data[0].length; i++) {
            data[r2][i] = data[r2][i] + data[r1][i];
        }
    }

    /**
     * replaces an existing row in the matrix with a new row
     *
     * @param row  the new row to insert; must be the same length
     *             as the row being replaced
     * @param rIdx the index of the new row
     * @return the old (original) row
     */
    public double[] replace(double[] row, int rIdx) {
        if (data[rIdx].length != row.length) {
            throw new IllegalArgumentException("row length should match");
        }
        double[] oldRow = data[rIdx];
        data[rIdx] = row;
        return oldRow;
    }

    /**
     * adds this matrix to the other matrix specified, returning a new matrix
     *
     * @param otherMatrix the other matrix (won't be changed)
     * @return the matrix sum of the current matrix + otherMatrix
     */
    public Matrix sum(Matrix otherMatrix) {
        Matrix result = new Matrix(data.length, data[0].length);
        for (int r = 0; r < data.length; r++) {
            for (int c = 0; c < data[0].length; c++) {
                double sum = data[r][c] + otherMatrix.getValue(r, c);
                result.setValue(r, c, sum);
            }
        }
        return result;
    }

    /**
     * returns this matrix in rows (one per line) and columns (multiple data items
     * separated by spaces, no fancy alignment)
     *
     * @return matrix representation
     */
    public String toString() {
        String result = "";
        for (int r = 0; r < data.length; r++) {
            for (int c = 0; c < data[0].length; c++) {
                result += data[r][c] + "  ";
            }
            result += "\n";
        }
        return result;
    }
}