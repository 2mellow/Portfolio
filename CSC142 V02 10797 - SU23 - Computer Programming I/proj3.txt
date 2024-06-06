/**
 * Project 1: Drawing Curves from Straight Lines
 * 
 * Renders parabolic curves and a landscape with houses, trees, and pickups
 * @author      Markell Thornton
 * @version     1.0
 */
import java.awt.Graphics;
import java.awt.Color;

/**
 * Creates two windows: one window displays a shape formed by parabolic curves,
 * while the other window showcases a landscape.
 */
public class GraphicsProject {
    private static final int PANEL_SIZE = 400;
    private static final int RADIUS = PANEL_SIZE / 2;
    private static final int PART2_PANEL_SIZE = 600;
    private static final Color START_COLOR = Color.RED;
    private static final Color END_COLOR = Color.YELLOW;

    /**
     * Renders a single sector of the shape using parabolic curves and color
     * gradients.
     * 
     * @param   graphics the Graphics object to draw on
     * @param   sector the sector number to draw
     */
    public static void drawOneSectorOdd(Graphics graphics, int sector) {
        int centerX = PANEL_SIZE / 2;
        int centerY = PANEL_SIZE / 2;

        // start and end angle for sector
        double startAngle = Math.toRadians(45 * sector);
        double endAngle = Math.toRadians(45 * (sector + 1));

        int startX = (int) (RADIUS * Math.cos(startAngle)) + centerX;
        int startY = (int) (RADIUS * Math.sin(startAngle)) + centerY;

        int endX = (int) (RADIUS * Math.cos(endAngle)) + centerX;
        int endY = (int) (RADIUS * Math.sin(endAngle)) + centerY;

        graphics.setColor(Color.YELLOW);
        graphics.drawLine(centerX, centerY, endX, endY);

        graphics.setColor(Color.RED);
        graphics.drawLine(centerX, centerY, startX, startY);

        int numberOfPoints = 20;

        int changeX1 = (int) ((startX - centerX) / numberOfPoints);
        int changeY1 = (int) ((startY - centerY) / numberOfPoints);

        int changeX2 = (int) ((endX - centerX) / numberOfPoints);
        int changeY2 = (int) ((endY - centerY) / numberOfPoints);

        for (int i = 0; i < numberOfPoints; i++) {
            int pointX1 = (int) (centerX + changeX1 * i);
            int pointY1 = (int) (centerY + changeY1 * i);
            int pointX2 = (int) (endX - changeX2 * i);
            int pointY2 = (int) (endY - changeY2 * i);

            drawColoredLineOddSector(graphics, pointX1, pointY1, pointX2, pointY2, sector);
        }
    }

    public static void drawOneSectorEven(Graphics graphics, int sector) {
        int centerX = PANEL_SIZE / 2;
        int centerY = PANEL_SIZE / 2;

        // start and end angle for sector
        double startAngle = Math.toRadians(45 * sector);
        double endAngle = Math.toRadians(45 * (sector + 1));

        int x1 = (int) (RADIUS * Math.cos(startAngle)) + centerX;
        int y1 = (int) (RADIUS * Math.sin(startAngle)) + centerY;

        int x2 = (int) (RADIUS * Math.cos(endAngle)) + centerX;
        int y2 = (int) (RADIUS * Math.sin(endAngle)) + centerY;

        graphics.setColor(Color.YELLOW);
        graphics.drawLine(centerX, centerY, x1, y1);
        graphics.setColor(Color.RED);
        graphics.drawLine(centerX, centerY, x2, y2);

        int numberOfPoints = 20;

        int changeX1 = (int) ((x1 - centerX) / numberOfPoints);
        int changeY1 = (int) ((y1 - centerY) / numberOfPoints);

        int changeX2 = (int) ((x2 - centerX) / numberOfPoints);
        int changeY2 = (int) ((y2 - centerY) / numberOfPoints);

        for (int i = 0; i < numberOfPoints; i++) {
            int px1 = (int) (centerX + changeX1 * i);
            int py1 = (int) (centerY + changeY1 * i);
            int px2 = (int) (x2 - changeX2 * i);
            int py2 = (int) (y2 - changeY2 * i);

            drawColoredLineEvenSector(graphics, px1, py1, px2, py2, sector);
        }
    }

    /**
     * Renders a series of colored line segments connecting the start and end
     * points.
     * 
     * @param graphics the Graphics object to draw on
     * @param x1 the x-coordinate of the start point
     * @param y1 the y-coordinate of thestart point
     * @param x2 the x-coordinate of the end point
     * @param y2 the y-coordinate of the end point
     * @param sector the sector number
     */
    private static void drawColoredLineOddSector(Graphics graphics, int x1, int y1, int x2, int y2, int sector) {
        int numberOfSegments = 100;
        for (int i = 1; i <= numberOfSegments; i++) {
            double fraction1 = (double) i / numberOfSegments;
            double inverseFraction1 = 1 - fraction1;
            double fraction2 = (double) (i - 1) / numberOfSegments;
            double inverseFraction2 = 1 - fraction2;
            double x3 = inverseFraction1 * x1 + fraction1 * x2;
            double y3 = inverseFraction1 * y1 + fraction1 * y2;
            double x4 = inverseFraction2 * x1 + fraction2 * x2;
            double y4 = inverseFraction2 * y1 + fraction2 * y2;

            graphics.setColor(findColor(fraction1));
            graphics.drawLine((int) x3, (int) y3, (int) x4, (int) y4);
        }
    }

    private static void drawColoredLineEvenSector(Graphics graphics, int x1, int y1, int x2, int y2, int sector) {
        int numberOfSegments = 100;
        for (int i = 1; i <= numberOfSegments; i++) {
            double fraction1 = (double) i / numberOfSegments;
            double inverseFraction1 = 1 - fraction1;
            double fraction2 = (double) (i - 1) / numberOfSegments;
            double inverseFraction2 = 1 - fraction2;
            double x3 = inverseFraction1 * x1 + fraction1 * x2;
            double y3 = inverseFraction1 * y1 + fraction1 * y2;
            double x4 = inverseFraction2 * x1 + fraction2 * x2;
            double y4 = inverseFraction2 * y1 + fraction2 * y2;

            graphics.setColor(findColor(inverseFraction1));
            graphics.drawLine((int) x3, (int) y3, (int) x4, (int) y4);
        }
    }

    /**
     * Interpolates between the start color and end color based on the given ratio.
     * 
     * @param ratio the ratio between 0.0 and 1.0
     * @return the interpolated Color
     */
    private static Color findColor(double ratio) {
        int r1 = START_COLOR.getRed();
        int r2 = END_COLOR.getRed();
        int g1 = START_COLOR.getGreen();
        int g2 = END_COLOR.getGreen();
        int b1 = START_COLOR.getBlue();
        int b2 = END_COLOR.getBlue();
        int newR = (int) (Math.abs(r1 - r2) * ratio + Math.min(r1, r2));
        int newG = (int) (Math.abs(g1 - g2) * ratio + Math.min(g1, g2));
        int newB = (int) (Math.abs(b1 - b2) * ratio + Math.min(b1, b2));
        return new Color(newR, newG, newB);
    }

    /**
     * Runs part one, creating the first window with parabolic curves.
     */
    public static void runPartOne() {
        DrawingPanel drawPanel = new DrawingPanel(PANEL_SIZE, PANEL_SIZE);
        drawPanel.setBackground(Color.BLACK);
        Graphics graphics = drawPanel.getGraphics();
        drawOneSectorEven(graphics, 0);
        drawOneSectorOdd(graphics, 1);
        drawOneSectorEven(graphics, 2);
        drawOneSectorOdd(graphics, 3);
        drawOneSectorEven(graphics, 4);
        drawOneSectorOdd(graphics, 5);
        drawOneSectorEven(graphics, 6);
        drawOneSectorOdd(graphics, 7);
    }

    /**
     * Runs part two, creating the second window with a landscape.
     */
    public static void runPartTwo() {
        DrawingPanel drawPanel = new DrawingPanel(PART2_PANEL_SIZE, PART2_PANEL_SIZE);
        drawPanel.setBackground(new Color(0, 128, 0));
        Graphics graphics = drawPanel.getGraphics();

        drawHouse(graphics, 220, 250, 120, Color.RED, new Color(181, 101, 29));

        drawTree(graphics, 470, 220, 50, Color.BLACK, Color.GREEN);
        drawTree(graphics, 100, 470, 50, Color.BLACK, Color.GREEN);
        drawTree(graphics, 400, 550, 45, Color.BLACK, new Color(0, 190, 0));
        drawTree(graphics, 220, 120, 35, Color.BLACK, new Color(90, 150, 0));
        drawTree(graphics, 440, 410, 45, Color.BLACK, new Color(20, 180, 40));
        drawTree(graphics, 50, 130, 32, Color.BLACK, new Color(120, 230, 0));

        drawPickup(graphics, 330, 350, 20, Color.RED);
        drawPickup(graphics, 35, 330, 20, Color.YELLOW);
    }

    /**
     * Draws a house shape with specified parameters.
     */
    public static void drawHouse(Graphics graphics, int houseX, int houseY, int houseSize, Color roofColor, Color wallColor) {
        graphics.setColor(wallColor);
        int gap = 20;
        int wallHeight = (int) (houseSize * 0.7);
        // draws the front walls
        graphics.fillRect(houseX - houseSize + gap, houseY, houseSize * 2 - gap * 2, wallHeight);
        // draws the triangle roof
        graphics.setColor(roofColor);
        graphics.fillPolygon(
                new int[] { houseX - houseSize, houseX, houseX + houseSize, houseX - houseSize },
                new int[] { houseY, (int) (houseY - houseSize * 0.5), houseY, houseY },
                4);
        // draws the door
        graphics.setColor(Color.CYAN);
        int doorSize = (int) (houseSize * 0.15);
        graphics.fillRect(houseX - doorSize, houseY + wallHeight - doorSize * 3, doorSize * 2, doorSize * 3);
    }

    /**
     * Draw a tree shape with specified parameters.
     */
    public static void drawTree(Graphics graphics, int treeX, int treeY, int treeSize, Color trunkColor, Color leafColor) {
        graphics.setColor(leafColor);
        int topY = (int) (treeY - treeSize * 1.5);
        // draws the top triangle shape of tree
        graphics.fillPolygon(
                new int[] { treeX, treeX + treeSize / 2, treeX - treeSize / 2, treeX },
                new int[] { topY, treeY, treeY, topY },
                4);

        // draws the semi-circle at bottom of tree leaves
        graphics.fillArc((int) (treeX - treeSize * 0.5), (int) (treeY - treeSize * 0.5), treeSize, treeSize, 180, 180);

        // draw the trunk and branches
        graphics.setColor(trunkColor);
        graphics.fillRect(treeX, treeY - treeSize, (int) (treeSize * 0.05), treeSize * 2);
        int lineSize = (int) (treeSize * 0.5);
        graphics.drawLine(treeX, treeY, treeX - lineSize / 2, treeY - lineSize / 2);
        graphics.drawLine(treeX, treeY - treeSize / 2, treeX + lineSize / 4, treeY - treeSize / 2 - lineSize / 2);
    }

    /**
     * Creates a shape that resembles a pickup truck.
     */
    public static void drawPickup(Graphics graphics, int pickupX, int pickupY, int pickupSize, Color color) {
        graphics.setColor(color);
        graphics.fillRect(pickupX - pickupSize, pickupY, pickupSize * 4, pickupSize);
        graphics.fillRect(pickupX, (int) (pickupY - pickupSize * 0.8), pickupSize, pickupSize);
        int r = pickupSize / 4;
        graphics.setColor(Color.BLACK);
        graphics.fillOval(pickupX - r * 2, pickupY + pickupSize - r * 2, r * 4, r * 4);
        graphics.fillOval(pickupX + pickupSize * 2 - r * 2, pickupY + pickupSize - r * 2, r * 4, r * 4);
    }

    public static void main(String[] args) {
        runPartOne();
        runPartTwo();
    }
}