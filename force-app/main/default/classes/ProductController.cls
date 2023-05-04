public with sharing class ProductController {
    static Integer PAGE_SIZE = 9 ;
    
    @AuraEnabled(Cacheable=true)
    public static void getNumber(Integer num){
        System.debug('################Chal gaya bhai');
     ProductController.PAGE_SIZE = num; 
       
    }
    
    public class Filters {
        @AuraEnabled
        public String searchKey { get; set; }
        @AuraEnabled
        public Decimal maxPrice { get; set; }
        @AuraEnabled
        public String[] categories { get; set; }
        @AuraEnabled
        public String[] materials { get; set; }
        @AuraEnabled
        public String[] levels { get; set; }
        @AuraEnabled
        public String[] frame_Colors { get; set; }
        @AuraEnabled
        public Integer size { get; set; }
    }

    @AuraEnabled(Cacheable=true)
    public static PagedResult getProducts(Filters filters, Integer pageNumber) {
        String key, whereClause = '';
        Decimal maxPrice;
        String[] categories, materials, levels, criteria ,frame_Colors= new List<String>{};
        if (filters != null) {
            maxPrice = filters.maxPrice;
            criteria = new List<String>();
            materials = filters.materials;
            frame_Colors = filters.frame_Colors;
            levels = filters.levels;
            if (!String.isEmpty(filters.searchKey)) {
                key = '%' + filters.searchKey + '%';
                criteria.add('Name LIKE :key');
            }
            if (filters.maxPrice >= 0) {
                maxPrice = filters.maxPrice;
                criteria.add('MSRP__c <= :maxPrice');
            }
            if (filters.categories != null) {
                categories = filters.categories;
                criteria.add('Category__c IN :categories');
            }
            if (filters.frame_Colors != null) {
                frame_Colors = filters.frame_Colors;
                criteria.add('Frame_Color__c IN :frame_Colors');
            }
            if (filters.levels != null) {
                levels = filters.levels;
                criteria.add('Level__c IN :levels');
            }
            if (filters.materials != null) {
                materials = filters.materials;
                criteria.add('Material__c IN :materials');
            }
            if (criteria.size() > 0) {
                whereClause = 'WHERE ' + String.join(criteria, ' AND ');
            }
        }
        Integer pageSize;

        System.debug('################Chal gaya bhai');
        System.debug('################Chal gaya bhai'+filters.size);
        if(filters.size != null){
            
             pageSize = filters.size;
        }
        else{  
             pageSize = ProductController.PAGE_SIZE;
        }
        Integer offset = (pageNumber - 1) * pageSize;
        PagedResult result = new PagedResult();
        result.pageSize = pageSize;
        result.pageNumber = pageNumber;
        result.totalItemCount = Database.countQuery(
            'SELECT count() FROM Product__c ' + whereClause
        );
        result.records = Database.query(
            'SELECT Id, Name, MSRP__c, Description__c, Category__c, Level__c, Picture_URL__c, Material__c FROM Product__c ' +
            whereClause +
            ' WITH SECURITY_ENFORCED' +
            ' ORDER BY Name LIMIT :pageSize OFFSET :offset'
        );
        return result;
    }

    @AuraEnabled(Cacheable=true)
    public static Product__c[] getSimilarProducts(Id productId, Id familyId) {
        return [
            SELECT
                Id,
                Name,
                MSRP__c,
                Description__c,
                Category__c,
                Level__c,
                Picture_URL__c,
                Material__c,
                Frame_Color__c
            FROM Product__c
            WHERE Product_Family__c = :familyId AND Id != :productId
            WITH SECURITY_ENFORCED
        ];
    }
    @AuraEnabled(Cacheable=true)
    public static Integer getTotalPictures() {
        return [
            SELECT count() FROM Product__c WHERE  Picture_URL__c != Null
            ];
    }
}