public with sharing class RightPascalTriangleStarPattern {
    public static void starPattern() {
        for (Integer i = 1; i <= 5; i++) {
            String storeStar = ' ';
            for (Integer j = 1; j <= i; j++) {
              storeStar+='*';
            }
            System.debug(storeStar);
        }
        for (Integer i = 4; i >= 1; i--) {
            String storeStar = '';
            for (Integer j = 1; j <= i; j++) {
              storeStar+='*';
            }
            System.debug(storeStar);
        }
    }
}