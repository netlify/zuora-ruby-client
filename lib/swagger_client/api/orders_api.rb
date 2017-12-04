=begin
#Zuora API Reference

#  # Introduction Welcome to the reference for the Zuora REST API!  <a href=\"http://en.wikipedia.org/wiki/REST_API\" target=\"_blank\">REST</a> is a web-service protocol that lends itself to rapid development by using everyday HTTP and JSON technology.  The Zuora REST API provides a broad set of operations and resources that:    * Enable Web Storefront integration from your website.   * Support self-service subscriber sign-ups and account management.   * Process revenue schedules through custom revenue rule models.   * Enable manipulation of most objects in the Zuora Object Model.      ## Endpoints      The Zuora REST API is provided via the following endpoints.   | Tenant              | Base URL for REST Endpoints |   |-------------------------|-------------------------|   |US Production | https://rest.zuora.com   |   |US API Sandbox    | https://rest.apisandbox.zuora.com|   |US Performance Test | https://rest.pt1.zuora.com |   |EU Production | https://rest.eu.zuora.com |   |EU Sandbox | https://rest.sandbox.eu.zuora.com |      The production endpoint provides access to your live user data. The API Sandbox tenant is a good place to test your code without affecting real-world data. To use it, you must be provisioned with an API Sandbox tenant - your Zuora representative can help you if needed.      ## Access to the API      If you have a Zuora tenant, you already have access to the API.      If you don't have a Zuora tenant, go to <a href=\" https://www.zuora.com/resource/zuora-test-drive\" target=\"_blank\">https://www.zuora.com/resource/zuora-test-drive</a> and sign up for a Production Test Drive tenant. The tenant comes with seed data, such as a sample product catalog.  We recommend that you <a href=\"https://knowledgecenter.zuora.com/CF_Users_and_Administrators/A_Administrator_Settings/Manage_Users/Create_an_API_User\" target=\"_blank\">create an API user</a> specifically for making API calls. Don't log in to the Zuora UI with this account. Logging in to the UI enables a security feature that periodically expires the account's password, which may eventually cause authentication failures with the API. Note that a user role does not have write access to Zuora REST services unless it has the API Write Access permission as described in those instructions.   # API Changelog You can find the <a href=\"https://community.zuora.com/t5/Developers/API-Changelog/gpm-p/18092\" target=\"_blank\">Changelog</a> of the API Reference in the Zuora Community.   # Authentication  ## OAuth v2.0  Zuora recommends that you use OAuth v2.0 to authenticate to the Zuora REST API. Currently, OAuth is not available in every environment. See [Zuora Testing Environments](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/D_Zuora_Environments) for more information.  Authenticating via OAuth requires the following steps: 1. Create a Client 2. Generate a Token  ### Create a Client  You must first [create an OAuth client](https://knowledgecenter.zuora.com/CF_Users_and_Administrators/A_Administrator_Settings/Manage_Users#Create_an_OAuth_Client_for_a_User) in the Zuora UI. To do this, you must be an administrator of your Zuora tenant. This is a one-time operation. You will be provided with a Client ID and a Client Secret. Please note this information down, as it will be required for the next step.  **Note:** The OAuth client will be owned by a Zuora user account. If you want to perform PUT, POST, or DELETE operations using the OAuth client, the owner of the OAuth client must have a Platform role that includes the \"API Write Access\" permission.  ### Generate a Token  After creating a client, you must make a call to obtain a bearer token using the [Generate an OAuth token](https://www.zuora.com/developer/api-reference/#operation/createToken) operation. This operation requires the following parameters: - `client_id` - the Client ID displayed when you created the OAuth client in the previous step - `client_secret` - the Client Secret displayed when you created the OAuth client in the previous step - `grant_type` - must be set to `client_credentials`  **Note**: The Client ID and Client Secret mentioned above were displayed when you created the OAuth Client in the prior step. The [Generate an OAuth token](https://www.zuora.com/developer/api-reference/#operation/createToken) response specifies how long the bearer token is valid for. Call [Generate an OAuth token](https://www.zuora.com/developer/api-reference/#operation/createToken) again to generate a new bearer token.  For every subsequent API request, a valid bearer token must be provided in an HTTP header:  `Authorization: Bearer {bearer_token}`     ## Other Supported Authentication Schemes  Zuora continues to support the following additional legacy means of authentication:    * Use username and password. Include authentication with each request in the header:         * `apiAccessKeyId`      * `apiSecretAccessKey`     * `entityId` or `entityName` (Only for [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity \"Multi-entity\"). See \"Entity Id and Entity Name\" below for more information.)    * Use an authorization cookie. The cookie authorizes the user to make calls to the REST API for the duration specified in  **Administration > Security Policies > Session timeout**. The cookie expiration time is reset with this duration after every call to the REST API. To obtain a cookie, call the REST  `connections` resource with the following API user information:         *   ID         *   password     *   entity Id or entity name (Only for [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity \"Multi-entity\"). See \"Entity Id and Entity Name\" below for more information.)         * For CORS-enabled APIs only: Include a 'single-use' token in the request header, which re-authenticates the user with each request. See below for more details.  ### Entity Id and Entity Name  The `entityId` and `entityName` parameters are only used for [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity \"Zuora Multi-entity\").   The  `entityId` and `entityName` parameters specify the Id and the [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name \"Introduction to Entity and Entity Hierarchy\") that you want to access, respectively. Note that you must have permission to access the entity.   You can specify either the `entityId` or `entityName` parameter in the authentication to access and view an entity.    * If both `entityId` and `entityName` are specified in the authentication, an error occurs.    * If neither `entityId` nor `entityName` is specified in the authentication, you will log in to the entity in which your user account is created.      To get the entity Id and entity name, you can use the GET Entities REST call. For more information, see [API User Authentication](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/A_Overview_of_Multi-entity#API_User_Authentication \"API User Authentication\").      ### Token Authentication for CORS-Enabled APIs      The CORS mechanism enables REST API calls to Zuora to be made directly from your customer's browser, with all credit card and security information transmitted directly to Zuora. This minimizes your PCI compliance burden, allows you to implement advanced validation on your payment forms, and  makes your payment forms look just like any other part of your website.    For security reasons, instead of using cookies, an API request via CORS uses **tokens** for authentication.  The token method of authentication is only designed for use with requests that must originate from your customer's browser; **it should  not be considered a replacement to the existing cookie authentication** mechanism.  See [Zuora CORS REST](https://knowledgecenter.zuora.com/DC_Developers/REST_API/A_REST_basics/G_CORS_REST \"Zuora CORS REST\") for details on how CORS works and how you can begin to implement customer calls to the Zuora REST APIs. See  [HMAC Signatures](https://www.zuora.com/developer/api-reference/#operation/POSTHMACSignature \"HMAC Signatures\") for details on the HMAC method that returns the authentication token.  # Requests and Responses  ## Request IDs  As a general rule, when asked to supply a \"key\" for an account or subscription (accountKey, account-key, subscriptionKey, subscription-key), you can provide either the actual ID or  the number of the entity.  ## HTTP Request Body  Most of the parameters and data accompanying your requests will be contained in the body of the HTTP request.   The Zuora REST API accepts JSON in the HTTP request body. No other data format (e.g., XML) is supported.  ### Data Type  ([Actions](https://www.zuora.com/developer/api-reference/#tag/Actions) and CRUD operations only) We recommend that you do not specify the decimal values with quotation marks, commas, and spaces. Use characters of `+-0-9.eE`, for example, `5`, `1.9`, `-8.469`, and `7.7e2`. Also, Zuora does not convert currencies for decimal values.  ## Testing a Request  Use a third party client, such as [curl](https://curl.haxx.se \"curl\"), [Postman](https://www.getpostman.com \"Postman\"), or [Advanced REST Client](https://advancedrestclient.com \"Advanced REST Client\"), to test the Zuora REST API.  You can test the Zuora REST API from the Zuora API Sandbox or Production tenants. If connecting to Production, bear in mind that you are working with your live production data, not sample data or test data.  ## Testing with Credit Cards  Sooner or later it will probably be necessary to test some transactions that involve credit cards. For suggestions on how to handle this, see [Going Live With Your Payment Gateway](https://knowledgecenter.zuora.com/CB_Billing/M_Payment_Gateways/C_Managing_Payment_Gateways/B_Going_Live_Payment_Gateways#Testing_with_Credit_Cards \"C_Zuora_User_Guides/A_Billing_and_Payments/M_Payment_Gateways/C_Managing_Payment_Gateways/B_Going_Live_Payment_Gateways#Testing_with_Credit_Cards\" ).  ## Concurrent Request Limits  Zuora enforces tenant-level concurrent request limits. See <a href=\"https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Policies/Concurrent_Request_Limits\" target=\"_blank\">Concurrent Request Limits</a> for more information.    ## Error Handling  Responses and error codes are detailed in [Responses and errors](https://knowledgecenter.zuora.com/DC_Developers/REST_API/A_REST_basics/3_Responses_and_errors \"Responses and errors\").  # Pagination  When retrieving information (using GET methods), the optional `pageSize` query parameter sets the maximum number of rows to return in a response. The maximum is `40`; larger values are treated as `40`. If this value is empty or invalid, `pageSize` typically defaults to `10`.  The default value for the maximum number of rows retrieved can be overridden at the method level.  If more rows are available, the response will include a `nextPage` element, which contains a URL for requesting the next page.  If this value is not provided, no more rows are available. No \"previous page\" element is explicitly provided; to support backward paging, use the previous call.  ## Array Size  For data items that are not paginated, the REST API supports arrays of up to 300 rows.  Thus, for instance, repeated pagination can retrieve thousands of customer accounts, but within any account an array of no more than 300 rate plans is returned.  # API Versions  The Zuora REST API are version controlled. Versioning ensures that Zuora REST API changes are backward compatible. Zuora uses a major and minor version nomenclature to manage changes. By specifying a version in a REST request, you can get expected responses regardless of future changes to the API.  ## Major Version  The major version number of the REST API appears in the REST URL. Currently, Zuora only supports the **v1** major version. For example, `POST https://rest.zuora.com/v1/subscriptions`.  ## Minor Version  Zuora uses minor versions for the REST API to control small changes. For example, a field in a REST method is deprecated and a new field is used to replace it.   Some fields in the REST methods are supported as of minor versions. If a field is not noted with a minor version, this field is available for all minor versions. If a field is noted with a minor version, this field is in version control. You must specify the supported minor version in the request header to process without an error.   If a field is in version control, it is either with a minimum minor version or a maximum minor version, or both of them. You can only use this field with the minor version between the minimum and the maximum minor versions. For example, the `invoiceCollect` field in the POST Subscription method is in version control and its maximum minor version is 189.0. You can only use this field with the minor version 189.0 or earlier.  If you specify a version number in the request header that is not supported, Zuora will use the minimum minor version of the REST API. In our REST API documentation, if a field or feature requires a minor version number, we note that in the field description.  You only need to specify the version number when you use the fields require a minor version. To specify the minor version, set the `zuora-version` parameter to the minor version number in the request header for the request call. For example, the `collect` field is in 196.0 minor version. If you want to use this field for the POST Subscription method, set the  `zuora-version` parameter to `196.0` in the request header. The `zuora-version` parameter is case sensitive.  For all the REST API fields, by default, if the minor version is not specified in the request header, Zuora will use the minimum minor version of the REST API to avoid breaking your integration.   ### Minor Version History  The supported minor versions are not serial. This section documents the changes made to each Zuora REST API minor version.  The following table lists the supported versions and the fields that have a Zuora REST API minor version.  | Fields         | Minor Version      | REST Methods    | Description | |:--------|:--------|:--------|:--------| | invoiceCollect | 189.0 and earlier  | [Create Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_Subscription \"Create Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\"); [Renew Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_RenewSubscription \"Renew Subscription\"); [Cancel Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_CancelSubscription \"Cancel Subscription\"); [Suspend Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_SuspendSubscription \"Suspend Subscription\"); [Resume Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_ResumeSubscription \"Resume Subscription\"); [Create Account](https://www.zuora.com/developer/api-reference/#operation/POST_Account \"Create Account\")|Generates an invoice and collects a payment for a subscription. | | collect        | 196.0 and later    | [Create Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_Subscription \"Create Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\"); [Renew Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_RenewSubscription \"Renew Subscription\"); [Cancel Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_CancelSubscription \"Cancel Subscription\"); [Suspend Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_SuspendSubscription \"Suspend Subscription\"); [Resume Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_ResumeSubscription \"Resume Subscription\"); [Create Account](https://www.zuora.com/developer/api-reference/#operation/POST_Account \"Create Account\")|Collects an automatic payment for a subscription. | | invoice | 196.0 and 207.0| [Create Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_Subscription \"Create Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\"); [Renew Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_RenewSubscription \"Renew Subscription\"); [Cancel Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_CancelSubscription \"Cancel Subscription\"); [Suspend Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_SuspendSubscription \"Suspend Subscription\"); [Resume Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_ResumeSubscription \"Resume Subscription\"); [Create Account](https://www.zuora.com/developer/api-reference/#operation/POST_Account \"Create Account\")|Generates an invoice for a subscription. | | invoiceTargetDate | 196.0 and earlier  | [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview \"Preview Subscription\") |Date through which charges are calculated on the invoice, as `yyyy-mm-dd`. | | invoiceTargetDate | 207.0 and earlier  | [Create Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_Subscription \"Create Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\"); [Renew Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_RenewSubscription \"Renew Subscription\"); [Cancel Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_CancelSubscription \"Cancel Subscription\"); [Suspend Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_SuspendSubscription \"Suspend Subscription\"); [Resume Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_ResumeSubscription \"Resume Subscription\"); [Create Account](https://www.zuora.com/developer/api-reference/#operation/POST_Account \"Create Account\")|Date through which charges are calculated on the invoice, as `yyyy-mm-dd`. | | targetDate | 207.0 and later | [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview \"Preview Subscription\") |Date through which charges are calculated on the invoice, as `yyyy-mm-dd`. | | targetDate | 211.0 and later | [Create Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_Subscription \"Create Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\"); [Renew Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_RenewSubscription \"Renew Subscription\"); [Cancel Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_CancelSubscription \"Cancel Subscription\"); [Suspend Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_SuspendSubscription \"Suspend Subscription\"); [Resume Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_ResumeSubscription \"Resume Subscription\"); [Create Account](https://www.zuora.com/developer/api-reference/#operation/POST_Account \"Create Account\")|Date through which charges are calculated on the invoice, as `yyyy-mm-dd`. | | includeExisting DraftInvoiceItems | 196.0 and earlier| [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview \"Preview Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\") | Specifies whether to include draft invoice items in subscription previews. Specify it to be `true` (default) to include draft invoice items in the preview result. Specify it to be `false` to excludes draft invoice items in the preview result. | | includeExisting DraftDocItems | 207.0 and later  | [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview \"Preview Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\") | Specifies whether to include draft invoice items in subscription previews. Specify it to be `true` (default) to include draft invoice items in the preview result. Specify it to be `false` to excludes draft invoice items in the preview result. | | previewType | 196.0 and earlier| [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview \"Preview Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\") | The type of preview you will receive. The possible values are `InvoiceItem`(default), `ChargeMetrics`, and `InvoiceItemChargeMetrics`. | | previewType | 207.0 and later  | [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview \"Preview Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\") | The type of preview you will receive. The possible values are `LegalDoc`(default), `ChargeMetrics`, and `LegalDocChargeMetrics`. | | runBilling  | 211.0 and later  | [Create Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_Subscription \"Create Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\"); [Renew Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_RenewSubscription \"Renew Subscription\"); [Cancel Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_CancelSubscription \"Cancel Subscription\"); [Suspend Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_SuspendSubscription \"Suspend Subscription\"); [Resume Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_ResumeSubscription \"Resume Subscription\"); [Create Account](https://www.zuora.com/developer/api-reference/#operation/POST_Account \"Create Account\")|Generates an invoice or credit memo for a subscription. **Note:** Credit memos are only available if you have the Advanced AR Settlement feature enabled. | | invoiceDate | 214.0 and earlier  | [Invoice and Collect](https://www.zuora.com/developer/api-reference/#operation/POST_TransactionInvoicePayment \"Invoice and Collect\") |Date that should appear on the invoice being generated, as `yyyy-mm-dd`. | | invoiceTargetDate | 214.0 and earlier  | [Invoice and Collect](https://www.zuora.com/developer/api-reference/#operation/POST_TransactionInvoicePayment \"Invoice and Collect\") |Date through which to calculate charges on this account if an invoice is generated, as `yyyy-mm-dd`. | | documentDate | 215.0 and later | [Invoice and Collect](https://www.zuora.com/developer/api-reference/#operation/POST_TransactionInvoicePayment \"Invoice and Collect\") |Date that should appear on the invoice and credit memo being generated, as `yyyy-mm-dd`. | | targetDate | 215.0 and later | [Invoice and Collect](https://www.zuora.com/developer/api-reference/#operation/POST_TransactionInvoicePayment \"Invoice and Collect\") |Date through which to calculate charges on this account if an invoice or a credit memo is generated, as `yyyy-mm-dd`. |  #### Version 207.0 and Later  The response structure of the [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview \"Preview Subscription\") and [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\") methods are changed. The following invoice related response fields are moved to the invoice container:    * amount   * amountWithoutTax   * taxAmount   * invoiceItems   * targetDate   * chargeMetrics  # Zuora Object Model  The following diagram presents a high-level view of the key Zuora objects. Click the image to open it in a new tab to resize it.  <a href=\"https://www.zuora.com/wp-content/uploads/2017/01/ZuoraERD.jpeg\" target=\"_blank\"><img src=\"https://www.zuora.com/wp-content/uploads/2017/01/ZuoraERD.jpeg\" alt=\"Zuora Object Model Diagram\"></a>  You can use the [Describe object](https://www.zuora.com/developer/api-reference/#operation/GET_Describe) operation to list the fields of each Zuora object that is available in your tenant. When you call the operation, you must specify the API name of the Zuora object.  The following table provides the API name of each Zuora object:  | Object                                        | API Name                                   | |-----------------------------------------------|--------------------------------------------| | Account                                       | `Account`                                  | | Accounting Code                               | `AccountingCode`                           | | Accounting Period                             | `AccountingPeriod`                         | | Amendment                                     | `Amendment`                                | | Application Group                             | `ApplicationGroup`                         | | Billing Run                                   | `BillingRun`                               | | Contact                                       | `Contact`                                  | | Contact Snapshot                              | `ContactSnapshot`                          | | Credit Balance Adjustment                     | `CreditBalanceAdjustment`                  | | Credit Memo                                   | `CreditMemo`                               | | Credit Memo Application                       | `CreditMemoApplication`                    | | Credit Memo Application Item                  | `CreditMemoApplicationItem`                | | Credit Memo Item                              | `CreditMemoItem`                           | | Credit Memo Part                              | `CreditMemoPart`                           | | Credit Memo Part Item                         | `CreditMemoPartItem`                       | | Credit Taxation Item                          | `CreditTaxationItem`                       | | Custom Exchange Rate                          | `FXCustomRate`                             | | Debit Memo                                    | `DebitMemo`                                | | Debit Memo Item                               | `DebitMemoItem`                            | | Debit Taxation Item                           | `DebitTaxationItem`                        | | Discount Applied Metrics                      | `DiscountAppliedMetrics`                   | | Entity                                        | `Tenant`                                   | | Gateway Reconciliation Event                  | `PaymentGatewayReconciliationEventLog`     | | Gateway Reconciliation Job                    | `PaymentReconciliationJob`                 | | Gateway Reconciliation Log                    | `PaymentReconciliationLog`                 | | Invoice                                       | `Invoice`                                  | | Invoice Adjustment                            | `InvoiceAdjustment`                        | | Invoice Item                                  | `InvoiceItem`                              | | Invoice Item Adjustment                       | `InvoiceItemAdjustment`                    | | Invoice Payment                               | `InvoicePayment`                           | | Journal Entry                                 | `JournalEntry`                             | | Journal Entry Item                            | `JournalEntryItem`                         | | Journal Run                                   | `JournalRun`                               | | Order                                         | `Order`                                    | | Order Action                                  | `OrderAction`                              | | Order MRR                                     | `OrderMrr`                                 | | Order Quantity                                | `OrderQuantity`                            | | Order TCB                                     | `OrderTcb`                                 | | Order TCV                                     | `OrderTcv`                                 | | Payment                                       | `Payment`                                  | | Payment Application                           | `PaymentApplication`                       | | Payment Application Item                      | `PaymentApplicationItem`                   | | Payment Method                                | `PaymentMethod`                            | | Payment Method Snapshot                       | `PaymentMethodSnapshot`                    | | Payment Method Transaction Log                | `PaymentMethodTransactionLog`              | | Payment Method Update                         | `UpdaterDetail`                            | | Payment Part                                  | `PaymentPart`                              | | Payment Part Item                             | `PaymentPartItem`                          | | Payment Run                                   | `PaymentRun`                               | | Payment Transaction Log                       | `PaymentTransactionLog`                    | | Processed Usage                               | `ProcessedUsage`                           | | Product                                       | `Product`                                  | | Product Rate Plan                             | `ProductRatePlan`                          | | Product Rate Plan Charge                      | `ProductRatePlanCharge`                    | | Product Rate Plan Charge Tier                 | `ProductRatePlanChargeTier`                | | Rate Plan                                     | `RatePlan`                                 | | Rate Plan Charge                              | `RatePlanCharge`                           | | Rate Plan Charge Tier                         | `RatePlanChargeTier`                       | | Refund                                        | `Refund`                                   | | Refund Application                            | `RefundApplication`                        | | Refund Application Item                       | `RefundApplicationItem`                    | | Refund Invoice Payment                        | `RefundInvoicePayment`                     | | Refund Part                                   | `RefundPart`                               | | Refund Part Item                              | `RefundPartItem`                           | | Refund Transaction Log                        | `RefundTransactionLog`                     | | Revenue Charge Summary                        | `RevenueChargeSummary`                     | | Revenue Charge Summary Item                   | `RevenueChargeSummaryItem`                 | | Revenue Event                                 | `RevenueEvent`                             | | Revenue Event Credit Memo Item                | `RevenueEventCreditMemoItem`               | | Revenue Event Debit Memo Item                 | `RevenueEventDebitMemoItem`                | | Revenue Event Invoice Item                    | `RevenueEventInvoiceItem`                  | | Revenue Event Invoice Item Adjustment         | `RevenueEventInvoiceItemAdjustment`        | | Revenue Event Item                            | `RevenueEventItem`                         | | Revenue Event Item Credit Memo Item           | `RevenueEventItemCreditMemoItem`           | | Revenue Event Item Debit Memo Item            | `RevenueEventItemDebitMemoItem`            | | Revenue Event Item Invoice Item               | `RevenueEventItemInvoiceItem`              | | Revenue Event Item Invoice Item Adjustment    | `RevenueEventItemInvoiceItemAdjustment`    | | Revenue Event Type                            | `RevenueEventType`                         | | Revenue Schedule                              | `RevenueSchedule`                          | | Revenue Schedule Credit Memo Item             | `RevenueScheduleCreditMemoItem`            | | Revenue Schedule Debit Memo Item              | `RevenueScheduleDebitMemoItem`             | | Revenue Schedule Invoice Item                 | `RevenueScheduleInvoiceItem`               | | Revenue Schedule Invoice Item Adjustment      | `RevenueScheduleInvoiceItemAdjustment`     | | Revenue Schedule Item                         | `RevenueScheduleItem`                      | | Revenue Schedule Item Credit Memo Item        | `RevenueScheduleItemCreditMemoItem`        | | Revenue Schedule Item Debit Memo Item         | `RevenueScheduleItemDebitMemoItem`         | | Revenue Schedule Item Invoice Item            | `RevenueScheduleItemInvoiceItem`           | | Revenue Schedule Item Invoice Item Adjustment | `RevenueScheduleItemInvoiceItemAdjustment` | | Subscription                                  | `Subscription`                             | | Taxable Item Snapshot                         | `TaxableItemSnapshot`                      | | Taxation Item                                 | `TaxationItem`                             | | Updater Batch                                 | `UpdaterBatch`                             | | Usage                                         | `Usage`                                    | 

OpenAPI spec version: 2017-11-15
Contact: docs@zuora.com
Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.3.0-SNAPSHOT

=end

require "uri"

module SwaggerClient
  class OrdersApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # Delete order
    # **Note:** This feature is only available if you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled. We are actively soliciting feedback from a small set of early adopters. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).    Deletes a specified order. All the subscriptions changed by this order are deleted. After the deletion, the subscriptions are rolled back to the previous version.   You are not allowed to delete an order if the charges that are affected by this order are invoiced. 
    # @param order_number The number of the order to be deleted.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :entity_id The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @option opts [String] :entity_name The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @return [CommonResponse]
    def d_elete_order(order_number, opts = {})
      data, _status_code, _headers = d_elete_order_with_http_info(order_number, opts)
      return data
    end

    # Delete order
    # **Note:** This feature is only available if you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled. We are actively soliciting feedback from a small set of early adopters. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).    Deletes a specified order. All the subscriptions changed by this order are deleted. After the deletion, the subscriptions are rolled back to the previous version.   You are not allowed to delete an order if the charges that are affected by this order are invoiced. 
    # @param order_number The number of the order to be deleted.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :entity_id The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @option opts [String] :entity_name The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @return [Array<(CommonResponse, Fixnum, Hash)>] CommonResponse data, response status code and response headers
    def d_elete_order_with_http_info(order_number, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: OrdersApi.d_elete_order ..."
      end
      # verify the required parameter 'order_number' is set
      if @api_client.config.client_side_validation && order_number.nil?
        fail ArgumentError, "Missing the required parameter 'order_number' when calling OrdersApi.d_elete_order"
      end
      # resource path
      local_var_path = "/v1/orders/{orderNumber}".sub('{' + 'orderNumber' + '}', order_number.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json; charset=utf-8'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json; charset=utf-8'])
      header_params[:'entityId'] = opts[:'entity_id'] if !opts[:'entity_id'].nil?
      header_params[:'entityName'] = opts[:'entity_name'] if !opts[:'entity_name'].nil?

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = []
      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'CommonResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: OrdersApi#d_elete_order\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get all orders
    # **Note:** This feature is only available if you have the [Order Metrics](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/Orders_Generation_for_Subscriptions_and_Amendments) feature enabled. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/). We will investigate your use cases and data before enabling this feature for you. If you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled, you already have the Order Metrics feature enabled.   Retrieves information about all orders in your tenant. By default, it returns the first page of the orders.  
    # @param [Hash] opts the optional parameters
    # @option opts [String] :entity_id The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @option opts [String] :entity_name The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @option opts [Integer] :page The page number of the orders retrieved.   (default to 1)
    # @option opts [Integer] :page_size Number of rows returned per page.  (default to 20)
    # @option opts [String] :date_filter_option The date type to filter on.This field value can be orderDate or updatedDate. Default is orderDate. 
    # @option opts [Date] :start_date The result will only contain the orders with the date of dateFilterOption later than or equal to this date. 
    # @option opts [Date] :end_date The result will only contains orders with the date of dateFilterOption earlier than or equal to this date. 
    # @return [GetAllOrdersResponseType]
    def g_et_all_orders(opts = {})
      data, _status_code, _headers = g_et_all_orders_with_http_info(opts)
      return data
    end

    # Get all orders
    # **Note:** This feature is only available if you have the [Order Metrics](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/Orders_Generation_for_Subscriptions_and_Amendments) feature enabled. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/). We will investigate your use cases and data before enabling this feature for you. If you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled, you already have the Order Metrics feature enabled.   Retrieves information about all orders in your tenant. By default, it returns the first page of the orders.  
    # @param [Hash] opts the optional parameters
    # @option opts [String] :entity_id The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @option opts [String] :entity_name The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @option opts [Integer] :page The page number of the orders retrieved.  
    # @option opts [Integer] :page_size Number of rows returned per page. 
    # @option opts [String] :date_filter_option The date type to filter on.This field value can be orderDate or updatedDate. Default is orderDate. 
    # @option opts [Date] :start_date The result will only contain the orders with the date of dateFilterOption later than or equal to this date. 
    # @option opts [Date] :end_date The result will only contains orders with the date of dateFilterOption earlier than or equal to this date. 
    # @return [Array<(GetAllOrdersResponseType, Fixnum, Hash)>] GetAllOrdersResponseType data, response status code and response headers
    def g_et_all_orders_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: OrdersApi.g_et_all_orders ..."
      end
      if @api_client.config.client_side_validation && !opts[:'page_size'].nil? && opts[:'page_size'] > 40
        fail ArgumentError, 'invalid value for "opts[:"page_size"]" when calling OrdersApi.g_et_all_orders, must be smaller than or equal to 40.'
      end

      # resource path
      local_var_path = "/v1/orders"

      # query parameters
      query_params = {}
      query_params[:'page'] = opts[:'page'] if !opts[:'page'].nil?
      query_params[:'pageSize'] = opts[:'page_size'] if !opts[:'page_size'].nil?
      query_params[:'dateFilterOption'] = opts[:'date_filter_option'] if !opts[:'date_filter_option'].nil?
      query_params[:'startDate'] = opts[:'start_date'] if !opts[:'start_date'].nil?
      query_params[:'endDate'] = opts[:'end_date'] if !opts[:'end_date'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json; charset=utf-8'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json; charset=utf-8'])
      header_params[:'entityId'] = opts[:'entity_id'] if !opts[:'entity_id'].nil?
      header_params[:'entityName'] = opts[:'entity_name'] if !opts[:'entity_name'].nil?

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = []
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'GetAllOrdersResponseType')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: OrdersApi#g_et_all_orders\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get an order
    # **Note:** This feature is only available if you have the [Order Metrics](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/Orders_Generation_for_Subscriptions_and_Amendments) feature enabled. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/). We will investigate your use cases and data before enabling this feature for you. If you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled, you already have the Order Metrics feature enabled.   Retrieves the detailed information about a specified order. 
    # @param order_number The order number to be retrieved.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :entity_id The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @option opts [String] :entity_name The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @return [GetOrderResponse]
    def g_et_order(order_number, opts = {})
      data, _status_code, _headers = g_et_order_with_http_info(order_number, opts)
      return data
    end

    # Get an order
    # **Note:** This feature is only available if you have the [Order Metrics](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/Orders_Generation_for_Subscriptions_and_Amendments) feature enabled. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/). We will investigate your use cases and data before enabling this feature for you. If you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled, you already have the Order Metrics feature enabled.   Retrieves the detailed information about a specified order. 
    # @param order_number The order number to be retrieved.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :entity_id The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @option opts [String] :entity_name The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @return [Array<(GetOrderResponse, Fixnum, Hash)>] GetOrderResponse data, response status code and response headers
    def g_et_order_with_http_info(order_number, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: OrdersApi.g_et_order ..."
      end
      # verify the required parameter 'order_number' is set
      if @api_client.config.client_side_validation && order_number.nil?
        fail ArgumentError, "Missing the required parameter 'order_number' when calling OrdersApi.g_et_order"
      end
      # resource path
      local_var_path = "/v1/orders/{orderNumber}".sub('{' + 'orderNumber' + '}', order_number.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json; charset=utf-8'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json; charset=utf-8'])
      header_params[:'entityId'] = opts[:'entity_id'] if !opts[:'entity_id'].nil?
      header_params[:'entityName'] = opts[:'entity_name'] if !opts[:'entity_name'].nil?

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = []
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'GetOrderResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: OrdersApi#g_et_order\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get billing information for order
    # **Note:** This feature is only available if you have the [Order Metrics](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/Orders_Generation_for_Subscriptions_and_Amendments) feature enabled. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/). We will investigate your use cases and data before enabling this feature for you. If you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled, you already have the Order Metrics feature enabled.  Retrieves the billing information about a specified order. The information includes the billed and unbilled amount of the order. 
    # @param order_number The order number.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :entity_id The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @option opts [String] :entity_name The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @option opts [Date] :as_of_date Billing states of the order will be calculated as of this date. Invoices with the invoice date later than this date will not be counted into the billed amount. The default value is today.
    # @return [GetOrderBillingInfoResponseType]
    def g_et_order_billing_info(order_number, opts = {})
      data, _status_code, _headers = g_et_order_billing_info_with_http_info(order_number, opts)
      return data
    end

    # Get billing information for order
    # **Note:** This feature is only available if you have the [Order Metrics](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/Orders_Generation_for_Subscriptions_and_Amendments) feature enabled. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/). We will investigate your use cases and data before enabling this feature for you. If you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled, you already have the Order Metrics feature enabled.  Retrieves the billing information about a specified order. The information includes the billed and unbilled amount of the order. 
    # @param order_number The order number.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :entity_id The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @option opts [String] :entity_name The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @option opts [Date] :as_of_date Billing states of the order will be calculated as of this date. Invoices with the invoice date later than this date will not be counted into the billed amount. The default value is today.
    # @return [Array<(GetOrderBillingInfoResponseType, Fixnum, Hash)>] GetOrderBillingInfoResponseType data, response status code and response headers
    def g_et_order_billing_info_with_http_info(order_number, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: OrdersApi.g_et_order_billing_info ..."
      end
      # verify the required parameter 'order_number' is set
      if @api_client.config.client_side_validation && order_number.nil?
        fail ArgumentError, "Missing the required parameter 'order_number' when calling OrdersApi.g_et_order_billing_info"
      end
      # resource path
      local_var_path = "/v1/orders/{orderNumber}/billingInfo".sub('{' + 'orderNumber' + '}', order_number.to_s)

      # query parameters
      query_params = {}
      query_params[:'asOfDate'] = opts[:'as_of_date'] if !opts[:'as_of_date'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json; charset=utf-8'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json; charset=utf-8'])
      header_params[:'entityId'] = opts[:'entity_id'] if !opts[:'entity_id'].nil?
      header_params[:'entityName'] = opts[:'entity_name'] if !opts[:'entity_name'].nil?

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = []
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'GetOrderBillingInfoResponseType')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: OrdersApi#g_et_order_billing_info\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get order metrics for evergreen subscription
    # **Note:** This feature is only available if you have the [Order Metrics](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/Orders_Generation_for_Subscriptions_and_Amendments) feature enabled. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/). We will investigate your use cases and data before enabling this feature for you. If you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled, you already have the Order Metrics feature enabled.   Retrieves the metrics of an evergreen subscription in a specified order. 
    # @param order_number The order number. 
    # @param subscription_number The subscription number you want to get the metrics for. 
    # @param start_date The start date of the date range for which you want to get the metrics. The date must be in yyyy-mm-dd format. For example, 2017-12-03. 
    # @param end_date The end date of the date range for which you want to get the metrics. The date must be in yyyy-mm-dd format. For example, 2017-12-03. 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :entity_id The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @option opts [String] :entity_name The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @return [GetOrderResponse]
    def g_et_order_metricsfor_evergreen_subscription(order_number, subscription_number, start_date, end_date, opts = {})
      data, _status_code, _headers = g_et_order_metricsfor_evergreen_subscription_with_http_info(order_number, subscription_number, start_date, end_date, opts)
      return data
    end

    # Get order metrics for evergreen subscription
    # **Note:** This feature is only available if you have the [Order Metrics](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/Orders_Generation_for_Subscriptions_and_Amendments) feature enabled. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/). We will investigate your use cases and data before enabling this feature for you. If you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled, you already have the Order Metrics feature enabled.   Retrieves the metrics of an evergreen subscription in a specified order. 
    # @param order_number The order number. 
    # @param subscription_number The subscription number you want to get the metrics for. 
    # @param start_date The start date of the date range for which you want to get the metrics. The date must be in yyyy-mm-dd format. For example, 2017-12-03. 
    # @param end_date The end date of the date range for which you want to get the metrics. The date must be in yyyy-mm-dd format. For example, 2017-12-03. 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :entity_id The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @option opts [String] :entity_name The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @return [Array<(GetOrderResponse, Fixnum, Hash)>] GetOrderResponse data, response status code and response headers
    def g_et_order_metricsfor_evergreen_subscription_with_http_info(order_number, subscription_number, start_date, end_date, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: OrdersApi.g_et_order_metricsfor_evergreen_subscription ..."
      end
      # verify the required parameter 'order_number' is set
      if @api_client.config.client_side_validation && order_number.nil?
        fail ArgumentError, "Missing the required parameter 'order_number' when calling OrdersApi.g_et_order_metricsfor_evergreen_subscription"
      end
      # verify the required parameter 'subscription_number' is set
      if @api_client.config.client_side_validation && subscription_number.nil?
        fail ArgumentError, "Missing the required parameter 'subscription_number' when calling OrdersApi.g_et_order_metricsfor_evergreen_subscription"
      end
      # verify the required parameter 'start_date' is set
      if @api_client.config.client_side_validation && start_date.nil?
        fail ArgumentError, "Missing the required parameter 'start_date' when calling OrdersApi.g_et_order_metricsfor_evergreen_subscription"
      end
      # verify the required parameter 'end_date' is set
      if @api_client.config.client_side_validation && end_date.nil?
        fail ArgumentError, "Missing the required parameter 'end_date' when calling OrdersApi.g_et_order_metricsfor_evergreen_subscription"
      end
      # resource path
      local_var_path = "/v1/orders/{orderNumber}/evergreenMetrics/{subscriptionNumber}".sub('{' + 'orderNumber' + '}', order_number.to_s).sub('{' + 'subscriptionNumber' + '}', subscription_number.to_s)

      # query parameters
      query_params = {}
      query_params[:'startDate'] = start_date
      query_params[:'endDate'] = end_date

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json; charset=utf-8'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json; charset=utf-8'])
      header_params[:'entityId'] = opts[:'entity_id'] if !opts[:'entity_id'].nil?
      header_params[:'entityName'] = opts[:'entity_name'] if !opts[:'entity_name'].nil?

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = []
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'GetOrderResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: OrdersApi#g_et_order_metricsfor_evergreen_subscription\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get rated result for order
    # **Note:** This feature is only available if you have the [Order Metrics](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/Orders_Generation_for_Subscriptions_and_Amendments) feature enabled. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/). We will investigate your use cases and data before enabling this feature for you. If you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled, you already have the Order Metrics feature enabled.  Retrieves the rated results of all the subscriptions in the specified order. 
    # @param order_number The order number.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :entity_id The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @option opts [String] :entity_name The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @return [GetOrderRatedResultResponseType]
    def g_et_order_rated_result(order_number, opts = {})
      data, _status_code, _headers = g_et_order_rated_result_with_http_info(order_number, opts)
      return data
    end

    # Get rated result for order
    # **Note:** This feature is only available if you have the [Order Metrics](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/Orders_Generation_for_Subscriptions_and_Amendments) feature enabled. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/). We will investigate your use cases and data before enabling this feature for you. If you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled, you already have the Order Metrics feature enabled.  Retrieves the rated results of all the subscriptions in the specified order. 
    # @param order_number The order number.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :entity_id The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @option opts [String] :entity_name The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @return [Array<(GetOrderRatedResultResponseType, Fixnum, Hash)>] GetOrderRatedResultResponseType data, response status code and response headers
    def g_et_order_rated_result_with_http_info(order_number, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: OrdersApi.g_et_order_rated_result ..."
      end
      # verify the required parameter 'order_number' is set
      if @api_client.config.client_side_validation && order_number.nil?
        fail ArgumentError, "Missing the required parameter 'order_number' when calling OrdersApi.g_et_order_rated_result"
      end
      # resource path
      local_var_path = "/v1/orders/{orderNumber}/ratedResults".sub('{' + 'orderNumber' + '}', order_number.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json; charset=utf-8'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json; charset=utf-8'])
      header_params[:'entityId'] = opts[:'entity_id'] if !opts[:'entity_id'].nil?
      header_params[:'entityName'] = opts[:'entity_name'] if !opts[:'entity_name'].nil?

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = []
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'GetOrderRatedResultResponseType')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: OrdersApi#g_et_order_rated_result\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get orders by invoice owner
    # **Note:** This feature is only available if you have the [Order Metrics](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/Orders_Generation_for_Subscriptions_and_Amendments) feature enabled. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/). We will investigate your use cases and data before enabling this feature for you. If you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled, you already have the Order Metrics feature enabled.  Retrieves the detailed information about all orders for a specified invoice owner. 
    # @param account_number The invoice owner account number.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :entity_id The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @option opts [String] :entity_name The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @option opts [Integer] :page The page number of the orders retrieved. The default is 1. 
    # @option opts [Integer] :page_size Number of rows returned per page.  (default to 20)
    # @option opts [String] :date_filter_option The date type to filter on. This field value can be orderDate or updatedDate. Default is orderDate. 
    # @option opts [Date] :start_date The result will only contain the orders with the date of dateFilterOption later than or equal to this date. 
    # @option opts [Date] :end_date The result will only contain the orders with the date of dateFilterOption earlier than or equal to this date. 
    # @return [GetOrdersResponse]
    def g_et_orders_by_invoice_owner(account_number, opts = {})
      data, _status_code, _headers = g_et_orders_by_invoice_owner_with_http_info(account_number, opts)
      return data
    end

    # Get orders by invoice owner
    # **Note:** This feature is only available if you have the [Order Metrics](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/Orders_Generation_for_Subscriptions_and_Amendments) feature enabled. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/). We will investigate your use cases and data before enabling this feature for you. If you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled, you already have the Order Metrics feature enabled.  Retrieves the detailed information about all orders for a specified invoice owner. 
    # @param account_number The invoice owner account number.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :entity_id The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @option opts [String] :entity_name The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @option opts [Integer] :page The page number of the orders retrieved. The default is 1. 
    # @option opts [Integer] :page_size Number of rows returned per page. 
    # @option opts [String] :date_filter_option The date type to filter on. This field value can be orderDate or updatedDate. Default is orderDate. 
    # @option opts [Date] :start_date The result will only contain the orders with the date of dateFilterOption later than or equal to this date. 
    # @option opts [Date] :end_date The result will only contain the orders with the date of dateFilterOption earlier than or equal to this date. 
    # @return [Array<(GetOrdersResponse, Fixnum, Hash)>] GetOrdersResponse data, response status code and response headers
    def g_et_orders_by_invoice_owner_with_http_info(account_number, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: OrdersApi.g_et_orders_by_invoice_owner ..."
      end
      # verify the required parameter 'account_number' is set
      if @api_client.config.client_side_validation && account_number.nil?
        fail ArgumentError, "Missing the required parameter 'account_number' when calling OrdersApi.g_et_orders_by_invoice_owner"
      end
      if @api_client.config.client_side_validation && !opts[:'page_size'].nil? && opts[:'page_size'] > 40
        fail ArgumentError, 'invalid value for "opts[:"page_size"]" when calling OrdersApi.g_et_orders_by_invoice_owner, must be smaller than or equal to 40.'
      end

      # resource path
      local_var_path = "/v1/orders/invoiceOwner/{accountNumber}".sub('{' + 'accountNumber' + '}', account_number.to_s)

      # query parameters
      query_params = {}
      query_params[:'page'] = opts[:'page'] if !opts[:'page'].nil?
      query_params[:'pageSize'] = opts[:'page_size'] if !opts[:'page_size'].nil?
      query_params[:'dateFilterOption'] = opts[:'date_filter_option'] if !opts[:'date_filter_option'].nil?
      query_params[:'startDate'] = opts[:'start_date'] if !opts[:'start_date'].nil?
      query_params[:'endDate'] = opts[:'end_date'] if !opts[:'end_date'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json; charset=utf-8'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json; charset=utf-8'])
      header_params[:'entityId'] = opts[:'entity_id'] if !opts[:'entity_id'].nil?
      header_params[:'entityName'] = opts[:'entity_name'] if !opts[:'entity_name'].nil?

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = []
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'GetOrdersResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: OrdersApi#g_et_orders_by_invoice_owner\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get orders by subscription number
    # **Note:** This feature is only available if you have the [Order Metrics](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/Orders_Generation_for_Subscriptions_and_Amendments) feature enabled. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/). We will investigate your use cases and data before enabling this feature for you. If you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled, you already have the Order Metrics feature enabled.  Retrieves the detailed information about all orders for a specified subscription. Any orders containing the changes on the specified subscription are returned. 
    # @param subscription_number The subscription number.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :entity_id The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @option opts [String] :entity_name The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @option opts [Integer] :page The page number of the orders retrieved. The default is &#39;1&#39;. 
    # @option opts [Integer] :page_size Number of rows returned per page.  (default to 20)
    # @option opts [String] :date_filter_option The date type to filter on. This field value can be &#39;orderDate&#39; or &#39;updatedDate&#39;. Default is orderDate. 
    # @option opts [Date] :start_date The result will only contain the orders with the date of &#39;dateFilterOption&#39; later than or equal to this date. 
    # @option opts [Date] :end_date The result will only contain the orders with the date of &#39;dateFilterOption&#39; earlier than or equal to this date. 
    # @return [GetOrdersResponse]
    def g_et_orders_by_subscription_number(subscription_number, opts = {})
      data, _status_code, _headers = g_et_orders_by_subscription_number_with_http_info(subscription_number, opts)
      return data
    end

    # Get orders by subscription number
    # **Note:** This feature is only available if you have the [Order Metrics](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/Orders_Generation_for_Subscriptions_and_Amendments) feature enabled. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/). We will investigate your use cases and data before enabling this feature for you. If you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled, you already have the Order Metrics feature enabled.  Retrieves the detailed information about all orders for a specified subscription. Any orders containing the changes on the specified subscription are returned. 
    # @param subscription_number The subscription number.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :entity_id The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @option opts [String] :entity_name The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @option opts [Integer] :page The page number of the orders retrieved. The default is &#39;1&#39;. 
    # @option opts [Integer] :page_size Number of rows returned per page. 
    # @option opts [String] :date_filter_option The date type to filter on. This field value can be &#39;orderDate&#39; or &#39;updatedDate&#39;. Default is orderDate. 
    # @option opts [Date] :start_date The result will only contain the orders with the date of &#39;dateFilterOption&#39; later than or equal to this date. 
    # @option opts [Date] :end_date The result will only contain the orders with the date of &#39;dateFilterOption&#39; earlier than or equal to this date. 
    # @return [Array<(GetOrdersResponse, Fixnum, Hash)>] GetOrdersResponse data, response status code and response headers
    def g_et_orders_by_subscription_number_with_http_info(subscription_number, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: OrdersApi.g_et_orders_by_subscription_number ..."
      end
      # verify the required parameter 'subscription_number' is set
      if @api_client.config.client_side_validation && subscription_number.nil?
        fail ArgumentError, "Missing the required parameter 'subscription_number' when calling OrdersApi.g_et_orders_by_subscription_number"
      end
      if @api_client.config.client_side_validation && !opts[:'page_size'].nil? && opts[:'page_size'] > 40
        fail ArgumentError, 'invalid value for "opts[:"page_size"]" when calling OrdersApi.g_et_orders_by_subscription_number, must be smaller than or equal to 40.'
      end

      # resource path
      local_var_path = "/v1/orders/subscription/{subscriptionNumber}".sub('{' + 'subscriptionNumber' + '}', subscription_number.to_s)

      # query parameters
      query_params = {}
      query_params[:'page'] = opts[:'page'] if !opts[:'page'].nil?
      query_params[:'pageSize'] = opts[:'page_size'] if !opts[:'page_size'].nil?
      query_params[:'dateFilterOption'] = opts[:'date_filter_option'] if !opts[:'date_filter_option'].nil?
      query_params[:'startDate'] = opts[:'start_date'] if !opts[:'start_date'].nil?
      query_params[:'endDate'] = opts[:'end_date'] if !opts[:'end_date'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json; charset=utf-8'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json; charset=utf-8'])
      header_params[:'entityId'] = opts[:'entity_id'] if !opts[:'entity_id'].nil?
      header_params[:'entityName'] = opts[:'entity_name'] if !opts[:'entity_name'].nil?

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = []
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'GetOrdersResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: OrdersApi#g_et_orders_by_subscription_number\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get orders by subscription owner
    # **Note:** This feature is only available if you have the [Order Metrics](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/Orders_Generation_for_Subscriptions_and_Amendments) feature enabled. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/). We will investigate your use cases and data before enabling this feature for you. If you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled, you already have the Order Metrics feature enabled.  Retrieves the detailed information about all orders for a specified subscription owner. Any orders containing the changes on the subscriptions owned by this account are returned. 
    # @param account_number The subscription owner account number.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :entity_id The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @option opts [String] :entity_name The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @option opts [Integer] :page The page number of the orders retrieved. The default is 1. 
    # @option opts [Integer] :page_size Number of rows returned per page.  (default to 20)
    # @option opts [String] :date_filter_option The date type to filter on. This field value can be &#39;orderDate&#39; or &#39;updatedDate&#39;. Default is orderDate. 
    # @option opts [Date] :start_date The result will only contain the orders with the date of &#39;dateFilterOption&#39; later than or equal to this date. 
    # @option opts [Date] :end_date The result will only contain the orders with the date of &#39;dateFilterOption&#39; earlier than or equal to this date. 
    # @return [GetOrdersResponse]
    def g_et_orders_by_subscription_owner(account_number, opts = {})
      data, _status_code, _headers = g_et_orders_by_subscription_owner_with_http_info(account_number, opts)
      return data
    end

    # Get orders by subscription owner
    # **Note:** This feature is only available if you have the [Order Metrics](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/Orders_Generation_for_Subscriptions_and_Amendments) feature enabled. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/). We will investigate your use cases and data before enabling this feature for you. If you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled, you already have the Order Metrics feature enabled.  Retrieves the detailed information about all orders for a specified subscription owner. Any orders containing the changes on the subscriptions owned by this account are returned. 
    # @param account_number The subscription owner account number.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :entity_id The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @option opts [String] :entity_name The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @option opts [Integer] :page The page number of the orders retrieved. The default is 1. 
    # @option opts [Integer] :page_size Number of rows returned per page. 
    # @option opts [String] :date_filter_option The date type to filter on. This field value can be &#39;orderDate&#39; or &#39;updatedDate&#39;. Default is orderDate. 
    # @option opts [Date] :start_date The result will only contain the orders with the date of &#39;dateFilterOption&#39; later than or equal to this date. 
    # @option opts [Date] :end_date The result will only contain the orders with the date of &#39;dateFilterOption&#39; earlier than or equal to this date. 
    # @return [Array<(GetOrdersResponse, Fixnum, Hash)>] GetOrdersResponse data, response status code and response headers
    def g_et_orders_by_subscription_owner_with_http_info(account_number, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: OrdersApi.g_et_orders_by_subscription_owner ..."
      end
      # verify the required parameter 'account_number' is set
      if @api_client.config.client_side_validation && account_number.nil?
        fail ArgumentError, "Missing the required parameter 'account_number' when calling OrdersApi.g_et_orders_by_subscription_owner"
      end
      if @api_client.config.client_side_validation && !opts[:'page_size'].nil? && opts[:'page_size'] > 40
        fail ArgumentError, 'invalid value for "opts[:"page_size"]" when calling OrdersApi.g_et_orders_by_subscription_owner, must be smaller than or equal to 40.'
      end

      # resource path
      local_var_path = "/v1/orders/subscriptionOwner/{accountNumber}".sub('{' + 'accountNumber' + '}', account_number.to_s)

      # query parameters
      query_params = {}
      query_params[:'page'] = opts[:'page'] if !opts[:'page'].nil?
      query_params[:'pageSize'] = opts[:'page_size'] if !opts[:'page_size'].nil?
      query_params[:'dateFilterOption'] = opts[:'date_filter_option'] if !opts[:'date_filter_option'].nil?
      query_params[:'startDate'] = opts[:'start_date'] if !opts[:'start_date'].nil?
      query_params[:'endDate'] = opts[:'end_date'] if !opts[:'end_date'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json; charset=utf-8'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json; charset=utf-8'])
      header_params[:'entityId'] = opts[:'entity_id'] if !opts[:'entity_id'].nil?
      header_params[:'entityName'] = opts[:'entity_name'] if !opts[:'entity_name'].nil?

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = []
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'GetOrdersResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: OrdersApi#g_et_orders_by_subscription_owner\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create and activate order
    # **Note:** This feature is only available if you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled. We are actively soliciting feedback from a small set of early adopters. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).    Creates and activates an order. You can create subscriptions and make changes to subscriptions by creating orders. Creating a draft order is currently not supported.  See [Known Limitations in Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/C_Known_Limitations_in_Orders) for more information. 
    # @param body 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :entity_id The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @option opts [String] :entity_name The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @return [PostOrderResponseType]
    def p_ost_order(body, opts = {})
      data, _status_code, _headers = p_ost_order_with_http_info(body, opts)
      return data
    end

    # Create and activate order
    # **Note:** This feature is only available if you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled. We are actively soliciting feedback from a small set of early adopters. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).    Creates and activates an order. You can create subscriptions and make changes to subscriptions by creating orders. Creating a draft order is currently not supported.  See [Known Limitations in Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/C_Known_Limitations_in_Orders) for more information. 
    # @param body 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :entity_id The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @option opts [String] :entity_name The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @return [Array<(PostOrderResponseType, Fixnum, Hash)>] PostOrderResponseType data, response status code and response headers
    def p_ost_order_with_http_info(body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: OrdersApi.p_ost_order ..."
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling OrdersApi.p_ost_order"
      end
      # resource path
      local_var_path = "/v1/orders"

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json; charset=utf-8'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json; charset=utf-8'])
      header_params[:'entityId'] = opts[:'entity_id'] if !opts[:'entity_id'].nil?
      header_params[:'entityName'] = opts[:'entity_name'] if !opts[:'entity_name'].nil?

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(body)
      auth_names = []
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'PostOrderResponseType')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: OrdersApi#p_ost_order\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Preview order
    # **Note:** This feature is only available if you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled. We are actively soliciting feedback from a small set of early adopters. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).    Retrieves the preview of the charge metrics and invoice items of a specified order. This operation is only an order preview and no order is created. 
    # @param body 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :entity_id The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @option opts [String] :entity_name The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @return [PostOrderPreviewResponseType]
    def p_ost_preview_order(body, opts = {})
      data, _status_code, _headers = p_ost_preview_order_with_http_info(body, opts)
      return data
    end

    # Preview order
    # **Note:** This feature is only available if you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled. We are actively soliciting feedback from a small set of early adopters. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).    Retrieves the preview of the charge metrics and invoice items of a specified order. This operation is only an order preview and no order is created. 
    # @param body 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :entity_id The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @option opts [String] :entity_name The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @return [Array<(PostOrderPreviewResponseType, Fixnum, Hash)>] PostOrderPreviewResponseType data, response status code and response headers
    def p_ost_preview_order_with_http_info(body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: OrdersApi.p_ost_preview_order ..."
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling OrdersApi.p_ost_preview_order"
      end
      # resource path
      local_var_path = "/v1/orders/preview"

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json; charset=utf-8'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json; charset=utf-8'])
      header_params[:'entityId'] = opts[:'entity_id'] if !opts[:'entity_id'].nil?
      header_params[:'entityName'] = opts[:'entity_name'] if !opts[:'entity_name'].nil?

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(body)
      auth_names = []
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'PostOrderPreviewResponseType')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: OrdersApi#p_ost_preview_order\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update order custom fields
    # **Note:** This feature is only available if you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled. We are actively soliciting feedback from a small set of early adopters. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Updates the custom fields of a specified order. 
    # @param order_number The order number.
    # @param body 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :entity_id The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @option opts [String] :entity_name The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @return [CommonResponse]
    def p_ut_update_order_custom_fields(order_number, body, opts = {})
      data, _status_code, _headers = p_ut_update_order_custom_fields_with_http_info(order_number, body, opts)
      return data
    end

    # Update order custom fields
    # **Note:** This feature is only available if you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled. We are actively soliciting feedback from a small set of early adopters. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Updates the custom fields of a specified order. 
    # @param order_number The order number.
    # @param body 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :entity_id The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @option opts [String] :entity_name The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
    # @return [Array<(CommonResponse, Fixnum, Hash)>] CommonResponse data, response status code and response headers
    def p_ut_update_order_custom_fields_with_http_info(order_number, body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: OrdersApi.p_ut_update_order_custom_fields ..."
      end
      # verify the required parameter 'order_number' is set
      if @api_client.config.client_side_validation && order_number.nil?
        fail ArgumentError, "Missing the required parameter 'order_number' when calling OrdersApi.p_ut_update_order_custom_fields"
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling OrdersApi.p_ut_update_order_custom_fields"
      end
      # resource path
      local_var_path = "/v1/orders/{orderNumber}/customFields".sub('{' + 'orderNumber' + '}', order_number.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json; charset=utf-8'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json; charset=utf-8'])
      header_params[:'entityId'] = opts[:'entity_id'] if !opts[:'entity_id'].nil?
      header_params[:'entityName'] = opts[:'entity_name'] if !opts[:'entity_name'].nil?

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(body)
      auth_names = []
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'CommonResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: OrdersApi#p_ut_update_order_custom_fields\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
