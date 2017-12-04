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

  class ProxyCreatePayment
    # The unique account ID for the customer that the payment is for. 
    attr_accessor :account_id

    # The aacccounting code for the payment. Accounting codes group transactions that contain similar accounting attributes. 
    attr_accessor :accounting_code

    # The amount of the payment. 
    attr_accessor :amount

    # The amount of the payment to apply to a credit balance. This field is only required if the `AppliedInvoiceAmount` field value is null. 
    attr_accessor :applied_credit_balance_amount

    # The amount of the payment to apply to an invoice. This field is only required if either the `InvoiceId` or `InvoiceNumber` field is not null. 
    attr_accessor :applied_invoice_amount

    # The authorization transaction ID from the payment gateway. Use this field for electronic payments, such as credit cards. 
    attr_accessor :auth_transaction_id

    # Additional information related to the payment. 
    attr_accessor :comment

    # The date when the payment takes effect. 
    attr_accessor :effective_date

    # The name of the gateway instance that processes the payment. When creating a payment, the value of this field must be a valid gateway instance name, and this gateway must support the specific payment method. If no value is specified, the default gateway on the Account will be used. 
    attr_accessor :gateway

    attr_accessor :gateway_option_data

    # A merchant-specified natural key value that can be passed to the electronic payment gateway when a payment is created. If not specified, the payment number will be passed in instead.  Gateways check duplicates on the gateway order ID to ensure that the merchant do not accidentally enter the same transaction twice. This ID can also be used to do reconciliation and tie the payment to a natural key in external systems. The source of this ID varies by merchant. Some merchants use their shopping cart order IDs, and others use something different. Merchants use this ID to track transactions in their eCommerce systems. 
    attr_accessor :gateway_order_id

    # The message returned from the payment gateway for the payment. This message is gateway-dependent. 
    attr_accessor :gateway_response

    # The code returned from the payment gateway for the payment. This code is gateway-dependent. 
    attr_accessor :gateway_response_code

    # The status of the payment in the gateway; use for reconciliation. 
    attr_accessor :gateway_state

    # The ID of the invoice that the payment is applied to. When applying a payment to a single invoice, this field is only required if the `InvoiceNumber` field is null. 
    attr_accessor :invoice_id

    # The unique identification number for the invoice that the payment is applied to. When applying a payment to a single invoice, this field is only required if the `InvoiceId` field is null. 
    attr_accessor :invoice_number

    attr_accessor :invoice_payment_data

    # The ID of the payment method used for the payment.  
    attr_accessor :payment_method_id

    # The unique identification number of the payment. For example, P-00000028. 
    attr_accessor :payment_number

    # The transaction ID returned by the payment gateway. Use this field to reconcile payments between your gateway and Zuora Payments. 
    attr_accessor :reference_id

    # A payment gateway-specific field that maps to Zuora for the gateways, Orbital, Vantiv and Verifi.   Zuora passes this field to Verifi directly without verification. In general, this field will be defaulted by the gateway. For Orbital, this field contains two fields separated by an asterisk, `SDMerchantName` and `SDProductionInfo`. For more information, contact your payment gateway. 
    attr_accessor :soft_descriptor

    # A payment gateway-specific field that maps to Zuora for the gateways, Orbital, Vantiv and Verifi.  Verifi and Orbital determine how to format this string. For more information, contact your payment gateway. 
    attr_accessor :soft_descriptor_phone

    # The status of the payment in Zuora. The value depends on the type of payment.    For electronic payments, the status can be `Processed`, `Error`, or `Voided`. For external payments, the status can be `Processed` or `Canceled`. 
    attr_accessor :status

    # The type of the payment, whether the payment is external or electronic. 
    attr_accessor :type

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'account_id' => :'AccountId',
        :'accounting_code' => :'AccountingCode',
        :'amount' => :'Amount',
        :'applied_credit_balance_amount' => :'AppliedCreditBalanceAmount',
        :'applied_invoice_amount' => :'AppliedInvoiceAmount',
        :'auth_transaction_id' => :'AuthTransactionId',
        :'comment' => :'Comment',
        :'effective_date' => :'EffectiveDate',
        :'gateway' => :'Gateway',
        :'gateway_option_data' => :'GatewayOptionData',
        :'gateway_order_id' => :'GatewayOrderId',
        :'gateway_response' => :'GatewayResponse',
        :'gateway_response_code' => :'GatewayResponseCode',
        :'gateway_state' => :'GatewayState',
        :'invoice_id' => :'InvoiceId',
        :'invoice_number' => :'InvoiceNumber',
        :'invoice_payment_data' => :'InvoicePaymentData',
        :'payment_method_id' => :'PaymentMethodId',
        :'payment_number' => :'PaymentNumber',
        :'reference_id' => :'ReferenceId',
        :'soft_descriptor' => :'SoftDescriptor',
        :'soft_descriptor_phone' => :'SoftDescriptorPhone',
        :'status' => :'Status',
        :'type' => :'Type'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'account_id' => :'String',
        :'accounting_code' => :'String',
        :'amount' => :'Float',
        :'applied_credit_balance_amount' => :'Float',
        :'applied_invoice_amount' => :'Float',
        :'auth_transaction_id' => :'String',
        :'comment' => :'String',
        :'effective_date' => :'Date',
        :'gateway' => :'String',
        :'gateway_option_data' => :'ProxyCreatePaymentGatewayOptionData',
        :'gateway_order_id' => :'String',
        :'gateway_response' => :'String',
        :'gateway_response_code' => :'String',
        :'gateway_state' => :'String',
        :'invoice_id' => :'String',
        :'invoice_number' => :'String',
        :'invoice_payment_data' => :'InvoicePaymentData',
        :'payment_method_id' => :'String',
        :'payment_number' => :'String',
        :'reference_id' => :'String',
        :'soft_descriptor' => :'String',
        :'soft_descriptor_phone' => :'String',
        :'status' => :'String',
        :'type' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}){|(k,v), h| h[k.to_sym] = v}

      if attributes.has_key?(:'AccountId')
        self.account_id = attributes[:'AccountId']
      end

      if attributes.has_key?(:'AccountingCode')
        self.accounting_code = attributes[:'AccountingCode']
      end

      if attributes.has_key?(:'Amount')
        self.amount = attributes[:'Amount']
      end

      if attributes.has_key?(:'AppliedCreditBalanceAmount')
        self.applied_credit_balance_amount = attributes[:'AppliedCreditBalanceAmount']
      end

      if attributes.has_key?(:'AppliedInvoiceAmount')
        self.applied_invoice_amount = attributes[:'AppliedInvoiceAmount']
      end

      if attributes.has_key?(:'AuthTransactionId')
        self.auth_transaction_id = attributes[:'AuthTransactionId']
      end

      if attributes.has_key?(:'Comment')
        self.comment = attributes[:'Comment']
      end

      if attributes.has_key?(:'EffectiveDate')
        self.effective_date = attributes[:'EffectiveDate']
      end

      if attributes.has_key?(:'Gateway')
        self.gateway = attributes[:'Gateway']
      end

      if attributes.has_key?(:'GatewayOptionData')
        self.gateway_option_data = attributes[:'GatewayOptionData']
      end

      if attributes.has_key?(:'GatewayOrderId')
        self.gateway_order_id = attributes[:'GatewayOrderId']
      end

      if attributes.has_key?(:'GatewayResponse')
        self.gateway_response = attributes[:'GatewayResponse']
      end

      if attributes.has_key?(:'GatewayResponseCode')
        self.gateway_response_code = attributes[:'GatewayResponseCode']
      end

      if attributes.has_key?(:'GatewayState')
        self.gateway_state = attributes[:'GatewayState']
      end

      if attributes.has_key?(:'InvoiceId')
        self.invoice_id = attributes[:'InvoiceId']
      end

      if attributes.has_key?(:'InvoiceNumber')
        self.invoice_number = attributes[:'InvoiceNumber']
      end

      if attributes.has_key?(:'InvoicePaymentData')
        self.invoice_payment_data = attributes[:'InvoicePaymentData']
      end

      if attributes.has_key?(:'PaymentMethodId')
        self.payment_method_id = attributes[:'PaymentMethodId']
      end

      if attributes.has_key?(:'PaymentNumber')
        self.payment_number = attributes[:'PaymentNumber']
      end

      if attributes.has_key?(:'ReferenceId')
        self.reference_id = attributes[:'ReferenceId']
      end

      if attributes.has_key?(:'SoftDescriptor')
        self.soft_descriptor = attributes[:'SoftDescriptor']
      end

      if attributes.has_key?(:'SoftDescriptorPhone')
        self.soft_descriptor_phone = attributes[:'SoftDescriptorPhone']
      end

      if attributes.has_key?(:'Status')
        self.status = attributes[:'Status']
      end

      if attributes.has_key?(:'Type')
        self.type = attributes[:'Type']
      end

    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properies with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @account_id.nil?
        invalid_properties.push("invalid value for 'account_id', account_id cannot be nil.")
      end

      if @account_id.to_s.length > 32
        invalid_properties.push("invalid value for 'account_id', the character length must be smaller than or equal to 32.")
      end

      if @account_id.to_s.length < 0
        invalid_properties.push("invalid value for 'account_id', the character length must be great than or equal to 0.")
      end

      if !@accounting_code.nil? && @accounting_code.to_s.length > 100
        invalid_properties.push("invalid value for 'accounting_code', the character length must be smaller than or equal to 100.")
      end

      if !@accounting_code.nil? && @accounting_code.to_s.length < 0
        invalid_properties.push("invalid value for 'accounting_code', the character length must be great than or equal to 0.")
      end

      if !@auth_transaction_id.nil? && @auth_transaction_id.to_s.length > 50
        invalid_properties.push("invalid value for 'auth_transaction_id', the character length must be smaller than or equal to 50.")
      end

      if !@auth_transaction_id.nil? && @auth_transaction_id.to_s.length < 0
        invalid_properties.push("invalid value for 'auth_transaction_id', the character length must be great than or equal to 0.")
      end

      if !@comment.nil? && @comment.to_s.length > 255
        invalid_properties.push("invalid value for 'comment', the character length must be smaller than or equal to 255.")
      end

      if !@comment.nil? && @comment.to_s.length < 0
        invalid_properties.push("invalid value for 'comment', the character length must be great than or equal to 0.")
      end

      if @effective_date.nil?
        invalid_properties.push("invalid value for 'effective_date', effective_date cannot be nil.")
      end

      if !@gateway_order_id.nil? && @gateway_order_id.to_s.length > 70
        invalid_properties.push("invalid value for 'gateway_order_id', the character length must be smaller than or equal to 70.")
      end

      if !@gateway_order_id.nil? && @gateway_order_id.to_s.length < 0
        invalid_properties.push("invalid value for 'gateway_order_id', the character length must be great than or equal to 0.")
      end

      if !@gateway_response.nil? && @gateway_response.to_s.length > 500
        invalid_properties.push("invalid value for 'gateway_response', the character length must be smaller than or equal to 500.")
      end

      if !@gateway_response.nil? && @gateway_response.to_s.length < 0
        invalid_properties.push("invalid value for 'gateway_response', the character length must be great than or equal to 0.")
      end

      if !@gateway_response_code.nil? && @gateway_response_code.to_s.length > 20
        invalid_properties.push("invalid value for 'gateway_response_code', the character length must be smaller than or equal to 20.")
      end

      if !@gateway_response_code.nil? && @gateway_response_code.to_s.length < 0
        invalid_properties.push("invalid value for 'gateway_response_code', the character length must be great than or equal to 0.")
      end

      if !@invoice_id.nil? && @invoice_id.to_s.length > 32
        invalid_properties.push("invalid value for 'invoice_id', the character length must be smaller than or equal to 32.")
      end

      if !@invoice_id.nil? && @invoice_id.to_s.length < 0
        invalid_properties.push("invalid value for 'invoice_id', the character length must be great than or equal to 0.")
      end

      if !@invoice_number.nil? && @invoice_number.to_s.length > 32
        invalid_properties.push("invalid value for 'invoice_number', the character length must be smaller than or equal to 32.")
      end

      if !@invoice_number.nil? && @invoice_number.to_s.length < 0
        invalid_properties.push("invalid value for 'invoice_number', the character length must be great than or equal to 0.")
      end

      if @payment_method_id.nil?
        invalid_properties.push("invalid value for 'payment_method_id', payment_method_id cannot be nil.")
      end

      if @payment_method_id.to_s.length > 32
        invalid_properties.push("invalid value for 'payment_method_id', the character length must be smaller than or equal to 32.")
      end

      if @payment_method_id.to_s.length < 0
        invalid_properties.push("invalid value for 'payment_method_id', the character length must be great than or equal to 0.")
      end

      if !@payment_number.nil? && @payment_number.to_s.length > 32
        invalid_properties.push("invalid value for 'payment_number', the character length must be smaller than or equal to 32.")
      end

      if !@payment_number.nil? && @payment_number.to_s.length < 0
        invalid_properties.push("invalid value for 'payment_number', the character length must be great than or equal to 0.")
      end

      if !@reference_id.nil? && @reference_id.to_s.length > 60
        invalid_properties.push("invalid value for 'reference_id', the character length must be smaller than or equal to 60.")
      end

      if !@reference_id.nil? && @reference_id.to_s.length < 0
        invalid_properties.push("invalid value for 'reference_id', the character length must be great than or equal to 0.")
      end

      if !@soft_descriptor.nil? && @soft_descriptor.to_s.length > 35
        invalid_properties.push("invalid value for 'soft_descriptor', the character length must be smaller than or equal to 35.")
      end

      if !@soft_descriptor.nil? && @soft_descriptor.to_s.length < 0
        invalid_properties.push("invalid value for 'soft_descriptor', the character length must be great than or equal to 0.")
      end

      if !@soft_descriptor_phone.nil? && @soft_descriptor_phone.to_s.length > 20
        invalid_properties.push("invalid value for 'soft_descriptor_phone', the character length must be smaller than or equal to 20.")
      end

      if !@soft_descriptor_phone.nil? && @soft_descriptor_phone.to_s.length < 0
        invalid_properties.push("invalid value for 'soft_descriptor_phone', the character length must be great than or equal to 0.")
      end

      if @status.nil?
        invalid_properties.push("invalid value for 'status', status cannot be nil.")
      end

      if @type.nil?
        invalid_properties.push("invalid value for 'type', type cannot be nil.")
      end

      return invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @account_id.nil?
      return false if @account_id.to_s.length > 32
      return false if @account_id.to_s.length < 0
      return false if !@accounting_code.nil? && @accounting_code.to_s.length > 100
      return false if !@accounting_code.nil? && @accounting_code.to_s.length < 0
      return false if !@auth_transaction_id.nil? && @auth_transaction_id.to_s.length > 50
      return false if !@auth_transaction_id.nil? && @auth_transaction_id.to_s.length < 0
      return false if !@comment.nil? && @comment.to_s.length > 255
      return false if !@comment.nil? && @comment.to_s.length < 0
      return false if @effective_date.nil?
      return false if !@gateway_order_id.nil? && @gateway_order_id.to_s.length > 70
      return false if !@gateway_order_id.nil? && @gateway_order_id.to_s.length < 0
      return false if !@gateway_response.nil? && @gateway_response.to_s.length > 500
      return false if !@gateway_response.nil? && @gateway_response.to_s.length < 0
      return false if !@gateway_response_code.nil? && @gateway_response_code.to_s.length > 20
      return false if !@gateway_response_code.nil? && @gateway_response_code.to_s.length < 0
      gateway_state_validator = EnumAttributeValidator.new('String', ["MarkedForSubmission", "Submitted", "Settled", "NotSubmitted", "FailedToSettle"])
      return false unless gateway_state_validator.valid?(@gateway_state)
      return false if !@invoice_id.nil? && @invoice_id.to_s.length > 32
      return false if !@invoice_id.nil? && @invoice_id.to_s.length < 0
      return false if !@invoice_number.nil? && @invoice_number.to_s.length > 32
      return false if !@invoice_number.nil? && @invoice_number.to_s.length < 0
      return false if @payment_method_id.nil?
      return false if @payment_method_id.to_s.length > 32
      return false if @payment_method_id.to_s.length < 0
      return false if !@payment_number.nil? && @payment_number.to_s.length > 32
      return false if !@payment_number.nil? && @payment_number.to_s.length < 0
      return false if !@reference_id.nil? && @reference_id.to_s.length > 60
      return false if !@reference_id.nil? && @reference_id.to_s.length < 0
      return false if !@soft_descriptor.nil? && @soft_descriptor.to_s.length > 35
      return false if !@soft_descriptor.nil? && @soft_descriptor.to_s.length < 0
      return false if !@soft_descriptor_phone.nil? && @soft_descriptor_phone.to_s.length > 20
      return false if !@soft_descriptor_phone.nil? && @soft_descriptor_phone.to_s.length < 0
      return false if @status.nil?
      status_validator = EnumAttributeValidator.new('String', ["Processed", "Error", "Voided", "Canceled"])
      return false unless status_validator.valid?(@status)
      return false if @type.nil?
      type_validator = EnumAttributeValidator.new('String', ["External", "Electronic"])
      return false unless type_validator.valid?(@type)
      return true
    end

    # Custom attribute writer method with validation
    # @param [Object] account_id Value to be assigned
    def account_id=(account_id)
      if account_id.nil?
        fail ArgumentError, "account_id cannot be nil"
      end

      if account_id.to_s.length > 32
        fail ArgumentError, "invalid value for 'account_id', the character length must be smaller than or equal to 32."
      end

      if account_id.to_s.length < 0
        fail ArgumentError, "invalid value for 'account_id', the character length must be great than or equal to 0."
      end

      @account_id = account_id
    end

    # Custom attribute writer method with validation
    # @param [Object] accounting_code Value to be assigned
    def accounting_code=(accounting_code)

      if !accounting_code.nil? && accounting_code.to_s.length > 100
        fail ArgumentError, "invalid value for 'accounting_code', the character length must be smaller than or equal to 100."
      end

      if !accounting_code.nil? && accounting_code.to_s.length < 0
        fail ArgumentError, "invalid value for 'accounting_code', the character length must be great than or equal to 0."
      end

      @accounting_code = accounting_code
    end

    # Custom attribute writer method with validation
    # @param [Object] auth_transaction_id Value to be assigned
    def auth_transaction_id=(auth_transaction_id)

      if !auth_transaction_id.nil? && auth_transaction_id.to_s.length > 50
        fail ArgumentError, "invalid value for 'auth_transaction_id', the character length must be smaller than or equal to 50."
      end

      if !auth_transaction_id.nil? && auth_transaction_id.to_s.length < 0
        fail ArgumentError, "invalid value for 'auth_transaction_id', the character length must be great than or equal to 0."
      end

      @auth_transaction_id = auth_transaction_id
    end

    # Custom attribute writer method with validation
    # @param [Object] comment Value to be assigned
    def comment=(comment)

      if !comment.nil? && comment.to_s.length > 255
        fail ArgumentError, "invalid value for 'comment', the character length must be smaller than or equal to 255."
      end

      if !comment.nil? && comment.to_s.length < 0
        fail ArgumentError, "invalid value for 'comment', the character length must be great than or equal to 0."
      end

      @comment = comment
    end

    # Custom attribute writer method with validation
    # @param [Object] gateway_order_id Value to be assigned
    def gateway_order_id=(gateway_order_id)

      if !gateway_order_id.nil? && gateway_order_id.to_s.length > 70
        fail ArgumentError, "invalid value for 'gateway_order_id', the character length must be smaller than or equal to 70."
      end

      if !gateway_order_id.nil? && gateway_order_id.to_s.length < 0
        fail ArgumentError, "invalid value for 'gateway_order_id', the character length must be great than or equal to 0."
      end

      @gateway_order_id = gateway_order_id
    end

    # Custom attribute writer method with validation
    # @param [Object] gateway_response Value to be assigned
    def gateway_response=(gateway_response)

      if !gateway_response.nil? && gateway_response.to_s.length > 500
        fail ArgumentError, "invalid value for 'gateway_response', the character length must be smaller than or equal to 500."
      end

      if !gateway_response.nil? && gateway_response.to_s.length < 0
        fail ArgumentError, "invalid value for 'gateway_response', the character length must be great than or equal to 0."
      end

      @gateway_response = gateway_response
    end

    # Custom attribute writer method with validation
    # @param [Object] gateway_response_code Value to be assigned
    def gateway_response_code=(gateway_response_code)

      if !gateway_response_code.nil? && gateway_response_code.to_s.length > 20
        fail ArgumentError, "invalid value for 'gateway_response_code', the character length must be smaller than or equal to 20."
      end

      if !gateway_response_code.nil? && gateway_response_code.to_s.length < 0
        fail ArgumentError, "invalid value for 'gateway_response_code', the character length must be great than or equal to 0."
      end

      @gateway_response_code = gateway_response_code
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] gateway_state Object to be assigned
    def gateway_state=(gateway_state)
      validator = EnumAttributeValidator.new('String', ["MarkedForSubmission", "Submitted", "Settled", "NotSubmitted", "FailedToSettle"])
      unless validator.valid?(gateway_state)
        fail ArgumentError, "invalid value for 'gateway_state', must be one of #{validator.allowable_values}."
      end
      @gateway_state = gateway_state
    end

    # Custom attribute writer method with validation
    # @param [Object] invoice_id Value to be assigned
    def invoice_id=(invoice_id)

      if !invoice_id.nil? && invoice_id.to_s.length > 32
        fail ArgumentError, "invalid value for 'invoice_id', the character length must be smaller than or equal to 32."
      end

      if !invoice_id.nil? && invoice_id.to_s.length < 0
        fail ArgumentError, "invalid value for 'invoice_id', the character length must be great than or equal to 0."
      end

      @invoice_id = invoice_id
    end

    # Custom attribute writer method with validation
    # @param [Object] invoice_number Value to be assigned
    def invoice_number=(invoice_number)

      if !invoice_number.nil? && invoice_number.to_s.length > 32
        fail ArgumentError, "invalid value for 'invoice_number', the character length must be smaller than or equal to 32."
      end

      if !invoice_number.nil? && invoice_number.to_s.length < 0
        fail ArgumentError, "invalid value for 'invoice_number', the character length must be great than or equal to 0."
      end

      @invoice_number = invoice_number
    end

    # Custom attribute writer method with validation
    # @param [Object] payment_method_id Value to be assigned
    def payment_method_id=(payment_method_id)
      if payment_method_id.nil?
        fail ArgumentError, "payment_method_id cannot be nil"
      end

      if payment_method_id.to_s.length > 32
        fail ArgumentError, "invalid value for 'payment_method_id', the character length must be smaller than or equal to 32."
      end

      if payment_method_id.to_s.length < 0
        fail ArgumentError, "invalid value for 'payment_method_id', the character length must be great than or equal to 0."
      end

      @payment_method_id = payment_method_id
    end

    # Custom attribute writer method with validation
    # @param [Object] payment_number Value to be assigned
    def payment_number=(payment_number)

      if !payment_number.nil? && payment_number.to_s.length > 32
        fail ArgumentError, "invalid value for 'payment_number', the character length must be smaller than or equal to 32."
      end

      if !payment_number.nil? && payment_number.to_s.length < 0
        fail ArgumentError, "invalid value for 'payment_number', the character length must be great than or equal to 0."
      end

      @payment_number = payment_number
    end

    # Custom attribute writer method with validation
    # @param [Object] reference_id Value to be assigned
    def reference_id=(reference_id)

      if !reference_id.nil? && reference_id.to_s.length > 60
        fail ArgumentError, "invalid value for 'reference_id', the character length must be smaller than or equal to 60."
      end

      if !reference_id.nil? && reference_id.to_s.length < 0
        fail ArgumentError, "invalid value for 'reference_id', the character length must be great than or equal to 0."
      end

      @reference_id = reference_id
    end

    # Custom attribute writer method with validation
    # @param [Object] soft_descriptor Value to be assigned
    def soft_descriptor=(soft_descriptor)

      if !soft_descriptor.nil? && soft_descriptor.to_s.length > 35
        fail ArgumentError, "invalid value for 'soft_descriptor', the character length must be smaller than or equal to 35."
      end

      if !soft_descriptor.nil? && soft_descriptor.to_s.length < 0
        fail ArgumentError, "invalid value for 'soft_descriptor', the character length must be great than or equal to 0."
      end

      @soft_descriptor = soft_descriptor
    end

    # Custom attribute writer method with validation
    # @param [Object] soft_descriptor_phone Value to be assigned
    def soft_descriptor_phone=(soft_descriptor_phone)

      if !soft_descriptor_phone.nil? && soft_descriptor_phone.to_s.length > 20
        fail ArgumentError, "invalid value for 'soft_descriptor_phone', the character length must be smaller than or equal to 20."
      end

      if !soft_descriptor_phone.nil? && soft_descriptor_phone.to_s.length < 0
        fail ArgumentError, "invalid value for 'soft_descriptor_phone', the character length must be great than or equal to 0."
      end

      @soft_descriptor_phone = soft_descriptor_phone
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] status Object to be assigned
    def status=(status)
      validator = EnumAttributeValidator.new('String', ["Processed", "Error", "Voided", "Canceled"])
      unless validator.valid?(status)
        fail ArgumentError, "invalid value for 'status', must be one of #{validator.allowable_values}."
      end
      @status = status
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] type Object to be assigned
    def type=(type)
      validator = EnumAttributeValidator.new('String', ["External", "Electronic"])
      unless validator.valid?(type)
        fail ArgumentError, "invalid value for 'type', must be one of #{validator.allowable_values}."
      end
      @type = type
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          account_id == o.account_id &&
          accounting_code == o.accounting_code &&
          amount == o.amount &&
          applied_credit_balance_amount == o.applied_credit_balance_amount &&
          applied_invoice_amount == o.applied_invoice_amount &&
          auth_transaction_id == o.auth_transaction_id &&
          comment == o.comment &&
          effective_date == o.effective_date &&
          gateway == o.gateway &&
          gateway_option_data == o.gateway_option_data &&
          gateway_order_id == o.gateway_order_id &&
          gateway_response == o.gateway_response &&
          gateway_response_code == o.gateway_response_code &&
          gateway_state == o.gateway_state &&
          invoice_id == o.invoice_id &&
          invoice_number == o.invoice_number &&
          invoice_payment_data == o.invoice_payment_data &&
          payment_method_id == o.payment_method_id &&
          payment_number == o.payment_number &&
          reference_id == o.reference_id &&
          soft_descriptor == o.soft_descriptor &&
          soft_descriptor_phone == o.soft_descriptor_phone &&
          status == o.status &&
          type == o.type
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [account_id, accounting_code, amount, applied_credit_balance_amount, applied_invoice_amount, auth_transaction_id, comment, effective_date, gateway, gateway_option_data, gateway_order_id, gateway_response, gateway_response_code, gateway_state, invoice_id, invoice_number, invoice_payment_data, payment_method_id, payment_number, reference_id, soft_descriptor, soft_descriptor_phone, status, type].hash
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
