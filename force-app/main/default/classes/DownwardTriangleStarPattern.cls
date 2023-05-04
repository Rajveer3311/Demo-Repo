public with sharing class DownwardTriangleStarPattern {
    public static void starPattern() {
        for (Integer i = 5; i >= 1; i--) {
            String storeStar = '';
            for (Integer j = 1; j <= i; j++) {
              storeStar+='*';
            }
            System.debug(storeStar);
        }
    }
}