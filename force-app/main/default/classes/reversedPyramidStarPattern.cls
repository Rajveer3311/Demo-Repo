public with sharing class reversedPyramidStarPattern {
    // By three loop
public static void starPattern() {
    for (Integer i = 5; i >= 1; i--) {
        String storeStar = '';
        for (Integer j = 5; j > i; j--) {
            storeStar+='_';
            }
        for (Integer j = 1; j <= i; j++) {
            storeStar+='* ';
        }
        System.debug(storeStar);
    }
}

// By two loop
    public static void starPatternMethod2() {
        for (Integer i = 5; i >= 1; i--) {
            String storeStar = '';
            
            for (Integer j = 1; j <= 5; j++) {
                if (j<=5-i) {
                    storeStar+='_';
                }
                else{
                    storeStar+='* ';
                }
            }
            System.debug(storeStar);
        }
}

}

/*

* * * * *
* * * *
* * *
* *
++++* 
            */