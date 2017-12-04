=begin
#Zuora API Reference

#  # Introduction Welcome to the reference for the Zuora REST API!  <a href=\"http://en.wikipedia.org/wiki/REST_API\" target=\"_blank\">REST</a> is a web-service protocol that lends itself to rapid development by using everyday HTTP and JSON technology.  The Zuora REST API provides a broad set of operations and resources that:    * Enable Web Storefront integration from your website.   * Support self-service subscriber sign-ups and account management.   * Process revenue schedules through custom revenue rule models.   * Enable manipulation of most objects in the Zuora Object Model.      ## Endpoints      The Zuora REST API is provided via the following endpoints.   | Tenant              | Base URL for REST Endpoints |   |-------------------------|-------------------------|   |US Production | https://rest.zuora.com   |   |US API Sandbox    | https://rest.apisandbox.zuora.com|   |US Performance Test | https://rest.pt1.zuora.com |   |EU Production | https://rest.eu.zuora.com |   |EU Sandbox | https://rest.sandbox.eu.zuora.com |      The production endpoint provides access to your live user data. The API Sandbox tenant is a good place to test your code without affecting real-world data. To use it, you must be provisioned with an API Sandbox tenant - your Zuora representative can help you if needed.      ## Access to the API      If you have a Zuora tenant, you already have access to the API.      If you don't have a Zuora tenant, go to <a href=\" https://www.zuora.com/resource/zuora-test-drive\" target=\"_blank\">https://www.zuora.com/resource/zuora-test-drive</a> and sign up for a Production Test Drive tenant. The tenant comes with seed data, such as a sample product catalog.  We recommend that you <a href=\"https://knowledgecenter.zuora.com/CF_Users_and_Administrators/A_Administrator_Settings/Manage_Users/Create_an_API_User\" target=\"_blank\">create an API user</a> specifically for making API calls. Don't log in to the Zuora UI with this account. Logging in to the UI enables a security feature that periodically expires the account's password, which may eventually cause authentication failures with the API. Note that a user role does not have write access to Zuora REST services unless it has the API Write Access permission as described in those instructions.   # API Changelog You can find the <a href=\"https://community.zuora.com/t5/Developers/API-Changelog/gpm-p/18092\" target=\"_blank\">Changelog</a> of the API Reference in the Zuora Community.   # Authentication  ## OAuth v2.0  Zuora recommends that you use OAuth v2.0 to authenticate to the Zuora REST API. Currently, OAuth is not available in every environment. See [Zuora Testing Environments](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/D_Zuora_Environments) for more information.  Authenticating via OAuth requires the following steps: 1. Create a Client 2. Generate a Token  ### Create a Client  You must first [create an OAuth client](https://knowledgecenter.zuora.com/CF_Users_and_Administrators/A_Administrator_Settings/Manage_Users#Create_an_OAuth_Client_for_a_User) in the Zuora UI. To do this, you must be an administrator of your Zuora tenant. This is a one-time operation. You will be provided with a Client ID and a Client Secret. Please note this information down, as it will be required for the next step.  **Note:** The OAuth client will be owned by a Zuora user account. If you want to perform PUT, POST, or DELETE operations using the OAuth client, the owner of the OAuth client must have a Platform role that includes the \"API Write Access\" permission.  ### Generate a Token  After creating a client, you must make a call to obtain a bearer token using the [Generate an OAuth token](https://www.zuora.com/developer/api-reference/#operation/createToken) operation. This operation requires the following parameters: - `client_id` - the Client ID displayed when you created the OAuth client in the previous step - `client_secret` - the Client Secret displayed when you created the OAuth client in the previous step - `grant_type` - must be set to `client_credentials`  **Note**: The Client ID and Client Secret mentioned above were displayed when you created the OAuth Client in the prior step. The [Generate an OAuth token](https://www.zuora.com/developer/api-reference/#operation/createToken) response specifies how long the bearer token is valid for. Call [Generate an OAuth token](https://www.zuora.com/developer/api-reference/#operation/createToken) again to generate a new bearer token.  For every subsequent API request, a valid bearer token must be provided in an HTTP header:  `Authorization: Bearer {bearer_token}`     ## Other Supported Authentication Schemes  Zuora continues to support the following additional legacy means of authentication:    * Use username and password. Include authentication with each request in the header:         * `apiAccessKeyId`      * `apiSecretAccessKey`     * `entityId` or `entityName` (Only for [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity \"Multi-entity\"). See \"Entity Id and Entity Name\" below for more information.)    * Use an authorization cookie. The cookie authorizes the user to make calls to the REST API for the duration specified in  **Administration > Security Policies > Session timeout**. The cookie expiration time is reset with this duration after every call to the REST API. To obtain a cookie, call the REST  `connections` resource with the following API user information:         *   ID         *   password     *   entity Id or entity name (Only for [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity \"Multi-entity\"). See \"Entity Id and Entity Name\" below for more information.)         * For CORS-enabled APIs only: Include a 'single-use' token in the request header, which re-authenticates the user with each request. See below for more details.  ### Entity Id and Entity Name  The `entityId` and `entityName` parameters are only used for [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity \"Zuora Multi-entity\").   The  `entityId` and `entityName` parameters specify the Id and the [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name \"Introduction to Entity and Entity Hierarchy\") that you want to access, respectively. Note that you must have permission to access the entity.   You can specify either the `entityId` or `entityName` parameter in the authentication to access and view an entity.    * If both `entityId` and `entityName` are specified in the authentication, an error occurs.    * If neither `entityId` nor `entityName` is specified in the authentication, you will log in to the entity in which your user account is created.      To get the entity Id and entity name, you can use the GET Entities REST call. For more information, see [API User Authentication](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/A_Overview_of_Multi-entity#API_User_Authentication \"API User Authentication\").      ### Token Authentication for CORS-Enabled APIs      The CORS mechanism enables REST API calls to Zuora to be made directly from your customer's browser, with all credit card and security information transmitted directly to Zuora. This minimizes your PCI compliance burden, allows you to implement advanced validation on your payment forms, and  makes your payment forms look just like any other part of your website.    For security reasons, instead of using cookies, an API request via CORS uses **tokens** for authentication.  The token method of authentication is only designed for use with requests that must originate from your customer's browser; **it should  not be considered a replacement to the existing cookie authentication** mechanism.  See [Zuora CORS REST](https://knowledgecenter.zuora.com/DC_Developers/REST_API/A_REST_basics/G_CORS_REST \"Zuora CORS REST\") for details on how CORS works and how you can begin to implement customer calls to the Zuora REST APIs. See  [HMAC Signatures](https://www.zuora.com/developer/api-reference/#operation/POSTHMACSignature \"HMAC Signatures\") for details on the HMAC method that returns the authentication token.  # Requests and Responses  ## Request IDs  As a general rule, when asked to supply a \"key\" for an account or subscription (accountKey, account-key, subscriptionKey, subscription-key), you can provide either the actual ID or  the number of the entity.  ## HTTP Request Body  Most of the parameters and data accompanying your requests will be contained in the body of the HTTP request.   The Zuora REST API accepts JSON in the HTTP request body. No other data format (e.g., XML) is supported.  ### Data Type  ([Actions](https://www.zuora.com/developer/api-reference/#tag/Actions) and CRUD operations only) We recommend that you do not specify the decimal values with quotation marks, commas, and spaces. Use characters of `+-0-9.eE`, for example, `5`, `1.9`, `-8.469`, and `7.7e2`. Also, Zuora does not convert currencies for decimal values.  ## Testing a Request  Use a third party client, such as [curl](https://curl.haxx.se \"curl\"), [Postman](https://www.getpostman.com \"Postman\"), or [Advanced REST Client](https://advancedrestclient.com \"Advanced REST Client\"), to test the Zuora REST API.  You can test the Zuora REST API from the Zuora API Sandbox or Production tenants. If connecting to Production, bear in mind that you are working with your live production data, not sample data or test data.  ## Testing with Credit Cards  Sooner or later it will probably be necessary to test some transactions that involve credit cards. For suggestions on how to handle this, see [Going Live With Your Payment Gateway](https://knowledgecenter.zuora.com/CB_Billing/M_Payment_Gateways/C_Managing_Payment_Gateways/B_Going_Live_Payment_Gateways#Testing_with_Credit_Cards \"C_Zuora_User_Guides/A_Billing_and_Payments/M_Payment_Gateways/C_Managing_Payment_Gateways/B_Going_Live_Payment_Gateways#Testing_with_Credit_Cards\" ).  ## Concurrent Request Limits  Zuora enforces tenant-level concurrent request limits. See <a href=\"https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Policies/Concurrent_Request_Limits\" target=\"_blank\">Concurrent Request Limits</a> for more information.    ## Error Handling  Responses and error codes are detailed in [Responses and errors](https://knowledgecenter.zuora.com/DC_Developers/REST_API/A_REST_basics/3_Responses_and_errors \"Responses and errors\").  # Pagination  When retrieving information (using GET methods), the optional `pageSize` query parameter sets the maximum number of rows to return in a response. The maximum is `40`; larger values are treated as `40`. If this value is empty or invalid, `pageSize` typically defaults to `10`.  The default value for the maximum number of rows retrieved can be overridden at the method level.  If more rows are available, the response will include a `nextPage` element, which contains a URL for requesting the next page.  If this value is not provided, no more rows are available. No \"previous page\" element is explicitly provided; to support backward paging, use the previous call.  ## Array Size  For data items that are not paginated, the REST API supports arrays of up to 300 rows.  Thus, for instance, repeated pagination can retrieve thousands of customer accounts, but within any account an array of no more than 300 rate plans is returned.  # API Versions  The Zuora REST API are version controlled. Versioning ensures that Zuora REST API changes are backward compatible. Zuora uses a major and minor version nomenclature to manage changes. By specifying a version in a REST request, you can get expected responses regardless of future changes to the API.  ## Major Version  The major version number of the REST API appears in the REST URL. Currently, Zuora only supports the **v1** major version. For example, `POST https://rest.zuora.com/v1/subscriptions`.  ## Minor Version  Zuora uses minor versions for the REST API to control small changes. For example, a field in a REST method is deprecated and a new field is used to replace it.   Some fields in the REST methods are supported as of minor versions. If a field is not noted with a minor version, this field is available for all minor versions. If a field is noted with a minor version, this field is in version control. You must specify the supported minor version in the request header to process without an error.   If a field is in version control, it is either with a minimum minor version or a maximum minor version, or both of them. You can only use this field with the minor version between the minimum and the maximum minor versions. For example, the `invoiceCollect` field in the POST Subscription method is in version control and its maximum minor version is 189.0. You can only use this field with the minor version 189.0 or earlier.  If you specify a version number in the request header that is not supported, Zuora will use the minimum minor version of the REST API. In our REST API documentation, if a field or feature requires a minor version number, we note that in the field description.  You only need to specify the version number when you use the fields require a minor version. To specify the minor version, set the `zuora-version` parameter to the minor version number in the request header for the request call. For example, the `collect` field is in 196.0 minor version. If you want to use this field for the POST Subscription method, set the  `zuora-version` parameter to `196.0` in the request header. The `zuora-version` parameter is case sensitive.  For all the REST API fields, by default, if the minor version is not specified in the request header, Zuora will use the minimum minor version of the REST API to avoid breaking your integration.   ### Minor Version History  The supported minor versions are not serial. This section documents the changes made to each Zuora REST API minor version.  The following table lists the supported versions and the fields that have a Zuora REST API minor version.  | Fields         | Minor Version      | REST Methods    | Description | |:--------|:--------|:--------|:--------| | invoiceCollect | 189.0 and earlier  | [Create Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_Subscription \"Create Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\"); [Renew Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_RenewSubscription \"Renew Subscription\"); [Cancel Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_CancelSubscription \"Cancel Subscription\"); [Suspend Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_SuspendSubscription \"Suspend Subscription\"); [Resume Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_ResumeSubscription \"Resume Subscription\"); [Create Account](https://www.zuora.com/developer/api-reference/#operation/POST_Account \"Create Account\")|Generates an invoice and collects a payment for a subscription. | | collect        | 196.0 and later    | [Create Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_Subscription \"Create Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\"); [Renew Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_RenewSubscription \"Renew Subscription\"); [Cancel Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_CancelSubscription \"Cancel Subscription\"); [Suspend Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_SuspendSubscription \"Suspend Subscription\"); [Resume Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_ResumeSubscription \"Resume Subscription\"); [Create Account](https://www.zuora.com/developer/api-reference/#operation/POST_Account \"Create Account\")|Collects an automatic payment for a subscription. | | invoice | 196.0 and 207.0| [Create Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_Subscription \"Create Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\"); [Renew Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_RenewSubscription \"Renew Subscription\"); [Cancel Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_CancelSubscription \"Cancel Subscription\"); [Suspend Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_SuspendSubscription \"Suspend Subscription\"); [Resume Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_ResumeSubscription \"Resume Subscription\"); [Create Account](https://www.zuora.com/developer/api-reference/#operation/POST_Account \"Create Account\")|Generates an invoice for a subscription. | | invoiceTargetDate | 196.0 and earlier  | [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview \"Preview Subscription\") |Date through which charges are calculated on the invoice, as `yyyy-mm-dd`. | | invoiceTargetDate | 207.0 and earlier  | [Create Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_Subscription \"Create Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\"); [Renew Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_RenewSubscription \"Renew Subscription\"); [Cancel Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_CancelSubscription \"Cancel Subscription\"); [Suspend Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_SuspendSubscription \"Suspend Subscription\"); [Resume Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_ResumeSubscription \"Resume Subscription\"); [Create Account](https://www.zuora.com/developer/api-reference/#operation/POST_Account \"Create Account\")|Date through which charges are calculated on the invoice, as `yyyy-mm-dd`. | | targetDate | 207.0 and later | [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview \"Preview Subscription\") |Date through which charges are calculated on the invoice, as `yyyy-mm-dd`. | | targetDate | 211.0 and later | [Create Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_Subscription \"Create Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\"); [Renew Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_RenewSubscription \"Renew Subscription\"); [Cancel Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_CancelSubscription \"Cancel Subscription\"); [Suspend Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_SuspendSubscription \"Suspend Subscription\"); [Resume Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_ResumeSubscription \"Resume Subscription\"); [Create Account](https://www.zuora.com/developer/api-reference/#operation/POST_Account \"Create Account\")|Date through which charges are calculated on the invoice, as `yyyy-mm-dd`. | | includeExisting DraftInvoiceItems | 196.0 and earlier| [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview \"Preview Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\") | Specifies whether to include draft invoice items in subscription previews. Specify it to be `true` (default) to include draft invoice items in the preview result. Specify it to be `false` to excludes draft invoice items in the preview result. | | includeExisting DraftDocItems | 207.0 and later  | [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview \"Preview Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\") | Specifies whether to include draft invoice items in subscription previews. Specify it to be `true` (default) to include draft invoice items in the preview result. Specify it to be `false` to excludes draft invoice items in the preview result. | | previewType | 196.0 and earlier| [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview \"Preview Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\") | The type of preview you will receive. The possible values are `InvoiceItem`(default), `ChargeMetrics`, and `InvoiceItemChargeMetrics`. | | previewType | 207.0 and later  | [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview \"Preview Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\") | The type of preview you will receive. The possible values are `LegalDoc`(default), `ChargeMetrics`, and `LegalDocChargeMetrics`. | | runBilling  | 211.0 and later  | [Create Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_Subscription \"Create Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\"); [Renew Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_RenewSubscription \"Renew Subscription\"); [Cancel Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_CancelSubscription \"Cancel Subscription\"); [Suspend Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_SuspendSubscription \"Suspend Subscription\"); [Resume Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_ResumeSubscription \"Resume Subscription\"); [Create Account](https://www.zuora.com/developer/api-reference/#operation/POST_Account \"Create Account\")|Generates an invoice or credit memo for a subscription. **Note:** Credit memos are only available if you have the Advanced AR Settlement feature enabled. | | invoiceDate | 214.0 and earlier  | [Invoice and Collect](https://www.zuora.com/developer/api-reference/#operation/POST_TransactionInvoicePayment \"Invoice and Collect\") |Date that should appear on the invoice being generated, as `yyyy-mm-dd`. | | invoiceTargetDate | 214.0 and earlier  | [Invoice and Collect](https://www.zuora.com/developer/api-reference/#operation/POST_TransactionInvoicePayment \"Invoice and Collect\") |Date through which to calculate charges on this account if an invoice is generated, as `yyyy-mm-dd`. | | documentDate | 215.0 and later | [Invoice and Collect](https://www.zuora.com/developer/api-reference/#operation/POST_TransactionInvoicePayment \"Invoice and Collect\") |Date that should appear on the invoice and credit memo being generated, as `yyyy-mm-dd`. | | targetDate | 215.0 and later | [Invoice and Collect](https://www.zuora.com/developer/api-reference/#operation/POST_TransactionInvoicePayment \"Invoice and Collect\") |Date through which to calculate charges on this account if an invoice or a credit memo is generated, as `yyyy-mm-dd`. |  #### Version 207.0 and Later  The response structure of the [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview \"Preview Subscription\") and [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\") methods are changed. The following invoice related response fields are moved to the invoice container:    * amount   * amountWithoutTax   * taxAmount   * invoiceItems   * targetDate   * chargeMetrics  # Zuora Object Model  The following diagram presents a high-level view of the key Zuora objects. Click the image to open it in a new tab to resize it.  <a href=\"https://www.zuora.com/wp-content/uploads/2017/01/ZuoraERD.jpeg\" target=\"_blank\"><img src=\"https://www.zuora.com/wp-content/uploads/2017/01/ZuoraERD.jpeg\" alt=\"Zuora Object Model Diagram\"></a>  You can use the [Describe object](https://www.zuora.com/developer/api-reference/#operation/GET_Describe) operation to list the fields of each Zuora object that is available in your tenant. When you call the operation, you must specify the API name of the Zuora object.  The following table provides the API name of each Zuora object:  | Object                                        | API Name                                   | |-----------------------------------------------|--------------------------------------------| | Account                                       | `Account`                                  | | Accounting Code                               | `AccountingCode`                           | | Accounting Period                             | `AccountingPeriod`                         | | Amendment                                     | `Amendment`                                | | Application Group                             | `ApplicationGroup`                         | | Billing Run                                   | `BillingRun`                               | | Contact                                       | `Contact`                                  | | Contact Snapshot                              | `ContactSnapshot`                          | | Credit Balance Adjustment                     | `CreditBalanceAdjustment`                  | | Credit Memo                                   | `CreditMemo`                               | | Credit Memo Application                       | `CreditMemoApplication`                    | | Credit Memo Application Item                  | `CreditMemoApplicationItem`                | | Credit Memo Item                              | `CreditMemoItem`                           | | Credit Memo Part                              | `CreditMemoPart`                           | | Credit Memo Part Item                         | `CreditMemoPartItem`                       | | Credit Taxation Item                          | `CreditTaxationItem`                       | | Custom Exchange Rate                          | `FXCustomRate`                             | | Debit Memo                                    | `DebitMemo`                                | | Debit Memo Item                               | `DebitMemoItem`                            | | Debit Taxation Item                           | `DebitTaxationItem`                        | | Discount Applied Metrics                      | `DiscountAppliedMetrics`                   | | Entity                                        | `Tenant`                                   | | Gateway Reconciliation Event                  | `PaymentGatewayReconciliationEventLog`     | | Gateway Reconciliation Job                    | `PaymentReconciliationJob`                 | | Gateway Reconciliation Log                    | `PaymentReconciliationLog`                 | | Invoice                                       | `Invoice`                                  | | Invoice Adjustment                            | `InvoiceAdjustment`                        | | Invoice Item                                  | `InvoiceItem`                              | | Invoice Item Adjustment                       | `InvoiceItemAdjustment`                    | | Invoice Payment                               | `InvoicePayment`                           | | Journal Entry                                 | `JournalEntry`                             | | Journal Entry Item                            | `JournalEntryItem`                         | | Journal Run                                   | `JournalRun`                               | | Order                                         | `Order`                                    | | Order Action                                  | `OrderAction`                              | | Order MRR                                     | `OrderMrr`                                 | | Order Quantity                                | `OrderQuantity`                            | | Order TCB                                     | `OrderTcb`                                 | | Order TCV                                     | `OrderTcv`                                 | | Payment                                       | `Payment`                                  | | Payment Application                           | `PaymentApplication`                       | | Payment Application Item                      | `PaymentApplicationItem`                   | | Payment Method                                | `PaymentMethod`                            | | Payment Method Snapshot                       | `PaymentMethodSnapshot`                    | | Payment Method Transaction Log                | `PaymentMethodTransactionLog`              | | Payment Method Update                         | `UpdaterDetail`                            | | Payment Part                                  | `PaymentPart`                              | | Payment Part Item                             | `PaymentPartItem`                          | | Payment Run                                   | `PaymentRun`                               | | Payment Transaction Log                       | `PaymentTransactionLog`                    | | Processed Usage                               | `ProcessedUsage`                           | | Product                                       | `Product`                                  | | Product Rate Plan                             | `ProductRatePlan`                          | | Product Rate Plan Charge                      | `ProductRatePlanCharge`                    | | Product Rate Plan Charge Tier                 | `ProductRatePlanChargeTier`                | | Rate Plan                                     | `RatePlan`                                 | | Rate Plan Charge                              | `RatePlanCharge`                           | | Rate Plan Charge Tier                         | `RatePlanChargeTier`                       | | Refund                                        | `Refund`                                   | | Refund Application                            | `RefundApplication`                        | | Refund Application Item                       | `RefundApplicationItem`                    | | Refund Invoice Payment                        | `RefundInvoicePayment`                     | | Refund Part                                   | `RefundPart`                               | | Refund Part Item                              | `RefundPartItem`                           | | Refund Transaction Log                        | `RefundTransactionLog`                     | | Revenue Charge Summary                        | `RevenueChargeSummary`                     | | Revenue Charge Summary Item                   | `RevenueChargeSummaryItem`                 | | Revenue Event                                 | `RevenueEvent`                             | | Revenue Event Credit Memo Item                | `RevenueEventCreditMemoItem`               | | Revenue Event Debit Memo Item                 | `RevenueEventDebitMemoItem`                | | Revenue Event Invoice Item                    | `RevenueEventInvoiceItem`                  | | Revenue Event Invoice Item Adjustment         | `RevenueEventInvoiceItemAdjustment`        | | Revenue Event Item                            | `RevenueEventItem`                         | | Revenue Event Item Credit Memo Item           | `RevenueEventItemCreditMemoItem`           | | Revenue Event Item Debit Memo Item            | `RevenueEventItemDebitMemoItem`            | | Revenue Event Item Invoice Item               | `RevenueEventItemInvoiceItem`              | | Revenue Event Item Invoice Item Adjustment    | `RevenueEventItemInvoiceItemAdjustment`    | | Revenue Event Type                            | `RevenueEventType`                         | | Revenue Schedule                              | `RevenueSchedule`                          | | Revenue Schedule Credit Memo Item             | `RevenueScheduleCreditMemoItem`            | | Revenue Schedule Debit Memo Item              | `RevenueScheduleDebitMemoItem`             | | Revenue Schedule Invoice Item                 | `RevenueScheduleInvoiceItem`               | | Revenue Schedule Invoice Item Adjustment      | `RevenueScheduleInvoiceItemAdjustment`     | | Revenue Schedule Item                         | `RevenueScheduleItem`                      | | Revenue Schedule Item Credit Memo Item        | `RevenueScheduleItemCreditMemoItem`        | | Revenue Schedule Item Debit Memo Item         | `RevenueScheduleItemDebitMemoItem`         | | Revenue Schedule Item Invoice Item            | `RevenueScheduleItemInvoiceItem`           | | Revenue Schedule Item Invoice Item Adjustment | `RevenueScheduleItemInvoiceItemAdjustment` | | Subscription                                  | `Subscription`                             | | Taxable Item Snapshot                         | `TaxableItemSnapshot`                      | | Taxation Item                                 | `TaxationItem`                             | | Updater Batch                                 | `UpdaterBatch`                             | | Usage                                         | `Usage`                                    | 

OpenAPI spec version: 2017-11-15
Contact: docs@zuora.com
Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.3.0-SNAPSHOT

=end

require 'date'

module SwaggerClient

  class GETSubscriptionRatePlanChargesType
    # Specifies the type of charges a specific discount applies to.   This field is only used when applied to a discount charge model. If you are not using a discount charge model, the value is null.  Possible values:  * `RECURRING` * `USAGE` * `ONETIMERECURRING` * `ONETIMEUSAGE` * `RECURRINGUSAGE` * `ONETIMERECURRINGUSAGE` 
    attr_accessor :apply_discount_to

    # Billing cycle day (BCD), which is when bill runs generate invoices for charges associated with the product rate plan charge or the account.    Values:  * `DefaultFromCustomer` * `SpecificDayofMonth(#)` * `SubscriptionStartDay` * `ChargeTriggerDay` * `SpecificDayOfWeek/dayofweek`: in which dayofweek is the day in the week you define your billing periods to start.  In the response data, a day-of-the-month value (`1`-`31`) appears in place of the hash sign above (\"#\"). If this value exceeds the number of days in a particular month, the last day of the month is used as the BCD. 
    attr_accessor :billing_day

    # Allows billing period to be overridden on the rate plan charge. 
    attr_accessor :billing_period

    # Possible values:  * `AlignToCharge` * `AlignToSubscriptionStart` * `AlignToTermStart` 
    attr_accessor :billing_period_alignment

    # The billing timing for the charge. This field is only used if the `ratePlanChargeType` value is `Recurring`.  Possible values are:  * `In Advance` * `In Arrears`  **Note:** This feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/). 
    attr_accessor :billing_timing

    # The date through which a customer has been billed for the charge. 
    attr_accessor :charged_through_date

    # Currency used by the account. For example, `USD` or `EUR`. 
    attr_accessor :currency

    # Any custom fields defined for this object. The custom field name is case-sensitive. 
    attr_accessor :custom_field__c

    # Description of the rate plan charge. 
    attr_accessor :description

    # The amount of the discount. 
    attr_accessor :discount_amount

    # Container for the application details about a discount rate plan charge.   Only discount rate plan charges have values in this field. 
    attr_accessor :discount_apply_details

    # The class that the discount belongs to. The discount class defines the order in which discount rate plan charges are applied.  For more information, see [Manage Discount Classes](https://knowledgecenter.zuora.com/BC_Subscription_Management/Product_Catalog/B_Charge_Models/Manage_Discount_Classes). 
    attr_accessor :discount_class

    # The level of the discount. Values: `RatePlan`, `Subscription`, `Account`. 
    attr_accessor :discount_level

    # The amount of the discount as a percentage. 
    attr_accessor :discount_percentage

    # The change (delta) of monthly recurring charge exists when the change in monthly recurring revenue caused by an amendment or a new subscription. 
    attr_accessor :dmrc

    # A value of `true` indicates that an invoice for a charge segment has been completed. A value of `false` indicates that an invoice has not bee completed for the charge segment. 
    attr_accessor :done

    # After an amendment or an AutomatedPriceChange event, `dtcv` displays the change (delta) for the total contract value (TCV) amount for this charge, compared with its previous value with recurring charge types. 
    attr_accessor :dtcv

    # The effective end date of the rate plan charge. 
    attr_accessor :effective_end_date

    # The effective start date of the rate plan charge. 
    attr_accessor :effective_start_date

    # Defines when the charge ends after the charge trigger date.  If the subscription ends before the charge end date, the charge ends when the subscription ends. But if the subscription end date is subsequently changed through a Renewal, or Terms and Conditions amendment, the charge will end on the charge end date.  Values:  * `Subscription_End` * `Fixed_Period` * `Specific_End_Date` 
    attr_accessor :end_date_condition

    # Rate plan charge ID. 
    attr_accessor :id

    # Specifies the number of units in the base set of units. 
    attr_accessor :included_units

    # List price base; possible values are:  * `Per_Billing_Period` * `Per_Month` * `Per_Week` 
    attr_accessor :list_price_base

    # Charge model; possible values are:  * `FlatFee` * `PerUnit` * `Overage` * `Volume` * `Tiered` * `TieredWithOverage` * `DiscountFixedAmount` * `DiscountPercentage` 
    attr_accessor :model

    # Monthly recurring revenue of the rate plan charge. 
    attr_accessor :mrr

    # Charge name. 
    attr_accessor :name

    # Charge number. 
    attr_accessor :number

    # Specifies the number of periods to use when calculating charges in an overage smoothing charge model. 
    attr_accessor :number_of_periods

    # The original ID of the rate plan charge. 
    attr_accessor :original_charge_id

    # Determines when to calculate overage charges. 
    attr_accessor :overage_calculation_option

    # The price for units over the allowed amount. 
    attr_accessor :overage_price

    # Determines whether to credit the customer with unused units of usage. 
    attr_accessor :overage_unused_units_credit_option

    # The price associated with the rate plan charge expressed as a decimal. 
    attr_accessor :price

    # When the following is true:  1. AutomatedPriceChange setting is on  2. Charge type is not one-time  3. Charge model is not discount percentage  Then an automatic price change can have a value for when a termed subscription is renewed.   Values (one of the following):  * `NoChange` (default) * `SpecificPercentageValue` * `UseLatestProductCatalogPricing` 
    attr_accessor :price_change_option

    # A planned future price increase amount as a percentage. 
    attr_accessor :price_increase_percentage

    # Concise description of rate plan charge model. 
    attr_accessor :pricing_summary

    # The date until when charges have been processed. When billing in arrears, such as usage, this field value is the the same as the `ChargedThroughDate` value. This date is the earliest date when a charge can be amended. 
    attr_accessor :processed_through_date

    # 
    attr_accessor :product_rate_plan_charge_id

    # The quantity of units, such as the number of authors in a hosted wiki service. Valid for all charge models except for Flat Fee pricing. 
    attr_accessor :quantity

    # Specifies a rating group based on which usage records are rated.   Possible values are:  * `ByBillingPeriod` (default) * `ByUsageStartDate` * `ByUsageRecord` * `ByUsageUpload`  **Note:** This field is only used for per unit, volume pricing, and tiered pricing charge models. Use this field only for Usage charges. One-Time Charges and Recurring Charges return `NULL`.  **Note:** This feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/). 
    attr_accessor :rating_group

    # The identifying number of the subscription rate plan segment. Segments are numbered sequentially, starting with 1. 
    attr_accessor :segment

    # Specifies when revenue recognition begins. When charge model is `Overage` or `TieredWithOverage`, `smoothingModel` will be one of the following values:  * `ContractEffectiveDate` * `ServiceActivationDate` * `CustomerAcceptanceDate` 
    attr_accessor :smoothing_model

    # Customizes the number of month or week for the charges billing period. This field is required if you set the value of the `BillingPeriod` field to `Specific_Months` or `Specific_Weeks`. 
    attr_accessor :specific_billing_period

    # The specific date on which the charge ends. If the subscription ends before the specific end date, the charge ends when the subscription ends. But if the subscription end date is subsequently changed through a Renewal, or Terms and Conditions amendment, the charge will end on the specific end date. 
    attr_accessor :specific_end_date

    # The total contract value. 
    attr_accessor :tcv

    # One or many defined ranges with distinct pricing. 
    attr_accessor :tiers

    # The date that the rate plan charge will be triggered. 
    attr_accessor :trigger_date

    # The event that will cause the rate plan charge to be triggered.  Possible values:   * `ContractEffective` * `ServiceActivation` * `CustomerAcceptance` * `SpecificDate` 
    attr_accessor :trigger_event

    # Charge type. Possible values are: `OneTime`, `Recurring`, `Usage`. 
    attr_accessor :type

    # Specifies the rate to credit a customer for unused units of usage. This field is applicable only for overage charge models when the  `OverageUnusedUnitsCreditOption` field value is `CreditBySpecificRate`. 
    attr_accessor :unused_units_credit_rates

    # Specifies the units to measure usage.  
    attr_accessor :uom

    # Specifies the length of the period during which the charge is active. If this period ends before the subscription ends, the charge ends when this period ends.  If the subscription end date is subsequently changed through a Renewal, or Terms and Conditions amendment, the charge end date will change accordingly up to the original period end. 
    attr_accessor :up_to_periods

    # The period type used to define when the charge ends.   Values:  * `Billing_Periods` * `Days` * `Weeks` * `Months` * `Years` 
    attr_accessor :up_to_periods_type

    # Determines how Zuora processes usage records for per-unit usage charges.  
    attr_accessor :usage_record_rating_option

    # Rate plan charge revision number. 
    attr_accessor :version


    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'apply_discount_to' => :'applyDiscountTo',
        :'billing_day' => :'billingDay',
        :'billing_period' => :'billingPeriod',
        :'billing_period_alignment' => :'billingPeriodAlignment',
        :'billing_timing' => :'billingTiming',
        :'charged_through_date' => :'chargedThroughDate',
        :'currency' => :'currency',
        :'custom_field__c' => :'customField__c',
        :'description' => :'description',
        :'discount_amount' => :'discountAmount',
        :'discount_apply_details' => :'discountApplyDetails',
        :'discount_class' => :'discountClass',
        :'discount_level' => :'discountLevel',
        :'discount_percentage' => :'discountPercentage',
        :'dmrc' => :'dmrc',
        :'done' => :'done',
        :'dtcv' => :'dtcv',
        :'effective_end_date' => :'effectiveEndDate',
        :'effective_start_date' => :'effectiveStartDate',
        :'end_date_condition' => :'endDateCondition',
        :'id' => :'id',
        :'included_units' => :'includedUnits',
        :'list_price_base' => :'listPriceBase',
        :'model' => :'model',
        :'mrr' => :'mrr',
        :'name' => :'name',
        :'number' => :'number',
        :'number_of_periods' => :'numberOfPeriods',
        :'original_charge_id' => :'originalChargeId',
        :'overage_calculation_option' => :'overageCalculationOption',
        :'overage_price' => :'overagePrice',
        :'overage_unused_units_credit_option' => :'overageUnusedUnitsCreditOption',
        :'price' => :'price',
        :'price_change_option' => :'priceChangeOption',
        :'price_increase_percentage' => :'priceIncreasePercentage',
        :'pricing_summary' => :'pricingSummary',
        :'processed_through_date' => :'processedThroughDate',
        :'product_rate_plan_charge_id' => :'productRatePlanChargeId',
        :'quantity' => :'quantity',
        :'rating_group' => :'ratingGroup',
        :'segment' => :'segment',
        :'smoothing_model' => :'smoothingModel',
        :'specific_billing_period' => :'specificBillingPeriod',
        :'specific_end_date' => :'specificEndDate',
        :'tcv' => :'tcv',
        :'tiers' => :'tiers',
        :'trigger_date' => :'triggerDate',
        :'trigger_event' => :'triggerEvent',
        :'type' => :'type',
        :'unused_units_credit_rates' => :'unusedUnitsCreditRates',
        :'uom' => :'uom',
        :'up_to_periods' => :'upToPeriods',
        :'up_to_periods_type' => :'upToPeriodsType',
        :'usage_record_rating_option' => :'usageRecordRatingOption',
        :'version' => :'version'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'apply_discount_to' => :'String',
        :'billing_day' => :'String',
        :'billing_period' => :'String',
        :'billing_period_alignment' => :'String',
        :'billing_timing' => :'String',
        :'charged_through_date' => :'Date',
        :'currency' => :'String',
        :'custom_field__c' => :'String',
        :'description' => :'String',
        :'discount_amount' => :'String',
        :'discount_apply_details' => :'Array<GETDiscountApplyDetailsType>',
        :'discount_class' => :'String',
        :'discount_level' => :'String',
        :'discount_percentage' => :'String',
        :'dmrc' => :'String',
        :'done' => :'BOOLEAN',
        :'dtcv' => :'String',
        :'effective_end_date' => :'Date',
        :'effective_start_date' => :'Date',
        :'end_date_condition' => :'String',
        :'id' => :'String',
        :'included_units' => :'String',
        :'list_price_base' => :'String',
        :'model' => :'String',
        :'mrr' => :'String',
        :'name' => :'String',
        :'number' => :'String',
        :'number_of_periods' => :'Integer',
        :'original_charge_id' => :'String',
        :'overage_calculation_option' => :'String',
        :'overage_price' => :'String',
        :'overage_unused_units_credit_option' => :'String',
        :'price' => :'String',
        :'price_change_option' => :'String',
        :'price_increase_percentage' => :'String',
        :'pricing_summary' => :'String',
        :'processed_through_date' => :'Date',
        :'product_rate_plan_charge_id' => :'String',
        :'quantity' => :'String',
        :'rating_group' => :'String',
        :'segment' => :'Integer',
        :'smoothing_model' => :'String',
        :'specific_billing_period' => :'Integer',
        :'specific_end_date' => :'Date',
        :'tcv' => :'String',
        :'tiers' => :'Array<GETTierType>',
        :'trigger_date' => :'Date',
        :'trigger_event' => :'String',
        :'type' => :'String',
        :'unused_units_credit_rates' => :'String',
        :'uom' => :'String',
        :'up_to_periods' => :'String',
        :'up_to_periods_type' => :'String',
        :'usage_record_rating_option' => :'String',
        :'version' => :'Integer'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}){|(k,v), h| h[k.to_sym] = v}

      if attributes.has_key?(:'applyDiscountTo')
        self.apply_discount_to = attributes[:'applyDiscountTo']
      end

      if attributes.has_key?(:'billingDay')
        self.billing_day = attributes[:'billingDay']
      end

      if attributes.has_key?(:'billingPeriod')
        self.billing_period = attributes[:'billingPeriod']
      end

      if attributes.has_key?(:'billingPeriodAlignment')
        self.billing_period_alignment = attributes[:'billingPeriodAlignment']
      end

      if attributes.has_key?(:'billingTiming')
        self.billing_timing = attributes[:'billingTiming']
      end

      if attributes.has_key?(:'chargedThroughDate')
        self.charged_through_date = attributes[:'chargedThroughDate']
      end

      if attributes.has_key?(:'currency')
        self.currency = attributes[:'currency']
      end

      if attributes.has_key?(:'customField__c')
        self.custom_field__c = attributes[:'customField__c']
      end

      if attributes.has_key?(:'description')
        self.description = attributes[:'description']
      end

      if attributes.has_key?(:'discountAmount')
        self.discount_amount = attributes[:'discountAmount']
      end

      if attributes.has_key?(:'discountApplyDetails')
        if (value = attributes[:'discountApplyDetails']).is_a?(Array)
          self.discount_apply_details = value
        end
      end

      if attributes.has_key?(:'discountClass')
        self.discount_class = attributes[:'discountClass']
      end

      if attributes.has_key?(:'discountLevel')
        self.discount_level = attributes[:'discountLevel']
      end

      if attributes.has_key?(:'discountPercentage')
        self.discount_percentage = attributes[:'discountPercentage']
      end

      if attributes.has_key?(:'dmrc')
        self.dmrc = attributes[:'dmrc']
      end

      if attributes.has_key?(:'done')
        self.done = attributes[:'done']
      end

      if attributes.has_key?(:'dtcv')
        self.dtcv = attributes[:'dtcv']
      end

      if attributes.has_key?(:'effectiveEndDate')
        self.effective_end_date = attributes[:'effectiveEndDate']
      end

      if attributes.has_key?(:'effectiveStartDate')
        self.effective_start_date = attributes[:'effectiveStartDate']
      end

      if attributes.has_key?(:'endDateCondition')
        self.end_date_condition = attributes[:'endDateCondition']
      end

      if attributes.has_key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.has_key?(:'includedUnits')
        self.included_units = attributes[:'includedUnits']
      end

      if attributes.has_key?(:'listPriceBase')
        self.list_price_base = attributes[:'listPriceBase']
      end

      if attributes.has_key?(:'model')
        self.model = attributes[:'model']
      end

      if attributes.has_key?(:'mrr')
        self.mrr = attributes[:'mrr']
      end

      if attributes.has_key?(:'name')
        self.name = attributes[:'name']
      end

      if attributes.has_key?(:'number')
        self.number = attributes[:'number']
      end

      if attributes.has_key?(:'numberOfPeriods')
        self.number_of_periods = attributes[:'numberOfPeriods']
      end

      if attributes.has_key?(:'originalChargeId')
        self.original_charge_id = attributes[:'originalChargeId']
      end

      if attributes.has_key?(:'overageCalculationOption')
        self.overage_calculation_option = attributes[:'overageCalculationOption']
      end

      if attributes.has_key?(:'overagePrice')
        self.overage_price = attributes[:'overagePrice']
      end

      if attributes.has_key?(:'overageUnusedUnitsCreditOption')
        self.overage_unused_units_credit_option = attributes[:'overageUnusedUnitsCreditOption']
      end

      if attributes.has_key?(:'price')
        self.price = attributes[:'price']
      end

      if attributes.has_key?(:'priceChangeOption')
        self.price_change_option = attributes[:'priceChangeOption']
      end

      if attributes.has_key?(:'priceIncreasePercentage')
        self.price_increase_percentage = attributes[:'priceIncreasePercentage']
      end

      if attributes.has_key?(:'pricingSummary')
        self.pricing_summary = attributes[:'pricingSummary']
      end

      if attributes.has_key?(:'processedThroughDate')
        self.processed_through_date = attributes[:'processedThroughDate']
      end

      if attributes.has_key?(:'productRatePlanChargeId')
        self.product_rate_plan_charge_id = attributes[:'productRatePlanChargeId']
      end

      if attributes.has_key?(:'quantity')
        self.quantity = attributes[:'quantity']
      end

      if attributes.has_key?(:'ratingGroup')
        self.rating_group = attributes[:'ratingGroup']
      end

      if attributes.has_key?(:'segment')
        self.segment = attributes[:'segment']
      end

      if attributes.has_key?(:'smoothingModel')
        self.smoothing_model = attributes[:'smoothingModel']
      end

      if attributes.has_key?(:'specificBillingPeriod')
        self.specific_billing_period = attributes[:'specificBillingPeriod']
      end

      if attributes.has_key?(:'specificEndDate')
        self.specific_end_date = attributes[:'specificEndDate']
      end

      if attributes.has_key?(:'tcv')
        self.tcv = attributes[:'tcv']
      end

      if attributes.has_key?(:'tiers')
        if (value = attributes[:'tiers']).is_a?(Array)
          self.tiers = value
        end
      end

      if attributes.has_key?(:'triggerDate')
        self.trigger_date = attributes[:'triggerDate']
      end

      if attributes.has_key?(:'triggerEvent')
        self.trigger_event = attributes[:'triggerEvent']
      end

      if attributes.has_key?(:'type')
        self.type = attributes[:'type']
      end

      if attributes.has_key?(:'unusedUnitsCreditRates')
        self.unused_units_credit_rates = attributes[:'unusedUnitsCreditRates']
      end

      if attributes.has_key?(:'uom')
        self.uom = attributes[:'uom']
      end

      if attributes.has_key?(:'upToPeriods')
        self.up_to_periods = attributes[:'upToPeriods']
      end

      if attributes.has_key?(:'upToPeriodsType')
        self.up_to_periods_type = attributes[:'upToPeriodsType']
      end

      if attributes.has_key?(:'usageRecordRatingOption')
        self.usage_record_rating_option = attributes[:'usageRecordRatingOption']
      end

      if attributes.has_key?(:'version')
        self.version = attributes[:'version']
      end

    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properies with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      return invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          apply_discount_to == o.apply_discount_to &&
          billing_day == o.billing_day &&
          billing_period == o.billing_period &&
          billing_period_alignment == o.billing_period_alignment &&
          billing_timing == o.billing_timing &&
          charged_through_date == o.charged_through_date &&
          currency == o.currency &&
          custom_field__c == o.custom_field__c &&
          description == o.description &&
          discount_amount == o.discount_amount &&
          discount_apply_details == o.discount_apply_details &&
          discount_class == o.discount_class &&
          discount_level == o.discount_level &&
          discount_percentage == o.discount_percentage &&
          dmrc == o.dmrc &&
          done == o.done &&
          dtcv == o.dtcv &&
          effective_end_date == o.effective_end_date &&
          effective_start_date == o.effective_start_date &&
          end_date_condition == o.end_date_condition &&
          id == o.id &&
          included_units == o.included_units &&
          list_price_base == o.list_price_base &&
          model == o.model &&
          mrr == o.mrr &&
          name == o.name &&
          number == o.number &&
          number_of_periods == o.number_of_periods &&
          original_charge_id == o.original_charge_id &&
          overage_calculation_option == o.overage_calculation_option &&
          overage_price == o.overage_price &&
          overage_unused_units_credit_option == o.overage_unused_units_credit_option &&
          price == o.price &&
          price_change_option == o.price_change_option &&
          price_increase_percentage == o.price_increase_percentage &&
          pricing_summary == o.pricing_summary &&
          processed_through_date == o.processed_through_date &&
          product_rate_plan_charge_id == o.product_rate_plan_charge_id &&
          quantity == o.quantity &&
          rating_group == o.rating_group &&
          segment == o.segment &&
          smoothing_model == o.smoothing_model &&
          specific_billing_period == o.specific_billing_period &&
          specific_end_date == o.specific_end_date &&
          tcv == o.tcv &&
          tiers == o.tiers &&
          trigger_date == o.trigger_date &&
          trigger_event == o.trigger_event &&
          type == o.type &&
          unused_units_credit_rates == o.unused_units_credit_rates &&
          uom == o.uom &&
          up_to_periods == o.up_to_periods &&
          up_to_periods_type == o.up_to_periods_type &&
          usage_record_rating_option == o.usage_record_rating_option &&
          version == o.version
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [apply_discount_to, billing_day, billing_period, billing_period_alignment, billing_timing, charged_through_date, currency, custom_field__c, description, discount_amount, discount_apply_details, discount_class, discount_level, discount_percentage, dmrc, done, dtcv, effective_end_date, effective_start_date, end_date_condition, id, included_units, list_price_base, model, mrr, name, number, number_of_periods, original_charge_id, overage_calculation_option, overage_price, overage_unused_units_credit_option, price, price_change_option, price_increase_percentage, pricing_summary, processed_through_date, product_rate_plan_charge_id, quantity, rating_group, segment, smoothing_model, specific_billing_period, specific_end_date, tcv, tiers, trigger_date, trigger_event, type, unused_units_credit_rates, uom, up_to_periods, up_to_periods_type, usage_record_rating_option, version].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map{ |v| _deserialize($1, v) } )
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        temp_model = SwaggerClient.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map{ |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end
