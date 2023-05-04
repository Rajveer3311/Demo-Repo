public class StandardDeviation {
    public Static Double StandardDeviations(List<Integer> getValue){
        Decimal sum = 0.0, mean;
        Double SD = 0.0;
        Integer i;
        for (i = 0; i < getValue.Size(); ++i) {
           sum += getValue[i];
        }
        mean = sum / getValue.Size();
        for (i = 0; i < getValue.Size(); ++i) {
           Double d = (Double)getValue[i]- (Double)mean;
           SD += Math.pow(d ,(Double)2);
        }
        System.debug(math.sqrt(SD / getValue.Size()));
     return (math.sqrt(SD / getValue.Size()));
    }
}