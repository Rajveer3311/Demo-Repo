public class TestJson 
{
   
    public class jsonWrapper
    {
        public String exchange;
        public String payload_encoding;
        public propertiesWrapper properties;
        public jsonOppWrapper payload;
    }
    
    public class propertiesWrapper
    {
        public String correlation_id;
        public String priority;
        public String delivery_mode;
        public headersWrapper headers;
        public String content_encoding;
        public String content_type;
    }
    
    public class headersWrapper
    {}
    
    public class jsonOppWrapper
    {
        public jsonOppObjWrapper Opportunity;
    }
    
    public class jsonOppObjWrapper
    {
        public String OpportunityId18Digit;	//0062L00000UdNEaQAN
		public String OpportunityId;	//O284864
		public String AccountName;	//Los Portales
		public String ApprovalDate;
        public String ApprovalStatus;
        public String Channel;
        public String CloseDate;
        public Integer ConversionRate;
        public String CreatedBy;
        public String CreatedDate;
        public String Description;
        public String EdgePlanType;
        public Decimal EstimatedLivesNewQty;
        public Decimal EstimatedLivesQty;
        public Decimal EstimatedLivesRenewalQty;
        public String ForecastCategory;
        public String GenerateRenewal;
        public String GrowthSubTeamLevel1;
        public String GrowthSubTeamLevel2;
        public String GrowthTeam;
        public String LastModifiedDate;
        public Decimal Members;
        public Decimal NumberOfBridgeProducts;
        public String OpportunityCurrency;
        public String OpportunityInitiator;
        public String OpportunityName;
        public String OpportunityType;
        public String OpportunitySubType;
        public Boolean OptumLegalAgreementRequested;
        public String OwnerAlias;
        public String OwnerCompanyName;
        public String OwnerDepartment;
        public String OwnerDivision;
        public String OwnerEmail;
        public String OwnerEmployeeNumber;
        public String OwnerFirstName;
        public String OwnerId;
        public String OwnerLastName;
        public String OwnerName;
        public String OwnerNickname;
        public String OwnerTitle;
        public String OwnerUserID;
        public String OwnerUsername;
        public Decimal PARR;
        public Integer PARRNewUSD;
        public Decimal PARRRenewalUSD;
        public String PriceBookName;
        public Decimal PriorAnnualValue;
        public String Probability;
        public Decimal PTRR;
        public Integer PTRRNewUSD;
        public Decimal PTRRRenewalUSD;
        public String ReasonforWinLoss1;
        public String RenewalForecast;
        public String Stage;
        public String SubReasonforWinLoss1;
        public Boolean TopOpportunityFlag;
        public String WinLossNarrative1;
        public QuoteWrapper Quote;
        public List<SellingPartnerWrapper> SellingPartner;
        public AccountWrapper Account;
    }
    
    public class QuoteWrapper
    {
        public String QuoteId; 
        public String ContractEffectiveDate;
        public String ContractExpirationDate; 
        public String EarliestRenewByDate;
        public Decimal ContractTermMonths; 
        public String LastModifiedDate;
        public String PriceBookName; 
        public String PricebookId;
        public Boolean Primary; 
        public String QuoteNumber;
        public Decimal QuotePARR; 
        public Decimal QuotePTRR;
        public String QuoteType; 
        public List<QuoteLineWrapper> QuoteLine;
    }
    
    public class QuoteLineWrapper
    {
        public String QuoteLineId;
        public String CurrencyISOCode;
        public String Disposition;
        public String EndDate;
        public String FundingType;
        public String LastModifiedDate;
        public String LineName;
        public Decimal LinePARR;
        public Decimal LinePARRUSD;
        public Decimal LinePTRR;
        public Decimal LinePTRRUSD;
        public Decimal ListUnitPrice;
        public Decimal NetPrice;
       // public Integer Number;
        public Boolean Optional;
        public String ParentProductQuantity;
        public String Population;
        public Decimal PriorAnnualValue;
        public String Product;
        public String ProductDescription;
        public String ProductFamily;
        public String ProductID;
        public String ProductLine;
        public String ProductName;
        public String ProductNameCombined;
        public String ProductSegment;
        public String ProductSubSegment;
        public String ProductTaxonomyName;
        public String ProductUnit;
        public Integer QuantityChange;
        public String QuantityDesc;
        public String RatePeriod;
        public String RateType;
        public String RenewByDate;
        public String SalesCategory;
        public String SalesItemType;
        public String StartDate;
        public Decimal SubscriptionTerm;
        public Integer TotalQuantity;
        public String UniquePopulation;
    }
    
    public class SellingPartnerWrapper
    {
        public String	SellingPartnerId	;
        public String	LastModifiedDate	;
        public String	PartnerAccountCity	;
        public String	PartnerAccountCountry	;
        public String	PartnerAccountCountryCode	;
        public String	PartnerAccountId	;
        public String	PartnerAccountName	;
        public String	PartnerAccountPostalCode	;
        public String	PartnerAccountState	;
        public String	PartnerAccountStreet	;
        public String	PartnerOrganizationType;
        public String	PartnerResponsibility;
        public String	PartnerType	;
        public String	SellingPartnerNumber;
    }
    
    public class AccountWrapper
    {
        public String	AccountId18Digit	;
        public String	AccountId	;
        public String	AccountName	;
        public String	AccountPhone	;
        public String	LastModifiedDate	;
        public String	MDMEID	;
        public String	PhysicalCity	;
        public String	PhysicalCountry	;
        public String	PhysicalCountryCode	;
        public String	PhysicalStateProvince	;
        public String	PhysicalStreet	;
        public String	PhysicalZipPostalCode	;
        public String	Website	;
        public OptumAccountContactWrapper OptumAccountContact; 
    }
    
    public class OptumAccountContactWrapper{
        public String	OptumAccountContact18Id	;
        public String	ContactAccount	;
        public String	ContactEmail	;
        public String	ContactMailingCity	;
        public String	ContactMailingState	;
        public String	ContactMailingStreet	;
        public String	ContactName	;
        public String	ContactPostalCode	;
        public String	ContactTitle	;
        public String	GrowthSubTeamLevel1	;
        public String	GrowthSubTeamLevel2	;
        public String	GrowthTeam	;
        public String	LastModifiedDate	;
        public String	OptumAccountContactId	;
        public String	ReportsTo	;
        public String	Role	;
        public String	RoleStatus	;
    }
}