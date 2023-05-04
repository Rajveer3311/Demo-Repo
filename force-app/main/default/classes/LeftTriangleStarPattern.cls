public with sharing class LeftTriangleStarPattern {
    public Static void triangleStarPattern() {
      for (Integer i = 1; i <= 5; i++) {
          String storeStar = '';
          for (Integer j = i; j < 5; j++) {
            storeStar+='_';
          } 
          for (Integer j = 1; j <= i; j++) {
            storeStar+='*';
          }
          System.debug(storeStar);
      }
    }
}