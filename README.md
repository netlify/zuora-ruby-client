# swagger_client

SwaggerClient - the Ruby gem for the Zuora API Reference

  # Introduction Welcome to the reference for the Zuora REST API!  <a href=\"http://en.wikipedia.org/wiki/REST_API\" target=\"_blank\">REST</a> is a web-service protocol that lends itself to rapid development by using everyday HTTP and JSON technology.  The Zuora REST API provides a broad set of operations and resources that:    * Enable Web Storefront integration from your website.   * Support self-service subscriber sign-ups and account management.   * Process revenue schedules through custom revenue rule models.   * Enable manipulation of most objects in the Zuora Object Model.      ## Endpoints      The Zuora REST API is provided via the following endpoints.   | Tenant              | Base URL for REST Endpoints |   |-------------------------|-------------------------|   |US Production | https://rest.zuora.com   |   |US API Sandbox    | https://rest.apisandbox.zuora.com|   |US Performance Test | https://rest.pt1.zuora.com |   |EU Production | https://rest.eu.zuora.com |   |EU Sandbox | https://rest.sandbox.eu.zuora.com |      The production endpoint provides access to your live user data. The API Sandbox tenant is a good place to test your code without affecting real-world data. To use it, you must be provisioned with an API Sandbox tenant - your Zuora representative can help you if needed.      ## Access to the API      If you have a Zuora tenant, you already have access to the API.      If you don't have a Zuora tenant, go to <a href=\" https://www.zuora.com/resource/zuora-test-drive\" target=\"_blank\">https://www.zuora.com/resource/zuora-test-drive</a> and sign up for a Production Test Drive tenant. The tenant comes with seed data, such as a sample product catalog.  We recommend that you <a href=\"https://knowledgecenter.zuora.com/CF_Users_and_Administrators/A_Administrator_Settings/Manage_Users/Create_an_API_User\" target=\"_blank\">create an API user</a> specifically for making API calls. Don't log in to the Zuora UI with this account. Logging in to the UI enables a security feature that periodically expires the account's password, which may eventually cause authentication failures with the API. Note that a user role does not have write access to Zuora REST services unless it has the API Write Access permission as described in those instructions.   # API Changelog You can find the <a href=\"https://community.zuora.com/t5/Developers/API-Changelog/gpm-p/18092\" target=\"_blank\">Changelog</a> of the API Reference in the Zuora Community.   # Authentication  ## OAuth v2.0  Zuora recommends that you use OAuth v2.0 to authenticate to the Zuora REST API. Currently, OAuth is not available in every environment. See [Zuora Testing Environments](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/D_Zuora_Environments) for more information.  Authenticating via OAuth requires the following steps: 1. Create a Client 2. Generate a Token  ### Create a Client  You must first [create an OAuth client](https://knowledgecenter.zuora.com/CF_Users_and_Administrators/A_Administrator_Settings/Manage_Users#Create_an_OAuth_Client_for_a_User) in the Zuora UI. To do this, you must be an administrator of your Zuora tenant. This is a one-time operation. You will be provided with a Client ID and a Client Secret. Please note this information down, as it will be required for the next step.  **Note:** The OAuth client will be owned by a Zuora user account. If you want to perform PUT, POST, or DELETE operations using the OAuth client, the owner of the OAuth client must have a Platform role that includes the \"API Write Access\" permission.  ### Generate a Token  After creating a client, you must make a call to obtain a bearer token using the [Generate an OAuth token](https://www.zuora.com/developer/api-reference/#operation/createToken) operation. This operation requires the following parameters: - `client_id` - the Client ID displayed when you created the OAuth client in the previous step - `client_secret` - the Client Secret displayed when you created the OAuth client in the previous step - `grant_type` - must be set to `client_credentials`  **Note**: The Client ID and Client Secret mentioned above were displayed when you created the OAuth Client in the prior step. The [Generate an OAuth token](https://www.zuora.com/developer/api-reference/#operation/createToken) response specifies how long the bearer token is valid for. Call [Generate an OAuth token](https://www.zuora.com/developer/api-reference/#operation/createToken) again to generate a new bearer token.  For every subsequent API request, a valid bearer token must be provided in an HTTP header:  `Authorization: Bearer {bearer_token}`     ## Other Supported Authentication Schemes  Zuora continues to support the following additional legacy means of authentication:    * Use username and password. Include authentication with each request in the header:         * `apiAccessKeyId`      * `apiSecretAccessKey`     * `entityId` or `entityName` (Only for [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity \"Multi-entity\"). See \"Entity Id and Entity Name\" below for more information.)    * Use an authorization cookie. The cookie authorizes the user to make calls to the REST API for the duration specified in  **Administration > Security Policies > Session timeout**. The cookie expiration time is reset with this duration after every call to the REST API. To obtain a cookie, call the REST  `connections` resource with the following API user information:         *   ID         *   password     *   entity Id or entity name (Only for [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity \"Multi-entity\"). See \"Entity Id and Entity Name\" below for more information.)         * For CORS-enabled APIs only: Include a 'single-use' token in the request header, which re-authenticates the user with each request. See below for more details.  ### Entity Id and Entity Name  The `entityId` and `entityName` parameters are only used for [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity \"Zuora Multi-entity\").   The  `entityId` and `entityName` parameters specify the Id and the [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name \"Introduction to Entity and Entity Hierarchy\") that you want to access, respectively. Note that you must have permission to access the entity.   You can specify either the `entityId` or `entityName` parameter in the authentication to access and view an entity.    * If both `entityId` and `entityName` are specified in the authentication, an error occurs.    * If neither `entityId` nor `entityName` is specified in the authentication, you will log in to the entity in which your user account is created.      To get the entity Id and entity name, you can use the GET Entities REST call. For more information, see [API User Authentication](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/A_Overview_of_Multi-entity#API_User_Authentication \"API User Authentication\").      ### Token Authentication for CORS-Enabled APIs      The CORS mechanism enables REST API calls to Zuora to be made directly from your customer's browser, with all credit card and security information transmitted directly to Zuora. This minimizes your PCI compliance burden, allows you to implement advanced validation on your payment forms, and  makes your payment forms look just like any other part of your website.    For security reasons, instead of using cookies, an API request via CORS uses **tokens** for authentication.  The token method of authentication is only designed for use with requests that must originate from your customer's browser; **it should  not be considered a replacement to the existing cookie authentication** mechanism.  See [Zuora CORS REST](https://knowledgecenter.zuora.com/DC_Developers/REST_API/A_REST_basics/G_CORS_REST \"Zuora CORS REST\") for details on how CORS works and how you can begin to implement customer calls to the Zuora REST APIs. See  [HMAC Signatures](https://www.zuora.com/developer/api-reference/#operation/POSTHMACSignature \"HMAC Signatures\") for details on the HMAC method that returns the authentication token.  # Requests and Responses  ## Request IDs  As a general rule, when asked to supply a \"key\" for an account or subscription (accountKey, account-key, subscriptionKey, subscription-key), you can provide either the actual ID or  the number of the entity.  ## HTTP Request Body  Most of the parameters and data accompanying your requests will be contained in the body of the HTTP request.   The Zuora REST API accepts JSON in the HTTP request body. No other data format (e.g., XML) is supported.  ### Data Type  ([Actions](https://www.zuora.com/developer/api-reference/#tag/Actions) and CRUD operations only) We recommend that you do not specify the decimal values with quotation marks, commas, and spaces. Use characters of `+-0-9.eE`, for example, `5`, `1.9`, `-8.469`, and `7.7e2`. Also, Zuora does not convert currencies for decimal values.  ## Testing a Request  Use a third party client, such as [curl](https://curl.haxx.se \"curl\"), [Postman](https://www.getpostman.com \"Postman\"), or [Advanced REST Client](https://advancedrestclient.com \"Advanced REST Client\"), to test the Zuora REST API.  You can test the Zuora REST API from the Zuora API Sandbox or Production tenants. If connecting to Production, bear in mind that you are working with your live production data, not sample data or test data.  ## Testing with Credit Cards  Sooner or later it will probably be necessary to test some transactions that involve credit cards. For suggestions on how to handle this, see [Going Live With Your Payment Gateway](https://knowledgecenter.zuora.com/CB_Billing/M_Payment_Gateways/C_Managing_Payment_Gateways/B_Going_Live_Payment_Gateways#Testing_with_Credit_Cards \"C_Zuora_User_Guides/A_Billing_and_Payments/M_Payment_Gateways/C_Managing_Payment_Gateways/B_Going_Live_Payment_Gateways#Testing_with_Credit_Cards\" ).  ## Concurrent Request Limits  Zuora enforces tenant-level concurrent request limits. See <a href=\"https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Policies/Concurrent_Request_Limits\" target=\"_blank\">Concurrent Request Limits</a> for more information.    ## Error Handling  Responses and error codes are detailed in [Responses and errors](https://knowledgecenter.zuora.com/DC_Developers/REST_API/A_REST_basics/3_Responses_and_errors \"Responses and errors\").  # Pagination  When retrieving information (using GET methods), the optional `pageSize` query parameter sets the maximum number of rows to return in a response. The maximum is `40`; larger values are treated as `40`. If this value is empty or invalid, `pageSize` typically defaults to `10`.  The default value for the maximum number of rows retrieved can be overridden at the method level.  If more rows are available, the response will include a `nextPage` element, which contains a URL for requesting the next page.  If this value is not provided, no more rows are available. No \"previous page\" element is explicitly provided; to support backward paging, use the previous call.  ## Array Size  For data items that are not paginated, the REST API supports arrays of up to 300 rows.  Thus, for instance, repeated pagination can retrieve thousands of customer accounts, but within any account an array of no more than 300 rate plans is returned.  # API Versions  The Zuora REST API are version controlled. Versioning ensures that Zuora REST API changes are backward compatible. Zuora uses a major and minor version nomenclature to manage changes. By specifying a version in a REST request, you can get expected responses regardless of future changes to the API.  ## Major Version  The major version number of the REST API appears in the REST URL. Currently, Zuora only supports the **v1** major version. For example, `POST https://rest.zuora.com/v1/subscriptions`.  ## Minor Version  Zuora uses minor versions for the REST API to control small changes. For example, a field in a REST method is deprecated and a new field is used to replace it.   Some fields in the REST methods are supported as of minor versions. If a field is not noted with a minor version, this field is available for all minor versions. If a field is noted with a minor version, this field is in version control. You must specify the supported minor version in the request header to process without an error.   If a field is in version control, it is either with a minimum minor version or a maximum minor version, or both of them. You can only use this field with the minor version between the minimum and the maximum minor versions. For example, the `invoiceCollect` field in the POST Subscription method is in version control and its maximum minor version is 189.0. You can only use this field with the minor version 189.0 or earlier.  If you specify a version number in the request header that is not supported, Zuora will use the minimum minor version of the REST API. In our REST API documentation, if a field or feature requires a minor version number, we note that in the field description.  You only need to specify the version number when you use the fields require a minor version. To specify the minor version, set the `zuora-version` parameter to the minor version number in the request header for the request call. For example, the `collect` field is in 196.0 minor version. If you want to use this field for the POST Subscription method, set the  `zuora-version` parameter to `196.0` in the request header. The `zuora-version` parameter is case sensitive.  For all the REST API fields, by default, if the minor version is not specified in the request header, Zuora will use the minimum minor version of the REST API to avoid breaking your integration.   ### Minor Version History  The supported minor versions are not serial. This section documents the changes made to each Zuora REST API minor version.  The following table lists the supported versions and the fields that have a Zuora REST API minor version.  | Fields         | Minor Version      | REST Methods    | Description | |:--------|:--------|:--------|:--------| | invoiceCollect | 189.0 and earlier  | [Create Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_Subscription \"Create Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\"); [Renew Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_RenewSubscription \"Renew Subscription\"); [Cancel Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_CancelSubscription \"Cancel Subscription\"); [Suspend Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_SuspendSubscription \"Suspend Subscription\"); [Resume Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_ResumeSubscription \"Resume Subscription\"); [Create Account](https://www.zuora.com/developer/api-reference/#operation/POST_Account \"Create Account\")|Generates an invoice and collects a payment for a subscription. | | collect        | 196.0 and later    | [Create Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_Subscription \"Create Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\"); [Renew Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_RenewSubscription \"Renew Subscription\"); [Cancel Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_CancelSubscription \"Cancel Subscription\"); [Suspend Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_SuspendSubscription \"Suspend Subscription\"); [Resume Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_ResumeSubscription \"Resume Subscription\"); [Create Account](https://www.zuora.com/developer/api-reference/#operation/POST_Account \"Create Account\")|Collects an automatic payment for a subscription. | | invoice | 196.0 and 207.0| [Create Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_Subscription \"Create Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\"); [Renew Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_RenewSubscription \"Renew Subscription\"); [Cancel Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_CancelSubscription \"Cancel Subscription\"); [Suspend Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_SuspendSubscription \"Suspend Subscription\"); [Resume Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_ResumeSubscription \"Resume Subscription\"); [Create Account](https://www.zuora.com/developer/api-reference/#operation/POST_Account \"Create Account\")|Generates an invoice for a subscription. | | invoiceTargetDate | 196.0 and earlier  | [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview \"Preview Subscription\") |Date through which charges are calculated on the invoice, as `yyyy-mm-dd`. | | invoiceTargetDate | 207.0 and earlier  | [Create Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_Subscription \"Create Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\"); [Renew Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_RenewSubscription \"Renew Subscription\"); [Cancel Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_CancelSubscription \"Cancel Subscription\"); [Suspend Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_SuspendSubscription \"Suspend Subscription\"); [Resume Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_ResumeSubscription \"Resume Subscription\"); [Create Account](https://www.zuora.com/developer/api-reference/#operation/POST_Account \"Create Account\")|Date through which charges are calculated on the invoice, as `yyyy-mm-dd`. | | targetDate | 207.0 and later | [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview \"Preview Subscription\") |Date through which charges are calculated on the invoice, as `yyyy-mm-dd`. | | targetDate | 211.0 and later | [Create Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_Subscription \"Create Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\"); [Renew Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_RenewSubscription \"Renew Subscription\"); [Cancel Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_CancelSubscription \"Cancel Subscription\"); [Suspend Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_SuspendSubscription \"Suspend Subscription\"); [Resume Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_ResumeSubscription \"Resume Subscription\"); [Create Account](https://www.zuora.com/developer/api-reference/#operation/POST_Account \"Create Account\")|Date through which charges are calculated on the invoice, as `yyyy-mm-dd`. | | includeExisting DraftInvoiceItems | 196.0 and earlier| [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview \"Preview Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\") | Specifies whether to include draft invoice items in subscription previews. Specify it to be `true` (default) to include draft invoice items in the preview result. Specify it to be `false` to excludes draft invoice items in the preview result. | | includeExisting DraftDocItems | 207.0 and later  | [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview \"Preview Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\") | Specifies whether to include draft invoice items in subscription previews. Specify it to be `true` (default) to include draft invoice items in the preview result. Specify it to be `false` to excludes draft invoice items in the preview result. | | previewType | 196.0 and earlier| [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview \"Preview Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\") | The type of preview you will receive. The possible values are `InvoiceItem`(default), `ChargeMetrics`, and `InvoiceItemChargeMetrics`. | | previewType | 207.0 and later  | [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview \"Preview Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\") | The type of preview you will receive. The possible values are `LegalDoc`(default), `ChargeMetrics`, and `LegalDocChargeMetrics`. | | runBilling  | 211.0 and later  | [Create Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_Subscription \"Create Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\"); [Renew Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_RenewSubscription \"Renew Subscription\"); [Cancel Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_CancelSubscription \"Cancel Subscription\"); [Suspend Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_SuspendSubscription \"Suspend Subscription\"); [Resume Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_ResumeSubscription \"Resume Subscription\"); [Create Account](https://www.zuora.com/developer/api-reference/#operation/POST_Account \"Create Account\")|Generates an invoice or credit memo for a subscription. **Note:** Credit memos are only available if you have the Advanced AR Settlement feature enabled. | | invoiceDate | 214.0 and earlier  | [Invoice and Collect](https://www.zuora.com/developer/api-reference/#operation/POST_TransactionInvoicePayment \"Invoice and Collect\") |Date that should appear on the invoice being generated, as `yyyy-mm-dd`. | | invoiceTargetDate | 214.0 and earlier  | [Invoice and Collect](https://www.zuora.com/developer/api-reference/#operation/POST_TransactionInvoicePayment \"Invoice and Collect\") |Date through which to calculate charges on this account if an invoice is generated, as `yyyy-mm-dd`. | | documentDate | 215.0 and later | [Invoice and Collect](https://www.zuora.com/developer/api-reference/#operation/POST_TransactionInvoicePayment \"Invoice and Collect\") |Date that should appear on the invoice and credit memo being generated, as `yyyy-mm-dd`. | | targetDate | 215.0 and later | [Invoice and Collect](https://www.zuora.com/developer/api-reference/#operation/POST_TransactionInvoicePayment \"Invoice and Collect\") |Date through which to calculate charges on this account if an invoice or a credit memo is generated, as `yyyy-mm-dd`. |  #### Version 207.0 and Later  The response structure of the [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview \"Preview Subscription\") and [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\") methods are changed. The following invoice related response fields are moved to the invoice container:    * amount   * amountWithoutTax   * taxAmount   * invoiceItems   * targetDate   * chargeMetrics  # Zuora Object Model  The following diagram presents a high-level view of the key Zuora objects. Click the image to open it in a new tab to resize it.  <a href=\"https://www.zuora.com/wp-content/uploads/2017/01/ZuoraERD.jpeg\" target=\"_blank\"><img src=\"https://www.zuora.com/wp-content/uploads/2017/01/ZuoraERD.jpeg\" alt=\"Zuora Object Model Diagram\"></a>  You can use the [Describe object](https://www.zuora.com/developer/api-reference/#operation/GET_Describe) operation to list the fields of each Zuora object that is available in your tenant. When you call the operation, you must specify the API name of the Zuora object.  The following table provides the API name of each Zuora object:  | Object                                        | API Name                                   | |-----------------------------------------------|--------------------------------------------| | Account                                       | `Account`                                  | | Accounting Code                               | `AccountingCode`                           | | Accounting Period                             | `AccountingPeriod`                         | | Amendment                                     | `Amendment`                                | | Application Group                             | `ApplicationGroup`                         | | Billing Run                                   | `BillingRun`                               | | Contact                                       | `Contact`                                  | | Contact Snapshot                              | `ContactSnapshot`                          | | Credit Balance Adjustment                     | `CreditBalanceAdjustment`                  | | Credit Memo                                   | `CreditMemo`                               | | Credit Memo Application                       | `CreditMemoApplication`                    | | Credit Memo Application Item                  | `CreditMemoApplicationItem`                | | Credit Memo Item                              | `CreditMemoItem`                           | | Credit Memo Part                              | `CreditMemoPart`                           | | Credit Memo Part Item                         | `CreditMemoPartItem`                       | | Credit Taxation Item                          | `CreditTaxationItem`                       | | Custom Exchange Rate                          | `FXCustomRate`                             | | Debit Memo                                    | `DebitMemo`                                | | Debit Memo Item                               | `DebitMemoItem`                            | | Debit Taxation Item                           | `DebitTaxationItem`                        | | Discount Applied Metrics                      | `DiscountAppliedMetrics`                   | | Entity                                        | `Tenant`                                   | | Gateway Reconciliation Event                  | `PaymentGatewayReconciliationEventLog`     | | Gateway Reconciliation Job                    | `PaymentReconciliationJob`                 | | Gateway Reconciliation Log                    | `PaymentReconciliationLog`                 | | Invoice                                       | `Invoice`                                  | | Invoice Adjustment                            | `InvoiceAdjustment`                        | | Invoice Item                                  | `InvoiceItem`                              | | Invoice Item Adjustment                       | `InvoiceItemAdjustment`                    | | Invoice Payment                               | `InvoicePayment`                           | | Journal Entry                                 | `JournalEntry`                             | | Journal Entry Item                            | `JournalEntryItem`                         | | Journal Run                                   | `JournalRun`                               | | Order                                         | `Order`                                    | | Order Action                                  | `OrderAction`                              | | Order MRR                                     | `OrderMrr`                                 | | Order Quantity                                | `OrderQuantity`                            | | Order TCB                                     | `OrderTcb`                                 | | Order TCV                                     | `OrderTcv`                                 | | Payment                                       | `Payment`                                  | | Payment Application                           | `PaymentApplication`                       | | Payment Application Item                      | `PaymentApplicationItem`                   | | Payment Method                                | `PaymentMethod`                            | | Payment Method Snapshot                       | `PaymentMethodSnapshot`                    | | Payment Method Transaction Log                | `PaymentMethodTransactionLog`              | | Payment Method Update                         | `UpdaterDetail`                            | | Payment Part                                  | `PaymentPart`                              | | Payment Part Item                             | `PaymentPartItem`                          | | Payment Run                                   | `PaymentRun`                               | | Payment Transaction Log                       | `PaymentTransactionLog`                    | | Processed Usage                               | `ProcessedUsage`                           | | Product                                       | `Product`                                  | | Product Rate Plan                             | `ProductRatePlan`                          | | Product Rate Plan Charge                      | `ProductRatePlanCharge`                    | | Product Rate Plan Charge Tier                 | `ProductRatePlanChargeTier`                | | Rate Plan                                     | `RatePlan`                                 | | Rate Plan Charge                              | `RatePlanCharge`                           | | Rate Plan Charge Tier                         | `RatePlanChargeTier`                       | | Refund                                        | `Refund`                                   | | Refund Application                            | `RefundApplication`                        | | Refund Application Item                       | `RefundApplicationItem`                    | | Refund Invoice Payment                        | `RefundInvoicePayment`                     | | Refund Part                                   | `RefundPart`                               | | Refund Part Item                              | `RefundPartItem`                           | | Refund Transaction Log                        | `RefundTransactionLog`                     | | Revenue Charge Summary                        | `RevenueChargeSummary`                     | | Revenue Charge Summary Item                   | `RevenueChargeSummaryItem`                 | | Revenue Event                                 | `RevenueEvent`                             | | Revenue Event Credit Memo Item                | `RevenueEventCreditMemoItem`               | | Revenue Event Debit Memo Item                 | `RevenueEventDebitMemoItem`                | | Revenue Event Invoice Item                    | `RevenueEventInvoiceItem`                  | | Revenue Event Invoice Item Adjustment         | `RevenueEventInvoiceItemAdjustment`        | | Revenue Event Item                            | `RevenueEventItem`                         | | Revenue Event Item Credit Memo Item           | `RevenueEventItemCreditMemoItem`           | | Revenue Event Item Debit Memo Item            | `RevenueEventItemDebitMemoItem`            | | Revenue Event Item Invoice Item               | `RevenueEventItemInvoiceItem`              | | Revenue Event Item Invoice Item Adjustment    | `RevenueEventItemInvoiceItemAdjustment`    | | Revenue Event Type                            | `RevenueEventType`                         | | Revenue Schedule                              | `RevenueSchedule`                          | | Revenue Schedule Credit Memo Item             | `RevenueScheduleCreditMemoItem`            | | Revenue Schedule Debit Memo Item              | `RevenueScheduleDebitMemoItem`             | | Revenue Schedule Invoice Item                 | `RevenueScheduleInvoiceItem`               | | Revenue Schedule Invoice Item Adjustment      | `RevenueScheduleInvoiceItemAdjustment`     | | Revenue Schedule Item                         | `RevenueScheduleItem`                      | | Revenue Schedule Item Credit Memo Item        | `RevenueScheduleItemCreditMemoItem`        | | Revenue Schedule Item Debit Memo Item         | `RevenueScheduleItemDebitMemoItem`         | | Revenue Schedule Item Invoice Item            | `RevenueScheduleItemInvoiceItem`           | | Revenue Schedule Item Invoice Item Adjustment | `RevenueScheduleItemInvoiceItemAdjustment` | | Subscription                                  | `Subscription`                             | | Taxable Item Snapshot                         | `TaxableItemSnapshot`                      | | Taxation Item                                 | `TaxationItem`                             | | Updater Batch                                 | `UpdaterBatch`                             | | Usage                                         | `Usage`                                    | 

This SDK is automatically generated by the [Swagger Codegen](https://github.com/swagger-api/swagger-codegen) project:

- API version: 2017-11-15
- Package version: 1.0.0
- Build package: io.swagger.codegen.languages.RubyClientCodegen

## Installation

### Build a gem

To build the Ruby code into a gem:

```shell
gem build swagger_client.gemspec
```

Then either install the gem locally:

```shell
gem install ./swagger_client-1.0.0.gem
```
(for development, run `gem install --dev ./swagger_client-1.0.0.gem` to install the development dependencies)

or publish the gem to a gem hosting service, e.g. [RubyGems](https://rubygems.org/).

Finally add this to the Gemfile:

    gem 'swagger_client', '~> 1.0.0'

### Install from Git

If the Ruby gem is hosted at a git repository: https://github.com/GIT_USER_ID/GIT_REPO_ID, then add the following in the Gemfile:

    gem 'swagger_client', :git => 'https://github.com/GIT_USER_ID/GIT_REPO_ID.git'

### Include the Ruby code directly

Include the Ruby code directly using `-I` as follows:

```shell
ruby -Ilib script.rb
```

## Getting Started

Please follow the [installation](#installation) procedure and then run the following code:
```ruby
# Load the gem
require 'swagger_client'

api_instance = SwaggerClient::AccountingCodesApi.new

ac_id = "ac_id_example" # String | ID of the accounting code you want to delete.

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Delete accounting code
  result = api_instance.d_elete_accounting_code(ac_id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling AccountingCodesApi->d_elete_accounting_code: #{e}"
end

```

## Documentation for API Endpoints

All URIs are relative to *https://rest.zuora.com*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*SwaggerClient::AccountingCodesApi* | [**d_elete_accounting_code**](docs/AccountingCodesApi.md#d_elete_accounting_code) | **DELETE** /v1/accounting-codes/{ac-id} | Delete accounting code
*SwaggerClient::AccountingCodesApi* | [**g_et_accounting_code**](docs/AccountingCodesApi.md#g_et_accounting_code) | **GET** /v1/accounting-codes/{ac-id} | Query an accounting code
*SwaggerClient::AccountingCodesApi* | [**g_et_all_accounting_codes**](docs/AccountingCodesApi.md#g_et_all_accounting_codes) | **GET** /v1/accounting-codes | Get all accounting codes
*SwaggerClient::AccountingCodesApi* | [**p_ost_accounting_code**](docs/AccountingCodesApi.md#p_ost_accounting_code) | **POST** /v1/accounting-codes | Create accounting code
*SwaggerClient::AccountingCodesApi* | [**p_ut_accounting_code**](docs/AccountingCodesApi.md#p_ut_accounting_code) | **PUT** /v1/accounting-codes/{ac-id} | Update an accounting code
*SwaggerClient::AccountingCodesApi* | [**p_ut_activate_accounting_code**](docs/AccountingCodesApi.md#p_ut_activate_accounting_code) | **PUT** /v1/accounting-codes/{ac-id}/activate | Activate accounting code
*SwaggerClient::AccountingCodesApi* | [**p_ut_deactivate_accounting_code**](docs/AccountingCodesApi.md#p_ut_deactivate_accounting_code) | **PUT** /v1/accounting-codes/{ac-id}/deactivate | Deactivate accounting code
*SwaggerClient::AccountingPeriodsApi* | [**d_elete_accounting_period**](docs/AccountingPeriodsApi.md#d_elete_accounting_period) | **DELETE** /v1/accounting-periods/{ap-id} | Delete accounting period
*SwaggerClient::AccountingPeriodsApi* | [**g_et_accounting_period**](docs/AccountingPeriodsApi.md#g_et_accounting_period) | **GET** /v1/accounting-periods/{ap-id} | Get accounting period
*SwaggerClient::AccountingPeriodsApi* | [**g_et_all_accounting_periods**](docs/AccountingPeriodsApi.md#g_et_all_accounting_periods) | **GET** /v1/accounting-periods | Get all accounting periods
*SwaggerClient::AccountingPeriodsApi* | [**p_ost_accounting_period**](docs/AccountingPeriodsApi.md#p_ost_accounting_period) | **POST** /v1/accounting-periods | Create accounting period
*SwaggerClient::AccountingPeriodsApi* | [**p_ut_close_accounting_period**](docs/AccountingPeriodsApi.md#p_ut_close_accounting_period) | **PUT** /v1/accounting-periods/{ap-id}/close | Close accounting period
*SwaggerClient::AccountingPeriodsApi* | [**p_ut_pending_close_accounting_period**](docs/AccountingPeriodsApi.md#p_ut_pending_close_accounting_period) | **PUT** /v1/accounting-periods/{ap-id}/pending-close | Set accounting period to pending close
*SwaggerClient::AccountingPeriodsApi* | [**p_ut_reopen_accounting_period**](docs/AccountingPeriodsApi.md#p_ut_reopen_accounting_period) | **PUT** /v1/accounting-periods/{ap-id}/reopen | Re-open accounting period
*SwaggerClient::AccountingPeriodsApi* | [**p_ut_run_trial_balance**](docs/AccountingPeriodsApi.md#p_ut_run_trial_balance) | **PUT** /v1/accounting-periods/{ap-id}/run-trial-balance | Run trial balance
*SwaggerClient::AccountingPeriodsApi* | [**p_ut_update_accounting_period**](docs/AccountingPeriodsApi.md#p_ut_update_accounting_period) | **PUT** /v1/accounting-periods/{ap-id} | Update accounting period
*SwaggerClient::AccountsApi* | [**g_et_account**](docs/AccountsApi.md#g_et_account) | **GET** /v1/accounts/{account-key} | Get account
*SwaggerClient::AccountsApi* | [**g_et_account_summary**](docs/AccountsApi.md#g_et_account_summary) | **GET** /v1/accounts/{account-key}/summary | Get account summary
*SwaggerClient::AccountsApi* | [**object_delete_account**](docs/AccountsApi.md#object_delete_account) | **DELETE** /v1/object/account/{id} | CRUD: Delete Account
*SwaggerClient::AccountsApi* | [**object_get_account**](docs/AccountsApi.md#object_get_account) | **GET** /v1/object/account/{id} | CRUD: Retrieve Account
*SwaggerClient::AccountsApi* | [**object_post_account**](docs/AccountsApi.md#object_post_account) | **POST** /v1/object/account | CRUD: Create Account
*SwaggerClient::AccountsApi* | [**object_put_account**](docs/AccountsApi.md#object_put_account) | **PUT** /v1/object/account/{id} | CRUD: Update Account
*SwaggerClient::AccountsApi* | [**p_ost_account**](docs/AccountsApi.md#p_ost_account) | **POST** /v1/accounts | Create account
*SwaggerClient::AccountsApi* | [**p_ost_generate_billing_documents**](docs/AccountsApi.md#p_ost_generate_billing_documents) | **POST** /v1/accounts/{id}/billing-documents/generate | Generate billing documents by account
*SwaggerClient::AccountsApi* | [**p_ut_account**](docs/AccountsApi.md#p_ut_account) | **PUT** /v1/accounts/{account-key} | Update account
*SwaggerClient::ActionsApi* | [**action_pos_tamend**](docs/ActionsApi.md#action_pos_tamend) | **POST** /v1/action/amend | Amend
*SwaggerClient::ActionsApi* | [**action_pos_tcreate**](docs/ActionsApi.md#action_pos_tcreate) | **POST** /v1/action/create | Create
*SwaggerClient::ActionsApi* | [**action_pos_tdelete**](docs/ActionsApi.md#action_pos_tdelete) | **POST** /v1/action/delete | Delete
*SwaggerClient::ActionsApi* | [**action_pos_texecute**](docs/ActionsApi.md#action_pos_texecute) | **POST** /v1/action/execute | Execute
*SwaggerClient::ActionsApi* | [**action_pos_tgenerate**](docs/ActionsApi.md#action_pos_tgenerate) | **POST** /v1/action/generate | Generate
*SwaggerClient::ActionsApi* | [**action_pos_tquery**](docs/ActionsApi.md#action_pos_tquery) | **POST** /v1/action/query | Query
*SwaggerClient::ActionsApi* | [**action_pos_tquery_more**](docs/ActionsApi.md#action_pos_tquery_more) | **POST** /v1/action/queryMore | QueryMore
*SwaggerClient::ActionsApi* | [**action_pos_tsubscribe**](docs/ActionsApi.md#action_pos_tsubscribe) | **POST** /v1/action/subscribe | Subscribe
*SwaggerClient::ActionsApi* | [**action_pos_tupdate**](docs/ActionsApi.md#action_pos_tupdate) | **POST** /v1/action/update | Update
*SwaggerClient::AmendmentsApi* | [**g_et_amendments_by_key**](docs/AmendmentsApi.md#g_et_amendments_by_key) | **GET** /v1/amendments/{amendment-key} | Get amendments by key
*SwaggerClient::AmendmentsApi* | [**g_et_amendments_by_subscription_id**](docs/AmendmentsApi.md#g_et_amendments_by_subscription_id) | **GET** /v1/amendments/subscriptions/{subscription-id} | Get amendments by subscription ID
*SwaggerClient::AmendmentsApi* | [**object_delete_amendment**](docs/AmendmentsApi.md#object_delete_amendment) | **DELETE** /v1/object/amendment/{id} | CRUD: Delete amendment
*SwaggerClient::AmendmentsApi* | [**object_get_amendment**](docs/AmendmentsApi.md#object_get_amendment) | **GET** /v1/object/amendment/{id} | CRUD: Get amendment
*SwaggerClient::AmendmentsApi* | [**object_post_amendment**](docs/AmendmentsApi.md#object_post_amendment) | **POST** /v1/object/amendment | CRUD: Create amendment
*SwaggerClient::AmendmentsApi* | [**object_put_amendment**](docs/AmendmentsApi.md#object_put_amendment) | **PUT** /v1/object/amendment/{id} | CRUD: Update amendment
*SwaggerClient::AttachmentsApi* | [**d_elete_attachments**](docs/AttachmentsApi.md#d_elete_attachments) | **DELETE** /v1/attachments/{attachment-id} | Delete attachments
*SwaggerClient::AttachmentsApi* | [**g_et_attachments**](docs/AttachmentsApi.md#g_et_attachments) | **GET** /v1/attachments/{attachment-id} | View attachments
*SwaggerClient::AttachmentsApi* | [**g_et_attachments_list**](docs/AttachmentsApi.md#g_et_attachments_list) | **GET** /v1/attachments/{object-type}/{object-key} | View attachments list
*SwaggerClient::AttachmentsApi* | [**p_ost_attachments**](docs/AttachmentsApi.md#p_ost_attachments) | **POST** /v1/attachments | Add attachments
*SwaggerClient::AttachmentsApi* | [**p_ut_attachments**](docs/AttachmentsApi.md#p_ut_attachments) | **PUT** /v1/attachments/{attachment-id} | Edit attachments
*SwaggerClient::BillRunApi* | [**object_delete_bill_run**](docs/BillRunApi.md#object_delete_bill_run) | **DELETE** /v1/object/bill-run/{id} | CRUD: Delete Bill Run
*SwaggerClient::BillRunApi* | [**object_get_bill_run**](docs/BillRunApi.md#object_get_bill_run) | **GET** /v1/object/bill-run/{id} | CRUD: Retrieve Bill Run
*SwaggerClient::BillRunApi* | [**object_post_bill_run**](docs/BillRunApi.md#object_post_bill_run) | **POST** /v1/object/bill-run | CRUD: Create Bill Run
*SwaggerClient::BillRunApi* | [**object_put_bill_run**](docs/BillRunApi.md#object_put_bill_run) | **PUT** /v1/object/bill-run/{id} | CRUD: Post or Cancel Bill Run
*SwaggerClient::BillRunApi* | [**p_ost_email_billing_documentsfrom_bill_run**](docs/BillRunApi.md#p_ost_email_billing_documentsfrom_bill_run) | **POST** /v1/bill-runs/{billRunId}/emails | Email billing documents generated from bill run
*SwaggerClient::BillingDocumentsApi* | [**g_et_billing_documents**](docs/BillingDocumentsApi.md#g_et_billing_documents) | **GET** /v1/billing-documents | Get billing documents
*SwaggerClient::BillingPreviewRunApi* | [**g_et_billing_preview_run**](docs/BillingPreviewRunApi.md#g_et_billing_preview_run) | **GET** /v1/billing-preview-runs/{billingPreviewRunId} | Get Billing Preview Run
*SwaggerClient::BillingPreviewRunApi* | [**p_ost_billing_preview_run**](docs/BillingPreviewRunApi.md#p_ost_billing_preview_run) | **POST** /v1/billing-preview-runs | Create Billing Preview Run
*SwaggerClient::CatalogApi* | [**g_et_catalog**](docs/CatalogApi.md#g_et_catalog) | **GET** /v1/catalog/products | Get product catalog
*SwaggerClient::CatalogApi* | [**p_ut_catalog**](docs/CatalogApi.md#p_ut_catalog) | **PUT** /v1/catalog/products/{product-id}/share | Multi-entity: Share a Product with an Entity
*SwaggerClient::ChargeRevenueSummariesApi* | [**g_etcrs_by_charge_id**](docs/ChargeRevenueSummariesApi.md#g_etcrs_by_charge_id) | **GET** /v1/charge-revenue-summaries/subscription-charges/{charge-key} | Get charge summary details by charge ID
*SwaggerClient::ChargeRevenueSummariesApi* | [**g_etcrs_by_crs_number**](docs/ChargeRevenueSummariesApi.md#g_etcrs_by_crs_number) | **GET** /v1/charge-revenue-summaries/{crs-number} | Get charge summary details by CRS number
*SwaggerClient::CommunicationProfilesApi* | [**object_get_communication_profile**](docs/CommunicationProfilesApi.md#object_get_communication_profile) | **GET** /v1/object/communication-profile/{id} | CRUD: Retrieve CommunicationProfile
*SwaggerClient::ConnectionsApi* | [**p_ost_connections**](docs/ConnectionsApi.md#p_ost_connections) | **POST** /v1/connections | Establish connection to Zuora REST API service
*SwaggerClient::ContactsApi* | [**object_delete_contact**](docs/ContactsApi.md#object_delete_contact) | **DELETE** /v1/object/contact/{id} | CRUD: Delete Contact
*SwaggerClient::ContactsApi* | [**object_get_contact**](docs/ContactsApi.md#object_get_contact) | **GET** /v1/object/contact/{id} | CRUD: Retrieve Contact
*SwaggerClient::ContactsApi* | [**object_post_contact**](docs/ContactsApi.md#object_post_contact) | **POST** /v1/object/contact | CRUD: Create Contact
*SwaggerClient::ContactsApi* | [**object_put_contact**](docs/ContactsApi.md#object_put_contact) | **PUT** /v1/object/contact/{id} | CRUD: Update Contact
*SwaggerClient::CreditBalanceAdjustmentsApi* | [**object_get_credit_balance_adjustment**](docs/CreditBalanceAdjustmentsApi.md#object_get_credit_balance_adjustment) | **GET** /v1/object/credit-balance-adjustment/{id} | CRUD: Retrieve CreditBalanceAdjustment
*SwaggerClient::CreditMemosApi* | [**d_elete_credit_memo**](docs/CreditMemosApi.md#d_elete_credit_memo) | **DELETE** /v1/creditmemos/{creditMemoId} | Delete credit memo
*SwaggerClient::CreditMemosApi* | [**g_et_breakdown_credit_memo_by_order**](docs/CreditMemosApi.md#g_et_breakdown_credit_memo_by_order) | **GET** /v1/creditmemos/{creditMemoNumber}/amountBreakdownByOrder | Get breakdown of credit memo by order
*SwaggerClient::CreditMemosApi* | [**g_et_credit_memo**](docs/CreditMemosApi.md#g_et_credit_memo) | **GET** /v1/creditmemos/{creditMemoId} | Get credit memo
*SwaggerClient::CreditMemosApi* | [**g_et_credit_memo_item**](docs/CreditMemosApi.md#g_et_credit_memo_item) | **GET** /v1/creditmemos/{creditMemoId}/items/{cmitemid} | Get credit memo item
*SwaggerClient::CreditMemosApi* | [**g_et_credit_memo_item_part**](docs/CreditMemosApi.md#g_et_credit_memo_item_part) | **GET** /v1/creditmemos/{creditMemoId}/parts/{partid}/itemparts/{itempartid} | Get credit memo part item
*SwaggerClient::CreditMemosApi* | [**g_et_credit_memo_item_parts**](docs/CreditMemosApi.md#g_et_credit_memo_item_parts) | **GET** /v1/creditmemos/{creditMemoId}/parts/{partid}/itemparts | Get credit memo part items
*SwaggerClient::CreditMemosApi* | [**g_et_credit_memo_items**](docs/CreditMemosApi.md#g_et_credit_memo_items) | **GET** /v1/creditmemos/{creditMemoId}/items | Get credit memo items
*SwaggerClient::CreditMemosApi* | [**g_et_credit_memo_part**](docs/CreditMemosApi.md#g_et_credit_memo_part) | **GET** /v1/creditmemos/{creditMemoId}/parts/{partid} | Get credit memo part
*SwaggerClient::CreditMemosApi* | [**g_et_credit_memo_parts**](docs/CreditMemosApi.md#g_et_credit_memo_parts) | **GET** /v1/creditmemos/{creditMemoId}/parts | Get credit memo parts
*SwaggerClient::CreditMemosApi* | [**g_et_credit_memos**](docs/CreditMemosApi.md#g_et_credit_memos) | **GET** /v1/creditmemos | Get credit memos
*SwaggerClient::CreditMemosApi* | [**p_ost_credit_memo_from_prpc**](docs/CreditMemosApi.md#p_ost_credit_memo_from_prpc) | **POST** /v1/creditmemos | Create credit memo from charge
*SwaggerClient::CreditMemosApi* | [**p_ost_credit_memo_pdf**](docs/CreditMemosApi.md#p_ost_credit_memo_pdf) | **POST** /v1/creditmemos/{creditMemoId}/pdfs | Create credit memo PDF
*SwaggerClient::CreditMemosApi* | [**p_ost_email_credit_memo**](docs/CreditMemosApi.md#p_ost_email_credit_memo) | **POST** /v1/creditmemos/{creditMemoId}/emails | Email credit memo
*SwaggerClient::CreditMemosApi* | [**p_ost_refund_credit_memo**](docs/CreditMemosApi.md#p_ost_refund_credit_memo) | **POST** /v1/creditmemos/{creditmemoId}/refunds | Refund credit memo
*SwaggerClient::CreditMemosApi* | [**p_ostcm_taxation_items**](docs/CreditMemosApi.md#p_ostcm_taxation_items) | **POST** /v1/creditmemos/{creditMemoId}/taxationitems | Create taxation items for credit memo
*SwaggerClient::CreditMemosApi* | [**p_ut_apply_credit_memo**](docs/CreditMemosApi.md#p_ut_apply_credit_memo) | **PUT** /v1/creditmemos/{creditMemoId}/apply | Apply credit memo
*SwaggerClient::CreditMemosApi* | [**p_ut_cancel_credit_memo**](docs/CreditMemosApi.md#p_ut_cancel_credit_memo) | **PUT** /v1/creditmemos/{creditMemoId}/cancel | Cancel credit memo
*SwaggerClient::CreditMemosApi* | [**p_ut_post_credit_memo**](docs/CreditMemosApi.md#p_ut_post_credit_memo) | **PUT** /v1/creditmemos/{creditMemoId}/post | Post credit memo
*SwaggerClient::CreditMemosApi* | [**p_ut_unapply_credit_memo**](docs/CreditMemosApi.md#p_ut_unapply_credit_memo) | **PUT** /v1/creditmemos/{creditMemoId}/unapply | Unapply credit memo
*SwaggerClient::CreditMemosApi* | [**p_ut_update_credit_memo**](docs/CreditMemosApi.md#p_ut_update_credit_memo) | **PUT** /v1/creditmemos/{creditMemoId} | Update credit memo
*SwaggerClient::CustomExchangeRatesApi* | [**g_et_custom_exchange_rates**](docs/CustomExchangeRatesApi.md#g_et_custom_exchange_rates) | **GET** /v1/custom-exchange-rates/{currency} | Get custom foreign currency exchange rates
*SwaggerClient::DebitMemosApi* | [**d_elete_debit_memo**](docs/DebitMemosApi.md#d_elete_debit_memo) | **DELETE** /v1/debitmemos/{debitMemoId} | Delete debit memo
*SwaggerClient::DebitMemosApi* | [**g_et_debit_memo**](docs/DebitMemosApi.md#g_et_debit_memo) | **GET** /v1/debitmemos/{debitMemoId} | Get debit memo
*SwaggerClient::DebitMemosApi* | [**g_et_debit_memo_item**](docs/DebitMemosApi.md#g_et_debit_memo_item) | **GET** /v1/debitmemos/{debitMemoId}/items/{dmitemid} | Get debit memo item
*SwaggerClient::DebitMemosApi* | [**g_et_debit_memo_items**](docs/DebitMemosApi.md#g_et_debit_memo_items) | **GET** /v1/debitmemos/{debitMemoId}/items | Get debit memo items
*SwaggerClient::DebitMemosApi* | [**g_et_debit_memos**](docs/DebitMemosApi.md#g_et_debit_memos) | **GET** /v1/debitmemos | Get debit memos
*SwaggerClient::DebitMemosApi* | [**p_ost_debit_memo_from_prpc**](docs/DebitMemosApi.md#p_ost_debit_memo_from_prpc) | **POST** /v1/debitmemos | Create debit memo from charge
*SwaggerClient::DebitMemosApi* | [**p_ost_debit_memo_pdf**](docs/DebitMemosApi.md#p_ost_debit_memo_pdf) | **POST** /v1/debitmemos/{debitMemoId}/pdfs | Create debit memo PDF
*SwaggerClient::DebitMemosApi* | [**p_ost_email_debit_memo**](docs/DebitMemosApi.md#p_ost_email_debit_memo) | **POST** /v1/debitmemos/{debitMemoId}/emails | Email debit memo
*SwaggerClient::DebitMemosApi* | [**p_ostdm_taxation_items**](docs/DebitMemosApi.md#p_ostdm_taxation_items) | **POST** /v1/debitmemos/{debitMemoId}/taxationitems | Create taxation items for debit memo
*SwaggerClient::DebitMemosApi* | [**p_ut_cancel_debit_memo**](docs/DebitMemosApi.md#p_ut_cancel_debit_memo) | **PUT** /v1/debitmemos/{debitMemoId}/cancel | Cancel debit memo
*SwaggerClient::DebitMemosApi* | [**p_ut_debit_memo**](docs/DebitMemosApi.md#p_ut_debit_memo) | **PUT** /v1/debitmemos/{debitMemoId} | Update debit memo
*SwaggerClient::DebitMemosApi* | [**p_ut_post_debit_memo**](docs/DebitMemosApi.md#p_ut_post_debit_memo) | **PUT** /v1/debitmemos/{debitMemoId}/post | Post debit memo
*SwaggerClient::DescribeApi* | [**g_et_describe**](docs/DescribeApi.md#g_et_describe) | **GET** /v1/describe/{object} | Describe object
*SwaggerClient::EntitiesApi* | [**d_elete_entities**](docs/EntitiesApi.md#d_elete_entities) | **DELETE** /v1/entities/{id} | Multi-entity: Delete entity
*SwaggerClient::EntitiesApi* | [**g_et_entities**](docs/EntitiesApi.md#g_et_entities) | **GET** /v1/entities | Multi-entity: Get entities
*SwaggerClient::EntitiesApi* | [**g_et_entity_by_id**](docs/EntitiesApi.md#g_et_entity_by_id) | **GET** /v1/entities/{id} | Multi-entity: Get entity by Id
*SwaggerClient::EntitiesApi* | [**p_ost_entities**](docs/EntitiesApi.md#p_ost_entities) | **POST** /v1/entities | Multi-entity: Create entity
*SwaggerClient::EntitiesApi* | [**p_ut_entities**](docs/EntitiesApi.md#p_ut_entities) | **PUT** /v1/entities/{id} | Multi-entity: Update entity
*SwaggerClient::EntitiesApi* | [**p_ut_provision_entity**](docs/EntitiesApi.md#p_ut_provision_entity) | **PUT** /v1/entities/{id}/provision | Multi-entity: Provision entity
*SwaggerClient::EntityConnectionsApi* | [**g_et_entity_connections**](docs/EntityConnectionsApi.md#g_et_entity_connections) | **GET** /v1/entity-connections | Multi-entity: Get connections
*SwaggerClient::EntityConnectionsApi* | [**p_ost_entity_connections**](docs/EntityConnectionsApi.md#p_ost_entity_connections) | **POST** /v1/entity-connections | Multi-entity: Initiate connection
*SwaggerClient::EntityConnectionsApi* | [**p_ut_entity_connections_accept**](docs/EntityConnectionsApi.md#p_ut_entity_connections_accept) | **PUT** /v1/entity-connections/{connection-id}/accept | Multi-entity: Accept connection
*SwaggerClient::EntityConnectionsApi* | [**p_ut_entity_connections_deny**](docs/EntityConnectionsApi.md#p_ut_entity_connections_deny) | **PUT** /v1/entity-connections/{connection-id}/deny | Multi-entity: Deny connection
*SwaggerClient::EntityConnectionsApi* | [**p_ut_entity_connections_disconnect**](docs/EntityConnectionsApi.md#p_ut_entity_connections_disconnect) | **PUT** /v1/entity-connections/{connection-id}/disconnect | Multi-entity: Disconnect connection
*SwaggerClient::ExportsApi* | [**object_get_export**](docs/ExportsApi.md#object_get_export) | **GET** /v1/object/export/{id} | CRUD: Retrieve Export
*SwaggerClient::ExportsApi* | [**object_post_export**](docs/ExportsApi.md#object_post_export) | **POST** /v1/object/export | CRUD: Create Export
*SwaggerClient::FeaturesApi* | [**object_delete_feature**](docs/FeaturesApi.md#object_delete_feature) | **DELETE** /v1/object/feature/{id} | CRUD: Delete Feature
*SwaggerClient::FeaturesApi* | [**object_get_feature**](docs/FeaturesApi.md#object_get_feature) | **GET** /v1/object/feature/{id} | CRUD: Retrieve Feature
*SwaggerClient::GetFilesApi* | [**g_et_files**](docs/GetFilesApi.md#g_et_files) | **GET** /v1/files/{file-id} | Get files
*SwaggerClient::HMACSignaturesApi* | [**p_osthmac_signatures**](docs/HMACSignaturesApi.md#p_osthmac_signatures) | **POST** /v1/hmac-signatures | Return HMAC signatures
*SwaggerClient::HostedPagesApi* | [**get_hosted_pages**](docs/HostedPagesApi.md#get_hosted_pages) | **GET** /v1/hostedpages | Return hosted pages
*SwaggerClient::ImportsApi* | [**object_get_import**](docs/ImportsApi.md#object_get_import) | **GET** /v1/object/import/{id} | CRUD: Retrieve Import
*SwaggerClient::InvoiceAdjustmentsApi* | [**object_delete_invoice_adjustment**](docs/InvoiceAdjustmentsApi.md#object_delete_invoice_adjustment) | **DELETE** /v1/object/invoice-adjustment/{id} | CRUD: Delete InvoiceAdjustment
*SwaggerClient::InvoiceAdjustmentsApi* | [**object_get_invoice_adjustment**](docs/InvoiceAdjustmentsApi.md#object_get_invoice_adjustment) | **GET** /v1/object/invoice-adjustment/{id} | CRUD: Retrieve InvoiceAdjustment
*SwaggerClient::InvoiceAdjustmentsApi* | [**object_post_invoice_adjustment**](docs/InvoiceAdjustmentsApi.md#object_post_invoice_adjustment) | **POST** /v1/object/invoice-adjustment | CRUD: Create InvoiceAdjustment
*SwaggerClient::InvoiceAdjustmentsApi* | [**object_put_invoice_adjustment**](docs/InvoiceAdjustmentsApi.md#object_put_invoice_adjustment) | **PUT** /v1/object/invoice-adjustment/{id} | CRUD: Update InvoiceAdjustment
*SwaggerClient::InvoiceItemAdjustmentsApi* | [**object_delete_invoice_item_adjustment**](docs/InvoiceItemAdjustmentsApi.md#object_delete_invoice_item_adjustment) | **DELETE** /v1/object/invoice-item-adjustment/{id} | CRUD: Delete InvoiceItemAdjustment
*SwaggerClient::InvoiceItemAdjustmentsApi* | [**object_get_invoice_item_adjustment**](docs/InvoiceItemAdjustmentsApi.md#object_get_invoice_item_adjustment) | **GET** /v1/object/invoice-item-adjustment/{id} | CRUD: Retrieve InvoiceItemAdjustment
*SwaggerClient::InvoiceItemsApi* | [**object_get_invoice_item**](docs/InvoiceItemsApi.md#object_get_invoice_item) | **GET** /v1/object/invoice-item/{id} | CRUD: Retrieve InvoiceItem
*SwaggerClient::InvoicePaymentsApi* | [**object_get_invoice_payment**](docs/InvoicePaymentsApi.md#object_get_invoice_payment) | **GET** /v1/object/invoice-payment/{id} | CRUD: Retrieve InvoicePayment
*SwaggerClient::InvoicePaymentsApi* | [**object_post_invoice_payment**](docs/InvoicePaymentsApi.md#object_post_invoice_payment) | **POST** /v1/object/invoice-payment | CRUD: Create InvoicePayment
*SwaggerClient::InvoicePaymentsApi* | [**object_put_invoice_payment**](docs/InvoicePaymentsApi.md#object_put_invoice_payment) | **PUT** /v1/object/invoice-payment/{id} | CRUD: Update InvoicePayment
*SwaggerClient::InvoiceSplitItemsApi* | [**object_get_invoice_split_item**](docs/InvoiceSplitItemsApi.md#object_get_invoice_split_item) | **GET** /v1/object/invoice-split-item/{id} | CRUD: Retrieve InvoiceSplitItem
*SwaggerClient::InvoiceSplitsApi* | [**object_get_invoice_split**](docs/InvoiceSplitsApi.md#object_get_invoice_split) | **GET** /v1/object/invoice-split/{id} | CRUD: Retrieve InvoiceSplit
*SwaggerClient::InvoicesApi* | [**g_et_breakdown_invoice_by_order**](docs/InvoicesApi.md#g_et_breakdown_invoice_by_order) | **GET** /v1/invoices/{invoiceNumber}/amountBreakdownByOrder | Get breakdown of invoice by order
*SwaggerClient::InvoicesApi* | [**object_delete_invoice**](docs/InvoicesApi.md#object_delete_invoice) | **DELETE** /v1/object/invoice/{id} | CRUD: Delete Invoice
*SwaggerClient::InvoicesApi* | [**object_get_invoice**](docs/InvoicesApi.md#object_get_invoice) | **GET** /v1/object/invoice/{id} | CRUD: Retrieve Invoice
*SwaggerClient::InvoicesApi* | [**object_put_invoice**](docs/InvoicesApi.md#object_put_invoice) | **PUT** /v1/object/invoice/{id} | CRUD: Update Invoice
*SwaggerClient::InvoicesApi* | [**p_ost_credit_memo_from_invoice**](docs/InvoicesApi.md#p_ost_credit_memo_from_invoice) | **POST** /v1/invoices/{invoiceId}/creditmemos | Create credit memo from invoice
*SwaggerClient::InvoicesApi* | [**p_ost_debit_memo_from_invoice**](docs/InvoicesApi.md#p_ost_debit_memo_from_invoice) | **POST** /v1/invoices/{invoiceId}/debitmemos | Create debit memo from invoice
*SwaggerClient::InvoicesApi* | [**p_ost_email_invoice**](docs/InvoicesApi.md#p_ost_email_invoice) | **POST** /v1/invoices/{invoiceId}/emails | Email invoice
*SwaggerClient::InvoicesApi* | [**p_ut_reverse_invoice**](docs/InvoicesApi.md#p_ut_reverse_invoice) | **PUT** /v1/invoices/{invoiceId}/reverse | Reverse invoice
*SwaggerClient::JournalRunsApi* | [**d_elete_journal_run**](docs/JournalRunsApi.md#d_elete_journal_run) | **DELETE** /v1/journal-runs/{jr-number} | Delete journal run
*SwaggerClient::JournalRunsApi* | [**g_et_journal_run**](docs/JournalRunsApi.md#g_et_journal_run) | **GET** /v1/journal-runs/{jr-number} | Get journal run
*SwaggerClient::JournalRunsApi* | [**p_ost_journal_run**](docs/JournalRunsApi.md#p_ost_journal_run) | **POST** /v1/journal-runs | Create journal run
*SwaggerClient::JournalRunsApi* | [**p_ut_journal_run**](docs/JournalRunsApi.md#p_ut_journal_run) | **PUT** /v1/journal-runs/{jr-number}/cancel | Cancel journal run
*SwaggerClient::MassUpdaterApi* | [**g_et_mass_updater**](docs/MassUpdaterApi.md#g_et_mass_updater) | **GET** /v1/bulk/{bulk-key} | Get mass action result
*SwaggerClient::MassUpdaterApi* | [**p_ost_mass_updater**](docs/MassUpdaterApi.md#p_ost_mass_updater) | **POST** /v1/bulk | Perform mass action
*SwaggerClient::MassUpdaterApi* | [**p_ut_mass_updater**](docs/MassUpdaterApi.md#p_ut_mass_updater) | **PUT** /v1/bulk/{bulk-key}/stop | Stop mass action
*SwaggerClient::NotificationHistoryApi* | [**g_et_callout_history**](docs/NotificationHistoryApi.md#g_et_callout_history) | **GET** /v1/notification-history/callout | Get callout notification histories
*SwaggerClient::NotificationHistoryApi* | [**g_et_email_history**](docs/NotificationHistoryApi.md#g_et_email_history) | **GET** /v1/notification-history/email | Get email notification histories
*SwaggerClient::OAuthApi* | [**create_token**](docs/OAuthApi.md#create_token) | **POST** /oauth/token | Generate an OAuth token
*SwaggerClient::OperationsApi* | [**p_ost_billing_preview**](docs/OperationsApi.md#p_ost_billing_preview) | **POST** /v1/operations/billing-preview | Create billing preview
*SwaggerClient::OperationsApi* | [**p_ost_transaction_invoice_payment**](docs/OperationsApi.md#p_ost_transaction_invoice_payment) | **POST** /v1/operations/invoice-collect | Invoice and collect
*SwaggerClient::OrdersApi* | [**d_elete_order**](docs/OrdersApi.md#d_elete_order) | **DELETE** /v1/orders/{orderNumber} | Delete order
*SwaggerClient::OrdersApi* | [**g_et_all_orders**](docs/OrdersApi.md#g_et_all_orders) | **GET** /v1/orders | Get all orders
*SwaggerClient::OrdersApi* | [**g_et_order**](docs/OrdersApi.md#g_et_order) | **GET** /v1/orders/{orderNumber} | Get an order
*SwaggerClient::OrdersApi* | [**g_et_order_billing_info**](docs/OrdersApi.md#g_et_order_billing_info) | **GET** /v1/orders/{orderNumber}/billingInfo | Get billing information for order
*SwaggerClient::OrdersApi* | [**g_et_order_metricsfor_evergreen_subscription**](docs/OrdersApi.md#g_et_order_metricsfor_evergreen_subscription) | **GET** /v1/orders/{orderNumber}/evergreenMetrics/{subscriptionNumber} | Get order metrics for evergreen subscription
*SwaggerClient::OrdersApi* | [**g_et_order_rated_result**](docs/OrdersApi.md#g_et_order_rated_result) | **GET** /v1/orders/{orderNumber}/ratedResults | Get rated result for order
*SwaggerClient::OrdersApi* | [**g_et_orders_by_invoice_owner**](docs/OrdersApi.md#g_et_orders_by_invoice_owner) | **GET** /v1/orders/invoiceOwner/{accountNumber} | Get orders by invoice owner
*SwaggerClient::OrdersApi* | [**g_et_orders_by_subscription_number**](docs/OrdersApi.md#g_et_orders_by_subscription_number) | **GET** /v1/orders/subscription/{subscriptionNumber} | Get orders by subscription number
*SwaggerClient::OrdersApi* | [**g_et_orders_by_subscription_owner**](docs/OrdersApi.md#g_et_orders_by_subscription_owner) | **GET** /v1/orders/subscriptionOwner/{accountNumber} | Get orders by subscription owner
*SwaggerClient::OrdersApi* | [**p_ost_order**](docs/OrdersApi.md#p_ost_order) | **POST** /v1/orders | Create and activate order
*SwaggerClient::OrdersApi* | [**p_ost_preview_order**](docs/OrdersApi.md#p_ost_preview_order) | **POST** /v1/orders/preview | Preview order
*SwaggerClient::OrdersApi* | [**p_ut_update_order_custom_fields**](docs/OrdersApi.md#p_ut_update_order_custom_fields) | **PUT** /v1/orders/{orderNumber}/customFields | Update order custom fields
*SwaggerClient::PaymentGatewaysApi* | [**g_et_paymentgateways**](docs/PaymentGatewaysApi.md#g_et_paymentgateways) | **GET** /v1/paymentgateways | Get payment gateways
*SwaggerClient::PaymentMethodSnapshotsApi* | [**object_get_payment_method_snapshot**](docs/PaymentMethodSnapshotsApi.md#object_get_payment_method_snapshot) | **GET** /v1/object/payment-method-snapshot/{id} | CRUD: Retrieve PaymentMethodSnapshot
*SwaggerClient::PaymentMethodTransactionLogsApi* | [**object_get_payment_method_transaction_log**](docs/PaymentMethodTransactionLogsApi.md#object_get_payment_method_transaction_log) | **GET** /v1/object/payment-method-transaction-log/{id} | CRUD: Retrieve PaymentMethodTransactionLog
*SwaggerClient::PaymentMethodsApi* | [**d_elete_payment_methods**](docs/PaymentMethodsApi.md#d_elete_payment_methods) | **DELETE** /v1/payment-methods/{payment-method-id} | Delete payment method
*SwaggerClient::PaymentMethodsApi* | [**g_et_payment_methods**](docs/PaymentMethodsApi.md#g_et_payment_methods) | **GET** /v1/payment-methods/credit-cards/accounts/{account-key} | Get payment methods
*SwaggerClient::PaymentMethodsApi* | [**object_delete_payment_method**](docs/PaymentMethodsApi.md#object_delete_payment_method) | **DELETE** /v1/object/payment-method/{id} | CRUD: Delete payment method
*SwaggerClient::PaymentMethodsApi* | [**object_get_payment_method**](docs/PaymentMethodsApi.md#object_get_payment_method) | **GET** /v1/object/payment-method/{id} | CRUD: Get payment method
*SwaggerClient::PaymentMethodsApi* | [**object_post_payment_method**](docs/PaymentMethodsApi.md#object_post_payment_method) | **POST** /v1/object/payment-method | CRUD: Create payment method
*SwaggerClient::PaymentMethodsApi* | [**object_put_payment_method**](docs/PaymentMethodsApi.md#object_put_payment_method) | **PUT** /v1/object/payment-method/{id} | CRUD: Update payment method
*SwaggerClient::PaymentMethodsApi* | [**p_ost_payment_methods**](docs/PaymentMethodsApi.md#p_ost_payment_methods) | **POST** /v1/payment-methods/credit-cards | Create payment method
*SwaggerClient::PaymentMethodsApi* | [**p_ost_payment_methods_decryption**](docs/PaymentMethodsApi.md#p_ost_payment_methods_decryption) | **POST** /v1/payment-methods/decryption | Create payment method decryption
*SwaggerClient::PaymentMethodsApi* | [**p_ut_payment_methods**](docs/PaymentMethodsApi.md#p_ut_payment_methods) | **PUT** /v1/payment-methods/credit-cards/{payment-method-id} | Update payment method
*SwaggerClient::PaymentMethodsApi* | [**p_ut_verify_payment_methods**](docs/PaymentMethodsApi.md#p_ut_verify_payment_methods) | **PUT** /v1/payment-methods/{payment-method-id}/verify | Verify payment method
*SwaggerClient::PaymentTransactionLogsApi* | [**object_get_payment_transaction_log**](docs/PaymentTransactionLogsApi.md#object_get_payment_transaction_log) | **GET** /v1/object/payment-transaction-log/{id} | CRUD: Get payment transaction log
*SwaggerClient::PaymentsApi* | [**d_elete_payment**](docs/PaymentsApi.md#d_elete_payment) | **DELETE** /v1/payments/{paymentId} | Delete payment
*SwaggerClient::PaymentsApi* | [**g_et_payment**](docs/PaymentsApi.md#g_et_payment) | **GET** /v1/payments/{paymentId} | Get payment
*SwaggerClient::PaymentsApi* | [**g_et_payment_item_part**](docs/PaymentsApi.md#g_et_payment_item_part) | **GET** /v1/payments/{paymentId}/parts/{partid}/itemparts/{itempartid} | Get payment part item
*SwaggerClient::PaymentsApi* | [**g_et_payment_item_parts**](docs/PaymentsApi.md#g_et_payment_item_parts) | **GET** /v1/payments/{paymentId}/parts/{partid}/itemparts | Get payment part items
*SwaggerClient::PaymentsApi* | [**g_et_payment_part**](docs/PaymentsApi.md#g_et_payment_part) | **GET** /v1/payments/{paymentId}/parts/{partid} | Get payment part
*SwaggerClient::PaymentsApi* | [**g_et_payment_parts**](docs/PaymentsApi.md#g_et_payment_parts) | **GET** /v1/payments/{paymentId}/parts | Get payment parts
*SwaggerClient::PaymentsApi* | [**g_et_retrieve_all_payments**](docs/PaymentsApi.md#g_et_retrieve_all_payments) | **GET** /v1/payments | Get all payments
*SwaggerClient::PaymentsApi* | [**object_delete_payment**](docs/PaymentsApi.md#object_delete_payment) | **DELETE** /v1/object/payment/{id} | CRUD: Delete payment
*SwaggerClient::PaymentsApi* | [**object_get_payment**](docs/PaymentsApi.md#object_get_payment) | **GET** /v1/object/payment/{id} | CRUD: Get payment
*SwaggerClient::PaymentsApi* | [**object_post_payment**](docs/PaymentsApi.md#object_post_payment) | **POST** /v1/object/payment | CRUD: Create payment
*SwaggerClient::PaymentsApi* | [**object_put_payment**](docs/PaymentsApi.md#object_put_payment) | **PUT** /v1/object/payment/{id} | CRUD: Update payment
*SwaggerClient::PaymentsApi* | [**p_ost_create_payment**](docs/PaymentsApi.md#p_ost_create_payment) | **POST** /v1/payments | Create payment
*SwaggerClient::PaymentsApi* | [**p_ost_refund_payment**](docs/PaymentsApi.md#p_ost_refund_payment) | **POST** /v1/payments/{paymentId}/refunds | Refund payment
*SwaggerClient::PaymentsApi* | [**p_ut_apply_payment**](docs/PaymentsApi.md#p_ut_apply_payment) | **PUT** /v1/payments/{paymentId}/apply | Apply payment
*SwaggerClient::PaymentsApi* | [**p_ut_cancel_payment**](docs/PaymentsApi.md#p_ut_cancel_payment) | **PUT** /v1/payments/{paymentId}/cancel | Cancel payment
*SwaggerClient::PaymentsApi* | [**p_ut_transfer_payment**](docs/PaymentsApi.md#p_ut_transfer_payment) | **PUT** /v1/payments/{paymentId}/transfer | Transfer payment
*SwaggerClient::PaymentsApi* | [**p_ut_unapply_payment**](docs/PaymentsApi.md#p_ut_unapply_payment) | **PUT** /v1/payments/{paymentId}/unapply | Unapply payment
*SwaggerClient::PaymentsApi* | [**p_ut_update_payment**](docs/PaymentsApi.md#p_ut_update_payment) | **PUT** /v1/payments/{paymentId} | Update payment
*SwaggerClient::ProductFeaturesApi* | [**object_delete_product_feature**](docs/ProductFeaturesApi.md#object_delete_product_feature) | **DELETE** /v1/object/product-feature/{id} | CRUD: Delete ProductFeature
*SwaggerClient::ProductFeaturesApi* | [**object_get_product_feature**](docs/ProductFeaturesApi.md#object_get_product_feature) | **GET** /v1/object/product-feature/{id} | CRUD: Retrieve ProductFeature
*SwaggerClient::ProductRatePlanChargeTiersApi* | [**object_get_product_rate_plan_charge_tier**](docs/ProductRatePlanChargeTiersApi.md#object_get_product_rate_plan_charge_tier) | **GET** /v1/object/product-rate-plan-charge-tier/{id} | CRUD: Retrieve ProductRatePlanChargeTier
*SwaggerClient::ProductRatePlanChargesApi* | [**object_delete_product_rate_plan_charge**](docs/ProductRatePlanChargesApi.md#object_delete_product_rate_plan_charge) | **DELETE** /v1/object/product-rate-plan-charge/{id} | CRUD: Delete ProductRatePlanCharge
*SwaggerClient::ProductRatePlanChargesApi* | [**object_get_product_rate_plan_charge**](docs/ProductRatePlanChargesApi.md#object_get_product_rate_plan_charge) | **GET** /v1/object/product-rate-plan-charge/{id} | CRUD: Retrieve ProductRatePlanCharge
*SwaggerClient::ProductRatePlansApi* | [**object_delete_product_rate_plan**](docs/ProductRatePlansApi.md#object_delete_product_rate_plan) | **DELETE** /v1/object/product-rate-plan/{id} | CRUD: Delete ProductRatePlan
*SwaggerClient::ProductRatePlansApi* | [**object_get_product_rate_plan**](docs/ProductRatePlansApi.md#object_get_product_rate_plan) | **GET** /v1/object/product-rate-plan/{id} | CRUD: Retrieve ProductRatePlan
*SwaggerClient::ProductRatePlansApi* | [**object_post_product_rate_plan**](docs/ProductRatePlansApi.md#object_post_product_rate_plan) | **POST** /v1/object/product-rate-plan | CRUD: Create ProductRatePlan
*SwaggerClient::ProductRatePlansApi* | [**object_put_product_rate_plan**](docs/ProductRatePlansApi.md#object_put_product_rate_plan) | **PUT** /v1/object/product-rate-plan/{id} | CRUD: Update ProductRatePlan
*SwaggerClient::ProductsApi* | [**object_delete_product**](docs/ProductsApi.md#object_delete_product) | **DELETE** /v1/object/product/{id} | CRUD: Delete Product
*SwaggerClient::ProductsApi* | [**object_get_product**](docs/ProductsApi.md#object_get_product) | **GET** /v1/object/product/{id} | CRUD: Retrieve Product
*SwaggerClient::ProductsApi* | [**object_post_product**](docs/ProductsApi.md#object_post_product) | **POST** /v1/object/product | CRUD: Create Product
*SwaggerClient::ProductsApi* | [**object_put_product**](docs/ProductsApi.md#object_put_product) | **PUT** /v1/object/product/{id} | CRUD: Update Product
*SwaggerClient::QuotesDocumentApi* | [**p_ost_quotes_document**](docs/QuotesDocumentApi.md#p_ost_quotes_document) | **POST** /v1/quotes/document | Generate quotes document
*SwaggerClient::RSASignaturesApi* | [**p_ost_decrypt_rsa_signatures**](docs/RSASignaturesApi.md#p_ost_decrypt_rsa_signatures) | **POST** /v1/rsa-signatures/decrypt | Decrypt RSA signature
*SwaggerClient::RSASignaturesApi* | [**p_ostrsa_signatures**](docs/RSASignaturesApi.md#p_ostrsa_signatures) | **POST** /v1/rsa-signatures | Generate RSA signature
*SwaggerClient::RatePlanChargeTiersApi* | [**object_get_rate_plan_charge_tier**](docs/RatePlanChargeTiersApi.md#object_get_rate_plan_charge_tier) | **GET** /v1/object/rate-plan-charge-tier/{id} | CRUD: Retrieve RatePlanChargeTier
*SwaggerClient::RatePlanChargesApi* | [**object_get_rate_plan_charge**](docs/RatePlanChargesApi.md#object_get_rate_plan_charge) | **GET** /v1/object/rate-plan-charge/{id} | CRUD: Retrieve RatePlanCharge
*SwaggerClient::RatePlansApi* | [**object_get_rate_plan**](docs/RatePlansApi.md#object_get_rate_plan) | **GET** /v1/object/rate-plan/{id} | CRUD: Retrieve RatePlan
*SwaggerClient::RefundInvoicePaymentsApi* | [**object_get_refund_invoice_payment**](docs/RefundInvoicePaymentsApi.md#object_get_refund_invoice_payment) | **GET** /v1/object/refund-invoice-payment/{id} | CRUD: Retrieve RefundInvoicePayment
*SwaggerClient::RefundTransactionLogsApi* | [**object_get_refund_transaction_log**](docs/RefundTransactionLogsApi.md#object_get_refund_transaction_log) | **GET** /v1/object/refund-transaction-log/{id} | CRUD: Retrieve RefundTransactionLog
*SwaggerClient::RefundsApi* | [**d_elete_refund**](docs/RefundsApi.md#d_elete_refund) | **DELETE** /v1/refunds/{refundId} | Delete refund
*SwaggerClient::RefundsApi* | [**g_et_refund**](docs/RefundsApi.md#g_et_refund) | **GET** /v1/refunds/{refundId} | Get refund
*SwaggerClient::RefundsApi* | [**g_et_refund_item_part**](docs/RefundsApi.md#g_et_refund_item_part) | **GET** /v1/refunds/{refundId}/parts/{refundpartid}/itemparts/{itempartid} | Get refund part item
*SwaggerClient::RefundsApi* | [**g_et_refund_item_parts**](docs/RefundsApi.md#g_et_refund_item_parts) | **GET** /v1/refunds/{refundId}/parts/{refundpartid}/itemparts | Get refund part items
*SwaggerClient::RefundsApi* | [**g_et_refund_part**](docs/RefundsApi.md#g_et_refund_part) | **GET** /v1/refunds/{refundId}/parts/{refundpartid} | Get refund part
*SwaggerClient::RefundsApi* | [**g_et_refund_parts**](docs/RefundsApi.md#g_et_refund_parts) | **GET** /v1/refunds/{refundId}/parts | Get refund parts
*SwaggerClient::RefundsApi* | [**g_et_refunds**](docs/RefundsApi.md#g_et_refunds) | **GET** /v1/refunds | Get all refunds
*SwaggerClient::RefundsApi* | [**object_delete_refund**](docs/RefundsApi.md#object_delete_refund) | **DELETE** /v1/object/refund/{id} | CRUD: Delete refund
*SwaggerClient::RefundsApi* | [**object_get_refund**](docs/RefundsApi.md#object_get_refund) | **GET** /v1/object/refund/{id} | CRUD: Get refund
*SwaggerClient::RefundsApi* | [**object_post_refund**](docs/RefundsApi.md#object_post_refund) | **POST** /v1/object/refund | CRUD: Create refund
*SwaggerClient::RefundsApi* | [**object_put_refund**](docs/RefundsApi.md#object_put_refund) | **PUT** /v1/object/refund/{id} | CRUD: Update refund
*SwaggerClient::RefundsApi* | [**p_ut_cancel_refund**](docs/RefundsApi.md#p_ut_cancel_refund) | **PUT** /v1/refunds/{refundId}/cancel | Cancel refund
*SwaggerClient::RefundsApi* | [**p_ut_update_refund**](docs/RefundsApi.md#p_ut_update_refund) | **PUT** /v1/refunds/{refundId} | Update refund
*SwaggerClient::RevenueEventsApi* | [**g_et_revenue_event_details**](docs/RevenueEventsApi.md#g_et_revenue_event_details) | **GET** /v1/revenue-events/{event-number} | Get revenue event details
*SwaggerClient::RevenueEventsApi* | [**g_et_revenue_event_for_revenue_schedule**](docs/RevenueEventsApi.md#g_et_revenue_event_for_revenue_schedule) | **GET** /v1/revenue-events/revenue-schedules/{rs-number} | Get revenue events for a revenue schedule
*SwaggerClient::RevenueItemsApi* | [**g_et_revenue_items_by_charge_revenue_event_number**](docs/RevenueItemsApi.md#g_et_revenue_items_by_charge_revenue_event_number) | **GET** /v1/revenue-items/revenue-events/{event-number} | Get revenue items by revenue event number
*SwaggerClient::RevenueItemsApi* | [**g_et_revenue_items_by_charge_revenue_summary_number**](docs/RevenueItemsApi.md#g_et_revenue_items_by_charge_revenue_summary_number) | **GET** /v1/revenue-items/charge-revenue-summaries/{crs-number} | Get revenue items by charge revenue summary number
*SwaggerClient::RevenueItemsApi* | [**g_et_revenue_items_by_revenue_schedule**](docs/RevenueItemsApi.md#g_et_revenue_items_by_revenue_schedule) | **GET** /v1/revenue-items/revenue-schedules/{rs-number} | Get revenue items by revenue schedule
*SwaggerClient::RevenueItemsApi* | [**p_ut_custom_fieldson_revenue_items_by_revenue_event**](docs/RevenueItemsApi.md#p_ut_custom_fieldson_revenue_items_by_revenue_event) | **PUT** /v1/revenue-items/revenue-events/{event-number} | Update custom fields on revenue items by revenue event number
*SwaggerClient::RevenueItemsApi* | [**p_ut_custom_fieldson_revenue_items_by_revenue_schedule**](docs/RevenueItemsApi.md#p_ut_custom_fieldson_revenue_items_by_revenue_schedule) | **PUT** /v1/revenue-items/revenue-schedules/{rs-number} | Update custom fields on revenue items by revenue schedule number
*SwaggerClient::RevenueRulesApi* | [**g_et_revenue_rec_ruleby_product_rate_plan_charge**](docs/RevenueRulesApi.md#g_et_revenue_rec_ruleby_product_rate_plan_charge) | **GET** /v1/revenue-recognition-rules/product-charges/{charge-key} | Get revenue recognition rule by product rate plan charge
*SwaggerClient::RevenueRulesApi* | [**g_et_revenue_rec_rules**](docs/RevenueRulesApi.md#g_et_revenue_rec_rules) | **GET** /v1/revenue-recognition-rules/subscription-charges/{charge-key} | Get revenue recognition rule by subscription charge
*SwaggerClient::RevenueSchedulesApi* | [**d_eleters**](docs/RevenueSchedulesApi.md#d_eleters) | **DELETE** /v1/revenue-schedules/{rs-number} | Delete revenue schedule
*SwaggerClient::RevenueSchedulesApi* | [**g_etr_sby_credit_memo_item**](docs/RevenueSchedulesApi.md#g_etr_sby_credit_memo_item) | **GET** /v1/revenue-schedules/credit-memo-items/{cmi-id} | Get revenue schedule by credit memo item ID 
*SwaggerClient::RevenueSchedulesApi* | [**g_etr_sby_debit_memo_item**](docs/RevenueSchedulesApi.md#g_etr_sby_debit_memo_item) | **GET** /v1/revenue-schedules/debit-memo-items/{dmi-id} | Get revenue schedule by debit memo item ID 
*SwaggerClient::RevenueSchedulesApi* | [**g_etr_sby_invoice_item**](docs/RevenueSchedulesApi.md#g_etr_sby_invoice_item) | **GET** /v1/revenue-schedules/invoice-items/{invoice-item-id} | Get revenue schedule by invoice item ID
*SwaggerClient::RevenueSchedulesApi* | [**g_etr_sby_invoice_item_adjustment**](docs/RevenueSchedulesApi.md#g_etr_sby_invoice_item_adjustment) | **GET** /v1/revenue-schedules/invoice-item-adjustments/{invoice-item-adj-id}/ | Get revenue schedule by invoice item adjustment
*SwaggerClient::RevenueSchedulesApi* | [**g_etr_sby_product_charge_and_billing_account**](docs/RevenueSchedulesApi.md#g_etr_sby_product_charge_and_billing_account) | **GET** /v1/revenue-schedules/product-charges/{charge-key}/{account-key} | Get all revenue schedules of product charge by charge ID and billing account ID 
*SwaggerClient::RevenueSchedulesApi* | [**g_etr_sfor_subsc_charge**](docs/RevenueSchedulesApi.md#g_etr_sfor_subsc_charge) | **GET** /v1/revenue-schedules/subscription-charges/{charge-key} | Get revenue schedule by subscription charge
*SwaggerClient::RevenueSchedulesApi* | [**g_etrs**](docs/RevenueSchedulesApi.md#g_etrs) | **GET** /v1/revenue-schedules/{rs-number} | Get revenue schedule details
*SwaggerClient::RevenueSchedulesApi* | [**p_ostr_sfor_credit_memo_item_distribute_by_date_range**](docs/RevenueSchedulesApi.md#p_ostr_sfor_credit_memo_item_distribute_by_date_range) | **POST** /v1/revenue-schedules/credit-memo-items/{cmi-id}/distribute-revenue-with-date-range | Create revenue schedule for credit memo item (distribute by date range) 
*SwaggerClient::RevenueSchedulesApi* | [**p_ostr_sfor_credit_memo_item_manual_distribution**](docs/RevenueSchedulesApi.md#p_ostr_sfor_credit_memo_item_manual_distribution) | **POST** /v1/revenue-schedules/credit-memo-items/{cmi-id} | Create revenue schedule for credit memo item (manual distribution) 
*SwaggerClient::RevenueSchedulesApi* | [**p_ostr_sfor_debit_memo_item_distribute_by_date_range**](docs/RevenueSchedulesApi.md#p_ostr_sfor_debit_memo_item_distribute_by_date_range) | **POST** /v1/revenue-schedules/debit-memo-items/{dmi-id}/distribute-revenue-with-date-range | Create revenue schedule for debit memo item (distribute by date range) 
*SwaggerClient::RevenueSchedulesApi* | [**p_ostr_sfor_debit_memo_item_manual_distribution**](docs/RevenueSchedulesApi.md#p_ostr_sfor_debit_memo_item_manual_distribution) | **POST** /v1/revenue-schedules/debit-memo-items/{dmi-id} | Create revenue schedule for debit memo item (manual distribution) 
*SwaggerClient::RevenueSchedulesApi* | [**p_ostr_sfor_invoice_item_adjustment_distribute_by_date_range**](docs/RevenueSchedulesApi.md#p_ostr_sfor_invoice_item_adjustment_distribute_by_date_range) | **POST** /v1/revenue-schedules/invoice-item-adjustments/{invoice-item-adj-key}/distribute-revenue-with-date-range | Create revenue schedule for Invoice Item Adjustment (distribute by date range)
*SwaggerClient::RevenueSchedulesApi* | [**p_ostr_sfor_invoice_item_adjustment_manual_distribution**](docs/RevenueSchedulesApi.md#p_ostr_sfor_invoice_item_adjustment_manual_distribution) | **POST** /v1/revenue-schedules/invoice-item-adjustments/{invoice-item-adj-key} | Create revenue schedule for Invoice Item Adjustment (manual distribution)
*SwaggerClient::RevenueSchedulesApi* | [**p_ostr_sfor_invoice_item_distribute_by_date_range**](docs/RevenueSchedulesApi.md#p_ostr_sfor_invoice_item_distribute_by_date_range) | **POST** /v1/revenue-schedules/invoice-items/{invoice-item-id}/distribute-revenue-with-date-range | Create revenue schedule for Invoice Item (distribute by date range)
*SwaggerClient::RevenueSchedulesApi* | [**p_ostr_sfor_invoice_item_manual_distribution**](docs/RevenueSchedulesApi.md#p_ostr_sfor_invoice_item_manual_distribution) | **POST** /v1/revenue-schedules/invoice-items/{invoice-item-id} | Create revenue schedule for Invoice Item (manual distribution)
*SwaggerClient::RevenueSchedulesApi* | [**p_ostr_sfor_subsc_charge**](docs/RevenueSchedulesApi.md#p_ostr_sfor_subsc_charge) | **POST** /v1/revenue-schedules/subscription-charges/{charge-key} | Create revenue schedule on subscription charge
*SwaggerClient::RevenueSchedulesApi* | [**p_ut_revenue_across_ap**](docs/RevenueSchedulesApi.md#p_ut_revenue_across_ap) | **PUT** /v1/revenue-schedules/{rs-number}/distribute-revenue-across-accounting-periods | Distribute revenue across accounting periods
*SwaggerClient::RevenueSchedulesApi* | [**p_ut_revenue_by_recognition_startand_end_dates**](docs/RevenueSchedulesApi.md#p_ut_revenue_by_recognition_startand_end_dates) | **PUT** /v1/revenue-schedules/{rs-number}/distribute-revenue-with-date-range | Distribute revenue by recognition start and end dates
*SwaggerClient::RevenueSchedulesApi* | [**p_ut_revenue_specific_date**](docs/RevenueSchedulesApi.md#p_ut_revenue_specific_date) | **PUT** /v1/revenue-schedules/{rs-number}/distribute-revenue-on-specific-date | Distribute revenue on specific date
*SwaggerClient::RevenueSchedulesApi* | [**p_utrs_basic_info**](docs/RevenueSchedulesApi.md#p_utrs_basic_info) | **PUT** /v1/revenue-schedules/{rs-number}/basic-information | Update revenue schedule basic information
*SwaggerClient::SettingsApi* | [**g_et_revenue_automation_start_date**](docs/SettingsApi.md#g_et_revenue_automation_start_date) | **GET** /v1/settings/finance/revenue-automation-start-date | Get the revenue automation start date
*SwaggerClient::SubscriptionProductFeaturesApi* | [**object_get_subscription_product_feature**](docs/SubscriptionProductFeaturesApi.md#object_get_subscription_product_feature) | **GET** /v1/object/subscription-product-feature/{id} | CRUD: Retrieve SubscriptionProductFeature
*SwaggerClient::SubscriptionsApi* | [**g_et_subscriptions_by_account**](docs/SubscriptionsApi.md#g_et_subscriptions_by_account) | **GET** /v1/subscriptions/accounts/{account-key} | Get subscriptions by account
*SwaggerClient::SubscriptionsApi* | [**g_et_subscriptions_by_key**](docs/SubscriptionsApi.md#g_et_subscriptions_by_key) | **GET** /v1/subscriptions/{subscription-key} | Get subscriptions by key
*SwaggerClient::SubscriptionsApi* | [**g_et_subscriptions_by_key_and_version**](docs/SubscriptionsApi.md#g_et_subscriptions_by_key_and_version) | **GET** /v1/subscriptions/{subscription-key}/versions/{version} | Get subscriptions by key and version
*SwaggerClient::SubscriptionsApi* | [**object_delete_subscription**](docs/SubscriptionsApi.md#object_delete_subscription) | **DELETE** /v1/object/subscription/{id} | CRUD: Delete Subscription
*SwaggerClient::SubscriptionsApi* | [**object_get_subscription**](docs/SubscriptionsApi.md#object_get_subscription) | **GET** /v1/object/subscription/{id} | CRUD: Retrieve Subscription
*SwaggerClient::SubscriptionsApi* | [**object_put_subscription**](docs/SubscriptionsApi.md#object_put_subscription) | **PUT** /v1/object/subscription/{id} | CRUD: Update Subscription
*SwaggerClient::SubscriptionsApi* | [**p_ost_preview_subscription**](docs/SubscriptionsApi.md#p_ost_preview_subscription) | **POST** /v1/subscriptions/preview | Preview subscription
*SwaggerClient::SubscriptionsApi* | [**p_ost_subscription**](docs/SubscriptionsApi.md#p_ost_subscription) | **POST** /v1/subscriptions | Create subscription
*SwaggerClient::SubscriptionsApi* | [**p_ut_cancel_subscription**](docs/SubscriptionsApi.md#p_ut_cancel_subscription) | **PUT** /v1/subscriptions/{subscription-key}/cancel | Cancel subscription
*SwaggerClient::SubscriptionsApi* | [**p_ut_renew_subscription**](docs/SubscriptionsApi.md#p_ut_renew_subscription) | **PUT** /v1/subscriptions/{subscription-key}/renew | Renew subscription
*SwaggerClient::SubscriptionsApi* | [**p_ut_resume_subscription**](docs/SubscriptionsApi.md#p_ut_resume_subscription) | **PUT** /v1/subscriptions/{subscription-key}/resume | Resume subscription
*SwaggerClient::SubscriptionsApi* | [**p_ut_subscription**](docs/SubscriptionsApi.md#p_ut_subscription) | **PUT** /v1/subscriptions/{subscription-key} | Update subscription
*SwaggerClient::SubscriptionsApi* | [**p_ut_suspend_subscription**](docs/SubscriptionsApi.md#p_ut_suspend_subscription) | **PUT** /v1/subscriptions/{subscription-key}/suspend | Suspend subscription
*SwaggerClient::SubscriptionsApi* | [**p_ut_update_subscription_custom_fields**](docs/SubscriptionsApi.md#p_ut_update_subscription_custom_fields) | **PUT** /v1/subscriptions/{subscriptionNumber}/customFields | Update subscription custom fields
*SwaggerClient::SummaryJournalEntriesApi* | [**d_elete_summary_journal_entry**](docs/SummaryJournalEntriesApi.md#d_elete_summary_journal_entry) | **DELETE** /v1/journal-entries/{je-number} | Delete summary journal entry
*SwaggerClient::SummaryJournalEntriesApi* | [**g_et_all_summary_journal_entries**](docs/SummaryJournalEntriesApi.md#g_et_all_summary_journal_entries) | **GET** /v1/journal-entries/journal-runs/{jr-number} | Get all summary journal entries in a journal run
*SwaggerClient::SummaryJournalEntriesApi* | [**g_et_summary_journal_entry**](docs/SummaryJournalEntriesApi.md#g_et_summary_journal_entry) | **GET** /v1/journal-entries/{je-number} | Get summary journal entry
*SwaggerClient::SummaryJournalEntriesApi* | [**p_ost_summary_journal_entry**](docs/SummaryJournalEntriesApi.md#p_ost_summary_journal_entry) | **POST** /v1/journal-entries | Create summary journal entry
*SwaggerClient::SummaryJournalEntriesApi* | [**p_ut_basic_summary_journal_entry**](docs/SummaryJournalEntriesApi.md#p_ut_basic_summary_journal_entry) | **PUT** /v1/journal-entries/{je-number}/basic-information | Update basic information of a summary journal entry
*SwaggerClient::SummaryJournalEntriesApi* | [**p_ut_summary_journal_entry**](docs/SummaryJournalEntriesApi.md#p_ut_summary_journal_entry) | **PUT** /v1/journal-entries/{je-number}/cancel | Cancel summary journal entry
*SwaggerClient::TaxationItemsApi* | [**d_elete_taxation_item**](docs/TaxationItemsApi.md#d_elete_taxation_item) | **DELETE** /v1/taxationitems/{id} | Delete taxation item
*SwaggerClient::TaxationItemsApi* | [**g_et_taxation_item**](docs/TaxationItemsApi.md#g_et_taxation_item) | **GET** /v1/taxationitems/{id} | Get taxation item 
*SwaggerClient::TaxationItemsApi* | [**object_delete_taxation_item**](docs/TaxationItemsApi.md#object_delete_taxation_item) | **DELETE** /v1/object/taxation-item/{id} | CRUD: Delete TaxationItem
*SwaggerClient::TaxationItemsApi* | [**object_get_taxation_item**](docs/TaxationItemsApi.md#object_get_taxation_item) | **GET** /v1/object/taxation-item/{id} | CRUD: Retrieve TaxationItem
*SwaggerClient::TaxationItemsApi* | [**object_post_taxation_item**](docs/TaxationItemsApi.md#object_post_taxation_item) | **POST** /v1/object/taxation-item | CRUD: Create TaxationItem
*SwaggerClient::TaxationItemsApi* | [**object_put_taxation_item**](docs/TaxationItemsApi.md#object_put_taxation_item) | **PUT** /v1/object/taxation-item/{id} | CRUD: Update TaxationItem
*SwaggerClient::TaxationItemsApi* | [**p_ut_taxation_item**](docs/TaxationItemsApi.md#p_ut_taxation_item) | **PUT** /v1/taxationitems/{id} | Update taxation item
*SwaggerClient::TransactionsApi* | [**g_et_transaction_invoice**](docs/TransactionsApi.md#g_et_transaction_invoice) | **GET** /v1/transactions/invoices/accounts/{account-key} | Get invoices
*SwaggerClient::TransactionsApi* | [**g_et_transaction_payment**](docs/TransactionsApi.md#g_et_transaction_payment) | **GET** /v1/transactions/payments/accounts/{account-key} | Get payments
*SwaggerClient::UnitOfMeasureApi* | [**object_delete_unit_of_measure**](docs/UnitOfMeasureApi.md#object_delete_unit_of_measure) | **DELETE** /v1/object/unit-of-measure/{id} | CRUD: Delete UnitOfMeasure
*SwaggerClient::UnitOfMeasureApi* | [**object_get_unit_of_measure**](docs/UnitOfMeasureApi.md#object_get_unit_of_measure) | **GET** /v1/object/unit-of-measure/{id} | CRUD: Retrieve UnitOfMeasure
*SwaggerClient::UnitOfMeasureApi* | [**object_post_unit_of_measure**](docs/UnitOfMeasureApi.md#object_post_unit_of_measure) | **POST** /v1/object/unit-of-measure | CRUD: Create UnitOfMeasure
*SwaggerClient::UnitOfMeasureApi* | [**object_put_unit_of_measure**](docs/UnitOfMeasureApi.md#object_put_unit_of_measure) | **PUT** /v1/object/unit-of-measure/{id} | CRUD: Update UnitOfMeasure
*SwaggerClient::UsageApi* | [**g_et_usage**](docs/UsageApi.md#g_et_usage) | **GET** /v1/usage/accounts/{account-key} | Get usage
*SwaggerClient::UsageApi* | [**object_delete_usage**](docs/UsageApi.md#object_delete_usage) | **DELETE** /v1/object/usage/{id} | CRUD: Delete Usage
*SwaggerClient::UsageApi* | [**object_get_usage**](docs/UsageApi.md#object_get_usage) | **GET** /v1/object/usage/{id} | CRUD: Retrieve Usage
*SwaggerClient::UsageApi* | [**object_post_usage**](docs/UsageApi.md#object_post_usage) | **POST** /v1/object/usage | CRUD: Create Usage
*SwaggerClient::UsageApi* | [**object_put_usage**](docs/UsageApi.md#object_put_usage) | **PUT** /v1/object/usage/{id} | CRUD: Update Usage
*SwaggerClient::UsageApi* | [**p_ost_usage**](docs/UsageApi.md#p_ost_usage) | **POST** /v1/usage | Post usage
*SwaggerClient::UsersApi* | [**g_et_entities_user_accessible**](docs/UsersApi.md#g_et_entities_user_accessible) | **GET** /v1/users/{username}/accessible-entities | Multi-entity: Get entities that a user can access
*SwaggerClient::UsersApi* | [**p_ut_accept_user_access**](docs/UsersApi.md#p_ut_accept_user_access) | **PUT** /v1/users/{username}/accept-access | Multi-entity: Accept user access
*SwaggerClient::UsersApi* | [**p_ut_deny_user_access**](docs/UsersApi.md#p_ut_deny_user_access) | **PUT** /v1/users/{username}/deny-access | Multi-entity: Deny user access
*SwaggerClient::UsersApi* | [**p_ut_send_user_access_requests**](docs/UsersApi.md#p_ut_send_user_access_requests) | **PUT** /v1/users/{username}/request-access | Multi-entity: Send user access requests


## Documentation for Models

 - [SwaggerClient::Account](docs/Account.md)
 - [SwaggerClient::AccountCreditCardHolder](docs/AccountCreditCardHolder.md)
 - [SwaggerClient::AmendRequest](docs/AmendRequest.md)
 - [SwaggerClient::AmendRequestAmendOptions](docs/AmendRequestAmendOptions.md)
 - [SwaggerClient::AmendRequestPreviewOptions](docs/AmendRequestPreviewOptions.md)
 - [SwaggerClient::AmendResult](docs/AmendResult.md)
 - [SwaggerClient::Amendment](docs/Amendment.md)
 - [SwaggerClient::AmendmentRatePlanChargeData](docs/AmendmentRatePlanChargeData.md)
 - [SwaggerClient::AmendmentRatePlanChargeDataRatePlanCharge](docs/AmendmentRatePlanChargeDataRatePlanCharge.md)
 - [SwaggerClient::AmendmentRatePlanChargeTier](docs/AmendmentRatePlanChargeTier.md)
 - [SwaggerClient::AmendmentRatePlanData](docs/AmendmentRatePlanData.md)
 - [SwaggerClient::ApplyCreditMemoType](docs/ApplyCreditMemoType.md)
 - [SwaggerClient::ApplyPaymentType](docs/ApplyPaymentType.md)
 - [SwaggerClient::BillingDocumentQueryResponseElementType](docs/BillingDocumentQueryResponseElementType.md)
 - [SwaggerClient::BillingOptions](docs/BillingOptions.md)
 - [SwaggerClient::BillingOverride](docs/BillingOverride.md)
 - [SwaggerClient::BillingPreviewResult](docs/BillingPreviewResult.md)
 - [SwaggerClient::BillingUpdate](docs/BillingUpdate.md)
 - [SwaggerClient::BreakdownDetail](docs/BreakdownDetail.md)
 - [SwaggerClient::CancelSubscription](docs/CancelSubscription.md)
 - [SwaggerClient::ChargeMetricsData](docs/ChargeMetricsData.md)
 - [SwaggerClient::ChargeOverride](docs/ChargeOverride.md)
 - [SwaggerClient::ChargePreviewMetrics](docs/ChargePreviewMetrics.md)
 - [SwaggerClient::ChargePreviewMetricsCmrr](docs/ChargePreviewMetricsCmrr.md)
 - [SwaggerClient::ChargePreviewMetricsTax](docs/ChargePreviewMetricsTax.md)
 - [SwaggerClient::ChargePreviewMetricsTcb](docs/ChargePreviewMetricsTcb.md)
 - [SwaggerClient::ChargePreviewMetricsTcv](docs/ChargePreviewMetricsTcv.md)
 - [SwaggerClient::ChargeRatedResult](docs/ChargeRatedResult.md)
 - [SwaggerClient::ChargeTier](docs/ChargeTier.md)
 - [SwaggerClient::ChargeUpdate](docs/ChargeUpdate.md)
 - [SwaggerClient::CommonResponse](docs/CommonResponse.md)
 - [SwaggerClient::CommonResponseType](docs/CommonResponseType.md)
 - [SwaggerClient::Contact](docs/Contact.md)
 - [SwaggerClient::CreateEntityResponseType](docs/CreateEntityResponseType.md)
 - [SwaggerClient::CreateEntityType](docs/CreateEntityType.md)
 - [SwaggerClient::CreatePaymentType](docs/CreatePaymentType.md)
 - [SwaggerClient::CreatePaymentTypeFinanceInformation](docs/CreatePaymentTypeFinanceInformation.md)
 - [SwaggerClient::CreateSubscription](docs/CreateSubscription.md)
 - [SwaggerClient::CreditCard](docs/CreditCard.md)
 - [SwaggerClient::CreditMemoApplyDebitMemoItemRequestType](docs/CreditMemoApplyDebitMemoItemRequestType.md)
 - [SwaggerClient::CreditMemoApplyDebitMemoRequestType](docs/CreditMemoApplyDebitMemoRequestType.md)
 - [SwaggerClient::CreditMemoApplyInvoiceItemRequestType](docs/CreditMemoApplyInvoiceItemRequestType.md)
 - [SwaggerClient::CreditMemoApplyInvoiceRequestType](docs/CreditMemoApplyInvoiceRequestType.md)
 - [SwaggerClient::CreditMemoFromChargeDetailType](docs/CreditMemoFromChargeDetailType.md)
 - [SwaggerClient::CreditMemoFromChargeDetailTypeFinanceInformation](docs/CreditMemoFromChargeDetailTypeFinanceInformation.md)
 - [SwaggerClient::CreditMemoFromChargeType](docs/CreditMemoFromChargeType.md)
 - [SwaggerClient::CreditMemoFromInvoiceType](docs/CreditMemoFromInvoiceType.md)
 - [SwaggerClient::CreditMemoItemBreakdown](docs/CreditMemoItemBreakdown.md)
 - [SwaggerClient::CreditMemoItemFromInvoiceItemType](docs/CreditMemoItemFromInvoiceItemType.md)
 - [SwaggerClient::CreditMemoItemFromInvoiceItemTypeFinanceInformation](docs/CreditMemoItemFromInvoiceItemTypeFinanceInformation.md)
 - [SwaggerClient::CreditMemoResponseType](docs/CreditMemoResponseType.md)
 - [SwaggerClient::CreditMemoTaxItemFromInvoiceTaxItemType](docs/CreditMemoTaxItemFromInvoiceTaxItemType.md)
 - [SwaggerClient::CreditMemoTaxItemFromInvoiceTaxItemTypeFinanceInformation](docs/CreditMemoTaxItemFromInvoiceTaxItemTypeFinanceInformation.md)
 - [SwaggerClient::CreditMemoUnapplyDebitMemoItemRequestType](docs/CreditMemoUnapplyDebitMemoItemRequestType.md)
 - [SwaggerClient::CreditMemoUnapplyDebitMemoRequestType](docs/CreditMemoUnapplyDebitMemoRequestType.md)
 - [SwaggerClient::CreditMemoUnapplyInvoiceItemRequestType](docs/CreditMemoUnapplyInvoiceItemRequestType.md)
 - [SwaggerClient::CreditMemoUnapplyInvoiceRequestType](docs/CreditMemoUnapplyInvoiceRequestType.md)
 - [SwaggerClient::CustomFields](docs/CustomFields.md)
 - [SwaggerClient::DELETEntityResponseType](docs/DELETEntityResponseType.md)
 - [SwaggerClient::DebitMemoFromChargeDetailType](docs/DebitMemoFromChargeDetailType.md)
 - [SwaggerClient::DebitMemoFromChargeDetailTypeFinanceInformation](docs/DebitMemoFromChargeDetailTypeFinanceInformation.md)
 - [SwaggerClient::DebitMemoFromChargeType](docs/DebitMemoFromChargeType.md)
 - [SwaggerClient::DebitMemoFromInvoiceType](docs/DebitMemoFromInvoiceType.md)
 - [SwaggerClient::DebitMemoItemFromInvoiceItemType](docs/DebitMemoItemFromInvoiceItemType.md)
 - [SwaggerClient::DebitMemoItemFromInvoiceItemTypeFinanceInformation](docs/DebitMemoItemFromInvoiceItemTypeFinanceInformation.md)
 - [SwaggerClient::DebitMemoTaxItemFromInvoiceTaxItemType](docs/DebitMemoTaxItemFromInvoiceTaxItemType.md)
 - [SwaggerClient::DebitMemoTaxItemFromInvoiceTaxItemTypeFinanceInformation](docs/DebitMemoTaxItemFromInvoiceTaxItemTypeFinanceInformation.md)
 - [SwaggerClient::DeleteResult](docs/DeleteResult.md)
 - [SwaggerClient::DiscountPricingOverride](docs/DiscountPricingOverride.md)
 - [SwaggerClient::DiscountPricingUpdate](docs/DiscountPricingUpdate.md)
 - [SwaggerClient::ElectronicPaymentOptions](docs/ElectronicPaymentOptions.md)
 - [SwaggerClient::EndConditions](docs/EndConditions.md)
 - [SwaggerClient::Error](docs/Error.md)
 - [SwaggerClient::EventRevenueItemType](docs/EventRevenueItemType.md)
 - [SwaggerClient::ExecuteResult](docs/ExecuteResult.md)
 - [SwaggerClient::ExternalPaymentOptions](docs/ExternalPaymentOptions.md)
 - [SwaggerClient::FinanceInformation](docs/FinanceInformation.md)
 - [SwaggerClient::GETAPaymentGatwayResponse](docs/GETAPaymentGatwayResponse.md)
 - [SwaggerClient::GETARPaymentType](docs/GETARPaymentType.md)
 - [SwaggerClient::GETARPaymentTypeFinanceInformation](docs/GETARPaymentTypeFinanceInformation.md)
 - [SwaggerClient::GETARPaymentTypewithSuccess](docs/GETARPaymentTypewithSuccess.md)
 - [SwaggerClient::GETAccountSummaryInvoiceType](docs/GETAccountSummaryInvoiceType.md)
 - [SwaggerClient::GETAccountSummaryPaymentInvoiceType](docs/GETAccountSummaryPaymentInvoiceType.md)
 - [SwaggerClient::GETAccountSummaryPaymentType](docs/GETAccountSummaryPaymentType.md)
 - [SwaggerClient::GETAccountSummarySubscriptionRatePlanType](docs/GETAccountSummarySubscriptionRatePlanType.md)
 - [SwaggerClient::GETAccountSummarySubscriptionType](docs/GETAccountSummarySubscriptionType.md)
 - [SwaggerClient::GETAccountSummaryType](docs/GETAccountSummaryType.md)
 - [SwaggerClient::GETAccountSummaryTypeBasicInfo](docs/GETAccountSummaryTypeBasicInfo.md)
 - [SwaggerClient::GETAccountSummaryTypeBasicInfoDefaultPaymentMethod](docs/GETAccountSummaryTypeBasicInfoDefaultPaymentMethod.md)
 - [SwaggerClient::GETAccountSummaryTypeBillToContact](docs/GETAccountSummaryTypeBillToContact.md)
 - [SwaggerClient::GETAccountSummaryTypeSoldToContact](docs/GETAccountSummaryTypeSoldToContact.md)
 - [SwaggerClient::GETAccountSummaryTypeTaxInfo](docs/GETAccountSummaryTypeTaxInfo.md)
 - [SwaggerClient::GETAccountSummaryUsageType](docs/GETAccountSummaryUsageType.md)
 - [SwaggerClient::GETAccountType](docs/GETAccountType.md)
 - [SwaggerClient::GETAccountTypeBasicInfo](docs/GETAccountTypeBasicInfo.md)
 - [SwaggerClient::GETAccountTypeBillToContact](docs/GETAccountTypeBillToContact.md)
 - [SwaggerClient::GETAccountTypeBillingAndPayment](docs/GETAccountTypeBillingAndPayment.md)
 - [SwaggerClient::GETAccountTypeMetrics](docs/GETAccountTypeMetrics.md)
 - [SwaggerClient::GETAccountTypeSoldToContact](docs/GETAccountTypeSoldToContact.md)
 - [SwaggerClient::GETAccountingCodeItemType](docs/GETAccountingCodeItemType.md)
 - [SwaggerClient::GETAccountingCodeItemWithoutSuccessType](docs/GETAccountingCodeItemWithoutSuccessType.md)
 - [SwaggerClient::GETAccountingCodesType](docs/GETAccountingCodesType.md)
 - [SwaggerClient::GETAccountingPeriodType](docs/GETAccountingPeriodType.md)
 - [SwaggerClient::GETAccountingPeriodTypeFileIds](docs/GETAccountingPeriodTypeFileIds.md)
 - [SwaggerClient::GETAccountingPeriodWithoutSuccessType](docs/GETAccountingPeriodWithoutSuccessType.md)
 - [SwaggerClient::GETAccountingPeriodsType](docs/GETAccountingPeriodsType.md)
 - [SwaggerClient::GETAmendmentType](docs/GETAmendmentType.md)
 - [SwaggerClient::GETAttachmentResponseType](docs/GETAttachmentResponseType.md)
 - [SwaggerClient::GETAttachmentResponseWithoutSuccessType](docs/GETAttachmentResponseWithoutSuccessType.md)
 - [SwaggerClient::GETAttachmentsResponseType](docs/GETAttachmentsResponseType.md)
 - [SwaggerClient::GETBillingDocumentsResponseType](docs/GETBillingDocumentsResponseType.md)
 - [SwaggerClient::GETCMTaxItemType](docs/GETCMTaxItemType.md)
 - [SwaggerClient::GETCMTaxItemTypeFinanceInformation](docs/GETCMTaxItemTypeFinanceInformation.md)
 - [SwaggerClient::GETCalloutHistoryVOType](docs/GETCalloutHistoryVOType.md)
 - [SwaggerClient::GETCalloutHistoryVOsType](docs/GETCalloutHistoryVOsType.md)
 - [SwaggerClient::GETCatalogType](docs/GETCatalogType.md)
 - [SwaggerClient::GETChargeRSDetailType](docs/GETChargeRSDetailType.md)
 - [SwaggerClient::GETCreditMemoCollectionType](docs/GETCreditMemoCollectionType.md)
 - [SwaggerClient::GETCreditMemoItemPartType](docs/GETCreditMemoItemPartType.md)
 - [SwaggerClient::GETCreditMemoItemPartTypewithSuccess](docs/GETCreditMemoItemPartTypewithSuccess.md)
 - [SwaggerClient::GETCreditMemoItemPartsCollectionType](docs/GETCreditMemoItemPartsCollectionType.md)
 - [SwaggerClient::GETCreditMemoItemType](docs/GETCreditMemoItemType.md)
 - [SwaggerClient::GETCreditMemoItemTypeFinanceInformation](docs/GETCreditMemoItemTypeFinanceInformation.md)
 - [SwaggerClient::GETCreditMemoItemTypewithSuccess](docs/GETCreditMemoItemTypewithSuccess.md)
 - [SwaggerClient::GETCreditMemoItemTypewithSuccessFinanceInformation](docs/GETCreditMemoItemTypewithSuccessFinanceInformation.md)
 - [SwaggerClient::GETCreditMemoItemsListType](docs/GETCreditMemoItemsListType.md)
 - [SwaggerClient::GETCreditMemoPartType](docs/GETCreditMemoPartType.md)
 - [SwaggerClient::GETCreditMemoPartTypewithSuccess](docs/GETCreditMemoPartTypewithSuccess.md)
 - [SwaggerClient::GETCreditMemoPartsCollectionType](docs/GETCreditMemoPartsCollectionType.md)
 - [SwaggerClient::GETCreditMemoType](docs/GETCreditMemoType.md)
 - [SwaggerClient::GETCreditMemoTypewithSuccess](docs/GETCreditMemoTypewithSuccess.md)
 - [SwaggerClient::GETCustomExchangeRatesDataType](docs/GETCustomExchangeRatesDataType.md)
 - [SwaggerClient::GETCustomExchangeRatesType](docs/GETCustomExchangeRatesType.md)
 - [SwaggerClient::GETDMTaxItemType](docs/GETDMTaxItemType.md)
 - [SwaggerClient::GETDMTaxItemTypeFinanceInformation](docs/GETDMTaxItemTypeFinanceInformation.md)
 - [SwaggerClient::GETDebitMemoCollectionType](docs/GETDebitMemoCollectionType.md)
 - [SwaggerClient::GETDebitMemoItemCollectionType](docs/GETDebitMemoItemCollectionType.md)
 - [SwaggerClient::GETDebitMemoItemType](docs/GETDebitMemoItemType.md)
 - [SwaggerClient::GETDebitMemoItemTypeFinanceInformation](docs/GETDebitMemoItemTypeFinanceInformation.md)
 - [SwaggerClient::GETDebitMemoItemTypewithSuccess](docs/GETDebitMemoItemTypewithSuccess.md)
 - [SwaggerClient::GETDebitMemoType](docs/GETDebitMemoType.md)
 - [SwaggerClient::GETDebitMemoTypewithSuccess](docs/GETDebitMemoTypewithSuccess.md)
 - [SwaggerClient::GETDiscountApplyDetailsType](docs/GETDiscountApplyDetailsType.md)
 - [SwaggerClient::GETEmailHistoryVOType](docs/GETEmailHistoryVOType.md)
 - [SwaggerClient::GETEmailHistoryVOsType](docs/GETEmailHistoryVOsType.md)
 - [SwaggerClient::GETEntitiesResponseType](docs/GETEntitiesResponseType.md)
 - [SwaggerClient::GETEntitiesResponseTypeWithId](docs/GETEntitiesResponseTypeWithId.md)
 - [SwaggerClient::GETEntitiesType](docs/GETEntitiesType.md)
 - [SwaggerClient::GETEntitiesUserAccessibleResponseType](docs/GETEntitiesUserAccessibleResponseType.md)
 - [SwaggerClient::GETEntityConnectionsArrayItemsType](docs/GETEntityConnectionsArrayItemsType.md)
 - [SwaggerClient::GETEntityConnectionsResponseType](docs/GETEntityConnectionsResponseType.md)
 - [SwaggerClient::GETInvoiceFileType](docs/GETInvoiceFileType.md)
 - [SwaggerClient::GETInvoiceFileWrapper](docs/GETInvoiceFileWrapper.md)
 - [SwaggerClient::GETInvoiceType](docs/GETInvoiceType.md)
 - [SwaggerClient::GETInvoicesInvoiceItemType](docs/GETInvoicesInvoiceItemType.md)
 - [SwaggerClient::GETJournalEntriesInJournalRunType](docs/GETJournalEntriesInJournalRunType.md)
 - [SwaggerClient::GETJournalEntryDetailType](docs/GETJournalEntryDetailType.md)
 - [SwaggerClient::GETJournalEntryDetailTypeWithoutSuccess](docs/GETJournalEntryDetailTypeWithoutSuccess.md)
 - [SwaggerClient::GETJournalEntryItemType](docs/GETJournalEntryItemType.md)
 - [SwaggerClient::GETJournalEntrySegmentType](docs/GETJournalEntrySegmentType.md)
 - [SwaggerClient::GETJournalRunTransactionType](docs/GETJournalRunTransactionType.md)
 - [SwaggerClient::GETJournalRunType](docs/GETJournalRunType.md)
 - [SwaggerClient::GETMassUpdateType](docs/GETMassUpdateType.md)
 - [SwaggerClient::GETPaidInvoicesType](docs/GETPaidInvoicesType.md)
 - [SwaggerClient::GETPaymentGatwaysResponse](docs/GETPaymentGatwaysResponse.md)
 - [SwaggerClient::GETPaymentItemPartCollectionType](docs/GETPaymentItemPartCollectionType.md)
 - [SwaggerClient::GETPaymentItemPartType](docs/GETPaymentItemPartType.md)
 - [SwaggerClient::GETPaymentItemPartTypewithSuccess](docs/GETPaymentItemPartTypewithSuccess.md)
 - [SwaggerClient::GETPaymentMethodType](docs/GETPaymentMethodType.md)
 - [SwaggerClient::GETPaymentMethodTypeCardHolderInfo](docs/GETPaymentMethodTypeCardHolderInfo.md)
 - [SwaggerClient::GETPaymentMethodsType](docs/GETPaymentMethodsType.md)
 - [SwaggerClient::GETPaymentPartType](docs/GETPaymentPartType.md)
 - [SwaggerClient::GETPaymentPartTypewithSuccess](docs/GETPaymentPartTypewithSuccess.md)
 - [SwaggerClient::GETPaymentPartsCollectionType](docs/GETPaymentPartsCollectionType.md)
 - [SwaggerClient::GETPaymentType](docs/GETPaymentType.md)
 - [SwaggerClient::GETPaymentsType](docs/GETPaymentsType.md)
 - [SwaggerClient::GETProductDiscountApplyDetailsType](docs/GETProductDiscountApplyDetailsType.md)
 - [SwaggerClient::GETProductRatePlanChargePricingTierType](docs/GETProductRatePlanChargePricingTierType.md)
 - [SwaggerClient::GETProductRatePlanChargePricingType](docs/GETProductRatePlanChargePricingType.md)
 - [SwaggerClient::GETProductRatePlanChargeType](docs/GETProductRatePlanChargeType.md)
 - [SwaggerClient::GETProductRatePlanType](docs/GETProductRatePlanType.md)
 - [SwaggerClient::GETProductType](docs/GETProductType.md)
 - [SwaggerClient::GETRSDetailForProductChargeType](docs/GETRSDetailForProductChargeType.md)
 - [SwaggerClient::GETRSDetailType](docs/GETRSDetailType.md)
 - [SwaggerClient::GETRSDetailWithoutSuccessType](docs/GETRSDetailWithoutSuccessType.md)
 - [SwaggerClient::GETRSDetailsByChargeType](docs/GETRSDetailsByChargeType.md)
 - [SwaggerClient::GETRSDetailsByProductChargeType](docs/GETRSDetailsByProductChargeType.md)
 - [SwaggerClient::GETRefundCollectionType](docs/GETRefundCollectionType.md)
 - [SwaggerClient::GETRefundCreditMemoType](docs/GETRefundCreditMemoType.md)
 - [SwaggerClient::GETRefundCreditMemoTypeFinanceInformation](docs/GETRefundCreditMemoTypeFinanceInformation.md)
 - [SwaggerClient::GETRefundItemPartCollectionType](docs/GETRefundItemPartCollectionType.md)
 - [SwaggerClient::GETRefundItemPartType](docs/GETRefundItemPartType.md)
 - [SwaggerClient::GETRefundItemPartTypewithSuccess](docs/GETRefundItemPartTypewithSuccess.md)
 - [SwaggerClient::GETRefundPartCollectionType](docs/GETRefundPartCollectionType.md)
 - [SwaggerClient::GETRefundPaymentType](docs/GETRefundPaymentType.md)
 - [SwaggerClient::GETRefundType](docs/GETRefundType.md)
 - [SwaggerClient::GETRefundTypewithSuccess](docs/GETRefundTypewithSuccess.md)
 - [SwaggerClient::GETRevenueEventDetailType](docs/GETRevenueEventDetailType.md)
 - [SwaggerClient::GETRevenueEventDetailWithoutSuccessType](docs/GETRevenueEventDetailWithoutSuccessType.md)
 - [SwaggerClient::GETRevenueEventDetailsType](docs/GETRevenueEventDetailsType.md)
 - [SwaggerClient::GETRevenueItemType](docs/GETRevenueItemType.md)
 - [SwaggerClient::GETRevenueItemsType](docs/GETRevenueItemsType.md)
 - [SwaggerClient::GETRevenueRecognitionRuleAssociationType](docs/GETRevenueRecognitionRuleAssociationType.md)
 - [SwaggerClient::GETRevenueStartDateSettingType](docs/GETRevenueStartDateSettingType.md)
 - [SwaggerClient::GETRsRevenueItemType](docs/GETRsRevenueItemType.md)
 - [SwaggerClient::GETRsRevenueItemsType](docs/GETRsRevenueItemsType.md)
 - [SwaggerClient::GETSubscriptionProductFeatureType](docs/GETSubscriptionProductFeatureType.md)
 - [SwaggerClient::GETSubscriptionRatePlanChargesType](docs/GETSubscriptionRatePlanChargesType.md)
 - [SwaggerClient::GETSubscriptionRatePlanType](docs/GETSubscriptionRatePlanType.md)
 - [SwaggerClient::GETSubscriptionType](docs/GETSubscriptionType.md)
 - [SwaggerClient::GETSubscriptionTypeWithSuccess](docs/GETSubscriptionTypeWithSuccess.md)
 - [SwaggerClient::GETSubscriptionWrapper](docs/GETSubscriptionWrapper.md)
 - [SwaggerClient::GETTaxationItemListType](docs/GETTaxationItemListType.md)
 - [SwaggerClient::GETTaxationItemType](docs/GETTaxationItemType.md)
 - [SwaggerClient::GETTaxationItemTypeFinanceInformation](docs/GETTaxationItemTypeFinanceInformation.md)
 - [SwaggerClient::GETTaxationItemTypewithSuccess](docs/GETTaxationItemTypewithSuccess.md)
 - [SwaggerClient::GETTierType](docs/GETTierType.md)
 - [SwaggerClient::GETUsageType](docs/GETUsageType.md)
 - [SwaggerClient::GETUsageWrapper](docs/GETUsageWrapper.md)
 - [SwaggerClient::GatewayOption](docs/GatewayOption.md)
 - [SwaggerClient::GenerateBillingDocumentResponseType](docs/GenerateBillingDocumentResponseType.md)
 - [SwaggerClient::GetAllOrdersResponseType](docs/GetAllOrdersResponseType.md)
 - [SwaggerClient::GetBillingPreviewRunResponse](docs/GetBillingPreviewRunResponse.md)
 - [SwaggerClient::GetHostedPageType](docs/GetHostedPageType.md)
 - [SwaggerClient::GetHostedPagesType](docs/GetHostedPagesType.md)
 - [SwaggerClient::GetOrderBillingInfoResponseTypeBillingInfo](docs/GetOrderBillingInfoResponseTypeBillingInfo.md)
 - [SwaggerClient::GetProductFeatureType](docs/GetProductFeatureType.md)
 - [SwaggerClient::InitialTerm](docs/InitialTerm.md)
 - [SwaggerClient::InlineResponse200](docs/InlineResponse200.md)
 - [SwaggerClient::Invoice](docs/Invoice.md)
 - [SwaggerClient::InvoiceData](docs/InvoiceData.md)
 - [SwaggerClient::InvoiceDataInvoice](docs/InvoiceDataInvoice.md)
 - [SwaggerClient::InvoiceItem](docs/InvoiceItem.md)
 - [SwaggerClient::InvoiceItemBreakdown](docs/InvoiceItemBreakdown.md)
 - [SwaggerClient::InvoiceItemPreviewResult](docs/InvoiceItemPreviewResult.md)
 - [SwaggerClient::InvoiceItemPreviewResultAdditionalInfo](docs/InvoiceItemPreviewResultAdditionalInfo.md)
 - [SwaggerClient::InvoicePayment](docs/InvoicePayment.md)
 - [SwaggerClient::InvoicePaymentData](docs/InvoicePaymentData.md)
 - [SwaggerClient::InvoiceProcessingOptions](docs/InvoiceProcessingOptions.md)
 - [SwaggerClient::InvoiceResponseType](docs/InvoiceResponseType.md)
 - [SwaggerClient::LastTerm](docs/LastTerm.md)
 - [SwaggerClient::ListOfExchangeRates](docs/ListOfExchangeRates.md)
 - [SwaggerClient::NewChargeMetrics](docs/NewChargeMetrics.md)
 - [SwaggerClient::OneTimeFlatFeePricingOverride](docs/OneTimeFlatFeePricingOverride.md)
 - [SwaggerClient::OneTimePerUnitPricingOverride](docs/OneTimePerUnitPricingOverride.md)
 - [SwaggerClient::OneTimeTieredPricingOverride](docs/OneTimeTieredPricingOverride.md)
 - [SwaggerClient::OneTimeVolumePricingOverride](docs/OneTimeVolumePricingOverride.md)
 - [SwaggerClient::Order](docs/Order.md)
 - [SwaggerClient::OrderAction](docs/OrderAction.md)
 - [SwaggerClient::OrderActionRequest](docs/OrderActionRequest.md)
 - [SwaggerClient::OrderMetrics](docs/OrderMetrics.md)
 - [SwaggerClient::OrderMetricsInner](docs/OrderMetricsInner.md)
 - [SwaggerClient::OrderRatedResult](docs/OrderRatedResult.md)
 - [SwaggerClient::OrderSubscriptions](docs/OrderSubscriptions.md)
 - [SwaggerClient::OwnerTransfer](docs/OwnerTransfer.md)
 - [SwaggerClient::POSTAccountResponseType](docs/POSTAccountResponseType.md)
 - [SwaggerClient::POSTAccountType](docs/POSTAccountType.md)
 - [SwaggerClient::POSTAccountTypeBillToContact](docs/POSTAccountTypeBillToContact.md)
 - [SwaggerClient::POSTAccountTypeCreditCard](docs/POSTAccountTypeCreditCard.md)
 - [SwaggerClient::POSTAccountTypeCreditCardCardHolderInfo](docs/POSTAccountTypeCreditCardCardHolderInfo.md)
 - [SwaggerClient::POSTAccountTypeSoldToContact](docs/POSTAccountTypeSoldToContact.md)
 - [SwaggerClient::POSTAccountTypeSubscription](docs/POSTAccountTypeSubscription.md)
 - [SwaggerClient::POSTAccountTypeTaxInfo](docs/POSTAccountTypeTaxInfo.md)
 - [SwaggerClient::POSTAccountingCodeResponseType](docs/POSTAccountingCodeResponseType.md)
 - [SwaggerClient::POSTAccountingCodeType](docs/POSTAccountingCodeType.md)
 - [SwaggerClient::POSTAccountingPeriodResponseType](docs/POSTAccountingPeriodResponseType.md)
 - [SwaggerClient::POSTAccountingPeriodType](docs/POSTAccountingPeriodType.md)
 - [SwaggerClient::POSTAttachmentResponseType](docs/POSTAttachmentResponseType.md)
 - [SwaggerClient::POSTAttachmentType](docs/POSTAttachmentType.md)
 - [SwaggerClient::POSTBillingPreviewCreditMemoItem](docs/POSTBillingPreviewCreditMemoItem.md)
 - [SwaggerClient::POSTBillingPreviewInvoiceItem](docs/POSTBillingPreviewInvoiceItem.md)
 - [SwaggerClient::POSTDecryptResponseType](docs/POSTDecryptResponseType.md)
 - [SwaggerClient::POSTDecryptionType](docs/POSTDecryptionType.md)
 - [SwaggerClient::POSTDistributionItemType](docs/POSTDistributionItemType.md)
 - [SwaggerClient::POSTEmailBillingDocfromBillRunType](docs/POSTEmailBillingDocfromBillRunType.md)
 - [SwaggerClient::POSTEntityConnectionsResponseType](docs/POSTEntityConnectionsResponseType.md)
 - [SwaggerClient::POSTEntityConnectionsType](docs/POSTEntityConnectionsType.md)
 - [SwaggerClient::POSTHMACSignatureResponseType](docs/POSTHMACSignatureResponseType.md)
 - [SwaggerClient::POSTHMACSignatureType](docs/POSTHMACSignatureType.md)
 - [SwaggerClient::POSTInvoiceCollectCreditMemosType](docs/POSTInvoiceCollectCreditMemosType.md)
 - [SwaggerClient::POSTInvoiceCollectInvoicesType](docs/POSTInvoiceCollectInvoicesType.md)
 - [SwaggerClient::POSTInvoiceCollectResponseType](docs/POSTInvoiceCollectResponseType.md)
 - [SwaggerClient::POSTInvoiceCollectType](docs/POSTInvoiceCollectType.md)
 - [SwaggerClient::POSTJournalEntryItemType](docs/POSTJournalEntryItemType.md)
 - [SwaggerClient::POSTJournalEntryResponseType](docs/POSTJournalEntryResponseType.md)
 - [SwaggerClient::POSTJournalEntrySegmentType](docs/POSTJournalEntrySegmentType.md)
 - [SwaggerClient::POSTJournalEntryType](docs/POSTJournalEntryType.md)
 - [SwaggerClient::POSTJournalRunResponseType](docs/POSTJournalRunResponseType.md)
 - [SwaggerClient::POSTJournalRunTransactionType](docs/POSTJournalRunTransactionType.md)
 - [SwaggerClient::POSTJournalRunType](docs/POSTJournalRunType.md)
 - [SwaggerClient::POSTMassUpdateResponseType](docs/POSTMassUpdateResponseType.md)
 - [SwaggerClient::POSTMassUpdateType](docs/POSTMassUpdateType.md)
 - [SwaggerClient::POSTMassUpdateTypeParams](docs/POSTMassUpdateTypeParams.md)
 - [SwaggerClient::POSTMemoPdfResponse](docs/POSTMemoPdfResponse.md)
 - [SwaggerClient::POSTOrderPreviewRequestType](docs/POSTOrderPreviewRequestType.md)
 - [SwaggerClient::POSTOrderPreviewRequestTypeSubscriptions](docs/POSTOrderPreviewRequestTypeSubscriptions.md)
 - [SwaggerClient::POSTOrderRequestType](docs/POSTOrderRequestType.md)
 - [SwaggerClient::POSTOrderRequestTypeSubscriptions](docs/POSTOrderRequestTypeSubscriptions.md)
 - [SwaggerClient::POSTPaymentMethodDecryption](docs/POSTPaymentMethodDecryption.md)
 - [SwaggerClient::POSTPaymentMethodDecryptionCardHolderInfo](docs/POSTPaymentMethodDecryptionCardHolderInfo.md)
 - [SwaggerClient::POSTPaymentMethodResponseDecryption](docs/POSTPaymentMethodResponseDecryption.md)
 - [SwaggerClient::POSTPaymentMethodResponseType](docs/POSTPaymentMethodResponseType.md)
 - [SwaggerClient::POSTPaymentMethodType](docs/POSTPaymentMethodType.md)
 - [SwaggerClient::POSTPaymentMethodTypeCardHolderInfo](docs/POSTPaymentMethodTypeCardHolderInfo.md)
 - [SwaggerClient::POSTQuoteDocResponseType](docs/POSTQuoteDocResponseType.md)
 - [SwaggerClient::POSTQuoteDocType](docs/POSTQuoteDocType.md)
 - [SwaggerClient::POSTRSASignatureResponseType](docs/POSTRSASignatureResponseType.md)
 - [SwaggerClient::POSTRSASignatureType](docs/POSTRSASignatureType.md)
 - [SwaggerClient::POSTRevenueScheduleByChargeResponseType](docs/POSTRevenueScheduleByChargeResponseType.md)
 - [SwaggerClient::POSTRevenueScheduleByChargeType](docs/POSTRevenueScheduleByChargeType.md)
 - [SwaggerClient::POSTRevenueScheduleByChargeTypeRevenueEvent](docs/POSTRevenueScheduleByChargeTypeRevenueEvent.md)
 - [SwaggerClient::POSTRevenueScheduleByDateRangeType](docs/POSTRevenueScheduleByDateRangeType.md)
 - [SwaggerClient::POSTRevenueScheduleByDateRangeTypeRevenueEvent](docs/POSTRevenueScheduleByDateRangeTypeRevenueEvent.md)
 - [SwaggerClient::POSTRevenueScheduleByTransactionRatablyType](docs/POSTRevenueScheduleByTransactionRatablyType.md)
 - [SwaggerClient::POSTRevenueScheduleByTransactionRatablyTypeRevenueEvent](docs/POSTRevenueScheduleByTransactionRatablyTypeRevenueEvent.md)
 - [SwaggerClient::POSTRevenueScheduleByTransactionResponseType](docs/POSTRevenueScheduleByTransactionResponseType.md)
 - [SwaggerClient::POSTRevenueScheduleByTransactionType](docs/POSTRevenueScheduleByTransactionType.md)
 - [SwaggerClient::POSTRevenueScheduleByTransactionTypeRevenueEvent](docs/POSTRevenueScheduleByTransactionTypeRevenueEvent.md)
 - [SwaggerClient::POSTScCreateType](docs/POSTScCreateType.md)
 - [SwaggerClient::POSTSrpCreateType](docs/POSTSrpCreateType.md)
 - [SwaggerClient::POSTSubscriptionCancellationResponseType](docs/POSTSubscriptionCancellationResponseType.md)
 - [SwaggerClient::POSTSubscriptionCancellationType](docs/POSTSubscriptionCancellationType.md)
 - [SwaggerClient::POSTSubscriptionPreviewCreditMemoItemsType](docs/POSTSubscriptionPreviewCreditMemoItemsType.md)
 - [SwaggerClient::POSTSubscriptionPreviewInvoiceItemsType](docs/POSTSubscriptionPreviewInvoiceItemsType.md)
 - [SwaggerClient::POSTSubscriptionPreviewResponseType](docs/POSTSubscriptionPreviewResponseType.md)
 - [SwaggerClient::POSTSubscriptionPreviewResponseTypeChargeMetrics](docs/POSTSubscriptionPreviewResponseTypeChargeMetrics.md)
 - [SwaggerClient::POSTSubscriptionPreviewResponseTypeCreditMemo](docs/POSTSubscriptionPreviewResponseTypeCreditMemo.md)
 - [SwaggerClient::POSTSubscriptionPreviewType](docs/POSTSubscriptionPreviewType.md)
 - [SwaggerClient::POSTSubscriptionPreviewTypePreviewAccountInfo](docs/POSTSubscriptionPreviewTypePreviewAccountInfo.md)
 - [SwaggerClient::POSTSubscriptionPreviewTypePreviewAccountInfoBillToContact](docs/POSTSubscriptionPreviewTypePreviewAccountInfoBillToContact.md)
 - [SwaggerClient::POSTSubscriptionResponseType](docs/POSTSubscriptionResponseType.md)
 - [SwaggerClient::POSTSubscriptionType](docs/POSTSubscriptionType.md)
 - [SwaggerClient::POSTTaxationItemForCMType](docs/POSTTaxationItemForCMType.md)
 - [SwaggerClient::POSTTaxationItemForCMTypeFinanceInformation](docs/POSTTaxationItemForCMTypeFinanceInformation.md)
 - [SwaggerClient::POSTTaxationItemForDMType](docs/POSTTaxationItemForDMType.md)
 - [SwaggerClient::POSTTaxationItemForDMTypeFinanceInformation](docs/POSTTaxationItemForDMTypeFinanceInformation.md)
 - [SwaggerClient::POSTTaxationItemListForCMType](docs/POSTTaxationItemListForCMType.md)
 - [SwaggerClient::POSTTaxationItemListForDMType](docs/POSTTaxationItemListForDMType.md)
 - [SwaggerClient::POSTTierType](docs/POSTTierType.md)
 - [SwaggerClient::POSTUsageResponseType](docs/POSTUsageResponseType.md)
 - [SwaggerClient::PUTAcceptUserAccessResponseType](docs/PUTAcceptUserAccessResponseType.md)
 - [SwaggerClient::PUTAccountType](docs/PUTAccountType.md)
 - [SwaggerClient::PUTAccountTypeBillToContact](docs/PUTAccountTypeBillToContact.md)
 - [SwaggerClient::PUTAccountTypeSoldToContact](docs/PUTAccountTypeSoldToContact.md)
 - [SwaggerClient::PUTAccountingCodeType](docs/PUTAccountingCodeType.md)
 - [SwaggerClient::PUTAccountingPeriodType](docs/PUTAccountingPeriodType.md)
 - [SwaggerClient::PUTAllocateManuallyType](docs/PUTAllocateManuallyType.md)
 - [SwaggerClient::PUTAttachmentType](docs/PUTAttachmentType.md)
 - [SwaggerClient::PUTBasicSummaryJournalEntryType](docs/PUTBasicSummaryJournalEntryType.md)
 - [SwaggerClient::PUTCatalogType](docs/PUTCatalogType.md)
 - [SwaggerClient::PUTCreditMemoItemType](docs/PUTCreditMemoItemType.md)
 - [SwaggerClient::PUTCreditMemoItemTypeFinanceInformation](docs/PUTCreditMemoItemTypeFinanceInformation.md)
 - [SwaggerClient::PUTCreditMemoType](docs/PUTCreditMemoType.md)
 - [SwaggerClient::PUTDebitMemoItemType](docs/PUTDebitMemoItemType.md)
 - [SwaggerClient::PUTDebitMemoItemTypeFinanceInformation](docs/PUTDebitMemoItemTypeFinanceInformation.md)
 - [SwaggerClient::PUTDebitMemoType](docs/PUTDebitMemoType.md)
 - [SwaggerClient::PUTDenyUserAccessResponseType](docs/PUTDenyUserAccessResponseType.md)
 - [SwaggerClient::PUTEntityConnectionsAcceptResponseType](docs/PUTEntityConnectionsAcceptResponseType.md)
 - [SwaggerClient::PUTEntityConnectionsDenyResponseType](docs/PUTEntityConnectionsDenyResponseType.md)
 - [SwaggerClient::PUTEntityConnectionsDisconnectResponseType](docs/PUTEntityConnectionsDisconnectResponseType.md)
 - [SwaggerClient::PUTEventRIDetailType](docs/PUTEventRIDetailType.md)
 - [SwaggerClient::PUTJournalEntryItemType](docs/PUTJournalEntryItemType.md)
 - [SwaggerClient::PUTOrderPatchRequestType](docs/PUTOrderPatchRequestType.md)
 - [SwaggerClient::PUTOrderPatchRequestTypeOrderActions](docs/PUTOrderPatchRequestTypeOrderActions.md)
 - [SwaggerClient::PUTOrderPatchRequestTypeSubscriptions](docs/PUTOrderPatchRequestTypeSubscriptions.md)
 - [SwaggerClient::PUTPaymentMethodResponseType](docs/PUTPaymentMethodResponseType.md)
 - [SwaggerClient::PUTPaymentMethodType](docs/PUTPaymentMethodType.md)
 - [SwaggerClient::PUTRSBasicInfoType](docs/PUTRSBasicInfoType.md)
 - [SwaggerClient::PUTRSTermType](docs/PUTRSTermType.md)
 - [SwaggerClient::PUTRefundType](docs/PUTRefundType.md)
 - [SwaggerClient::PUTRefundTypeFinanceInformation](docs/PUTRefundTypeFinanceInformation.md)
 - [SwaggerClient::PUTRenewSubscriptionResponseType](docs/PUTRenewSubscriptionResponseType.md)
 - [SwaggerClient::PUTRenewSubscriptionType](docs/PUTRenewSubscriptionType.md)
 - [SwaggerClient::PUTRevenueScheduleResponseType](docs/PUTRevenueScheduleResponseType.md)
 - [SwaggerClient::PUTScAddType](docs/PUTScAddType.md)
 - [SwaggerClient::PUTScUpdateType](docs/PUTScUpdateType.md)
 - [SwaggerClient::PUTScheduleRIDetailType](docs/PUTScheduleRIDetailType.md)
 - [SwaggerClient::PUTSendUserAccessRequestResponseType](docs/PUTSendUserAccessRequestResponseType.md)
 - [SwaggerClient::PUTSendUserAccessRequestType](docs/PUTSendUserAccessRequestType.md)
 - [SwaggerClient::PUTSpecificDateAllocationType](docs/PUTSpecificDateAllocationType.md)
 - [SwaggerClient::PUTSrpAddType](docs/PUTSrpAddType.md)
 - [SwaggerClient::PUTSrpRemoveType](docs/PUTSrpRemoveType.md)
 - [SwaggerClient::PUTSrpUpdateType](docs/PUTSrpUpdateType.md)
 - [SwaggerClient::PUTSubscriptionPatchRequestType](docs/PUTSubscriptionPatchRequestType.md)
 - [SwaggerClient::PUTSubscriptionPatchRequestTypeCharges](docs/PUTSubscriptionPatchRequestTypeCharges.md)
 - [SwaggerClient::PUTSubscriptionPatchRequestTypeRatePlans](docs/PUTSubscriptionPatchRequestTypeRatePlans.md)
 - [SwaggerClient::PUTSubscriptionPreviewInvoiceItemsType](docs/PUTSubscriptionPreviewInvoiceItemsType.md)
 - [SwaggerClient::PUTSubscriptionResponseType](docs/PUTSubscriptionResponseType.md)
 - [SwaggerClient::PUTSubscriptionResponseTypeChargeMetrics](docs/PUTSubscriptionResponseTypeChargeMetrics.md)
 - [SwaggerClient::PUTSubscriptionResponseTypeCreditMemo](docs/PUTSubscriptionResponseTypeCreditMemo.md)
 - [SwaggerClient::PUTSubscriptionResumeResponseType](docs/PUTSubscriptionResumeResponseType.md)
 - [SwaggerClient::PUTSubscriptionResumeType](docs/PUTSubscriptionResumeType.md)
 - [SwaggerClient::PUTSubscriptionSuspendResponseType](docs/PUTSubscriptionSuspendResponseType.md)
 - [SwaggerClient::PUTSubscriptionSuspendType](docs/PUTSubscriptionSuspendType.md)
 - [SwaggerClient::PUTSubscriptionType](docs/PUTSubscriptionType.md)
 - [SwaggerClient::PUTTaxationItemType](docs/PUTTaxationItemType.md)
 - [SwaggerClient::PUTVerifyPaymentMethodResponseType](docs/PUTVerifyPaymentMethodResponseType.md)
 - [SwaggerClient::PUTVerifyPaymentMethodType](docs/PUTVerifyPaymentMethodType.md)
 - [SwaggerClient::PUTVerifyPaymentMethodTypeGatewayOptions](docs/PUTVerifyPaymentMethodTypeGatewayOptions.md)
 - [SwaggerClient::PaymentCollectionResponseType](docs/PaymentCollectionResponseType.md)
 - [SwaggerClient::PaymentDebitMemoApplicationApplyRequestType](docs/PaymentDebitMemoApplicationApplyRequestType.md)
 - [SwaggerClient::PaymentDebitMemoApplicationCreateRequestType](docs/PaymentDebitMemoApplicationCreateRequestType.md)
 - [SwaggerClient::PaymentDebitMemoApplicationItemApplyRequestType](docs/PaymentDebitMemoApplicationItemApplyRequestType.md)
 - [SwaggerClient::PaymentDebitMemoApplicationItemCreateRequestType](docs/PaymentDebitMemoApplicationItemCreateRequestType.md)
 - [SwaggerClient::PaymentDebitMemoApplicationItemUnapplyRequestType](docs/PaymentDebitMemoApplicationItemUnapplyRequestType.md)
 - [SwaggerClient::PaymentDebitMemoApplicationUnapplyRequestType](docs/PaymentDebitMemoApplicationUnapplyRequestType.md)
 - [SwaggerClient::PaymentInvoiceApplicationApplyRequestType](docs/PaymentInvoiceApplicationApplyRequestType.md)
 - [SwaggerClient::PaymentInvoiceApplicationCreateRequestType](docs/PaymentInvoiceApplicationCreateRequestType.md)
 - [SwaggerClient::PaymentInvoiceApplicationItemApplyRequestType](docs/PaymentInvoiceApplicationItemApplyRequestType.md)
 - [SwaggerClient::PaymentInvoiceApplicationItemCreateRequestType](docs/PaymentInvoiceApplicationItemCreateRequestType.md)
 - [SwaggerClient::PaymentInvoiceApplicationItemUnapplyRequestType](docs/PaymentInvoiceApplicationItemUnapplyRequestType.md)
 - [SwaggerClient::PaymentInvoiceApplicationUnapplyRequestType](docs/PaymentInvoiceApplicationUnapplyRequestType.md)
 - [SwaggerClient::PostBillingPreviewParam](docs/PostBillingPreviewParam.md)
 - [SwaggerClient::PostBillingPreviewRunParam](docs/PostBillingPreviewRunParam.md)
 - [SwaggerClient::PostCreditMemoEmailRequestType](docs/PostCreditMemoEmailRequestType.md)
 - [SwaggerClient::PostDebitMemoEmailType](docs/PostDebitMemoEmailType.md)
 - [SwaggerClient::PostGenerateBillingDocumentType](docs/PostGenerateBillingDocumentType.md)
 - [SwaggerClient::PostInvoiceEmailRequestType](docs/PostInvoiceEmailRequestType.md)
 - [SwaggerClient::PostNonRefRefundType](docs/PostNonRefRefundType.md)
 - [SwaggerClient::PostNonRefRefundTypeFinanceInformation](docs/PostNonRefRefundTypeFinanceInformation.md)
 - [SwaggerClient::PostRefundType](docs/PostRefundType.md)
 - [SwaggerClient::PostRefundTypeFinanceInformation](docs/PostRefundTypeFinanceInformation.md)
 - [SwaggerClient::PreviewAccountInfo](docs/PreviewAccountInfo.md)
 - [SwaggerClient::PreviewContactInfo](docs/PreviewContactInfo.md)
 - [SwaggerClient::PreviewOptions](docs/PreviewOptions.md)
 - [SwaggerClient::PreviewResult](docs/PreviewResult.md)
 - [SwaggerClient::PreviewResultChargeMetrics](docs/PreviewResultChargeMetrics.md)
 - [SwaggerClient::PreviewResultCreditMemos](docs/PreviewResultCreditMemos.md)
 - [SwaggerClient::PreviewResultInvoices](docs/PreviewResultInvoices.md)
 - [SwaggerClient::PreviewResultOrderActions](docs/PreviewResultOrderActions.md)
 - [SwaggerClient::PreviewResultOrderMetrics](docs/PreviewResultOrderMetrics.md)
 - [SwaggerClient::PriceChangeParams](docs/PriceChangeParams.md)
 - [SwaggerClient::PricingOverride](docs/PricingOverride.md)
 - [SwaggerClient::PricingUpdate](docs/PricingUpdate.md)
 - [SwaggerClient::ProcessingOptions](docs/ProcessingOptions.md)
 - [SwaggerClient::ProvisionEntityResponseType](docs/ProvisionEntityResponseType.md)
 - [SwaggerClient::ProxyActionamendRequest](docs/ProxyActionamendRequest.md)
 - [SwaggerClient::ProxyActionamendResponse](docs/ProxyActionamendResponse.md)
 - [SwaggerClient::ProxyActioncreateRequest](docs/ProxyActioncreateRequest.md)
 - [SwaggerClient::ProxyActioncreateResponse](docs/ProxyActioncreateResponse.md)
 - [SwaggerClient::ProxyActiondeleteRequest](docs/ProxyActiondeleteRequest.md)
 - [SwaggerClient::ProxyActiondeleteResponse](docs/ProxyActiondeleteResponse.md)
 - [SwaggerClient::ProxyActionexecuteRequest](docs/ProxyActionexecuteRequest.md)
 - [SwaggerClient::ProxyActionexecuteResponse](docs/ProxyActionexecuteResponse.md)
 - [SwaggerClient::ProxyActiongenerateRequest](docs/ProxyActiongenerateRequest.md)
 - [SwaggerClient::ProxyActiongenerateResponse](docs/ProxyActiongenerateResponse.md)
 - [SwaggerClient::ProxyActionqueryMoreRequest](docs/ProxyActionqueryMoreRequest.md)
 - [SwaggerClient::ProxyActionqueryMoreResponse](docs/ProxyActionqueryMoreResponse.md)
 - [SwaggerClient::ProxyActionqueryRequest](docs/ProxyActionqueryRequest.md)
 - [SwaggerClient::ProxyActionqueryResponse](docs/ProxyActionqueryResponse.md)
 - [SwaggerClient::ProxyActionsubscribeRequest](docs/ProxyActionsubscribeRequest.md)
 - [SwaggerClient::ProxyActionsubscribeResponse](docs/ProxyActionsubscribeResponse.md)
 - [SwaggerClient::ProxyActionupdateRequest](docs/ProxyActionupdateRequest.md)
 - [SwaggerClient::ProxyActionupdateResponse](docs/ProxyActionupdateResponse.md)
 - [SwaggerClient::ProxyBadRequestResponse](docs/ProxyBadRequestResponse.md)
 - [SwaggerClient::ProxyBadRequestResponseErrors](docs/ProxyBadRequestResponseErrors.md)
 - [SwaggerClient::ProxyCreateAccount](docs/ProxyCreateAccount.md)
 - [SwaggerClient::ProxyCreateAmendment](docs/ProxyCreateAmendment.md)
 - [SwaggerClient::ProxyCreateAmendmentRatePlanData](docs/ProxyCreateAmendmentRatePlanData.md)
 - [SwaggerClient::ProxyCreateAmendmentRatePlanDataRatePlan](docs/ProxyCreateAmendmentRatePlanDataRatePlan.md)
 - [SwaggerClient::ProxyCreateBillRun](docs/ProxyCreateBillRun.md)
 - [SwaggerClient::ProxyCreateContact](docs/ProxyCreateContact.md)
 - [SwaggerClient::ProxyCreateExport](docs/ProxyCreateExport.md)
 - [SwaggerClient::ProxyCreateInvoiceAdjustment](docs/ProxyCreateInvoiceAdjustment.md)
 - [SwaggerClient::ProxyCreateInvoicePayment](docs/ProxyCreateInvoicePayment.md)
 - [SwaggerClient::ProxyCreateOrModifyResponse](docs/ProxyCreateOrModifyResponse.md)
 - [SwaggerClient::ProxyCreatePayment](docs/ProxyCreatePayment.md)
 - [SwaggerClient::ProxyCreatePaymentGatewayOptionData](docs/ProxyCreatePaymentGatewayOptionData.md)
 - [SwaggerClient::ProxyCreatePaymentMethod](docs/ProxyCreatePaymentMethod.md)
 - [SwaggerClient::ProxyCreateProduct](docs/ProxyCreateProduct.md)
 - [SwaggerClient::ProxyCreateProductRatePlan](docs/ProxyCreateProductRatePlan.md)
 - [SwaggerClient::ProxyCreateRefund](docs/ProxyCreateRefund.md)
 - [SwaggerClient::ProxyCreateRefundRefundInvoicePaymentData](docs/ProxyCreateRefundRefundInvoicePaymentData.md)
 - [SwaggerClient::ProxyCreateTaxationItem](docs/ProxyCreateTaxationItem.md)
 - [SwaggerClient::ProxyCreateUnitOfMeasure](docs/ProxyCreateUnitOfMeasure.md)
 - [SwaggerClient::ProxyCreateUsage](docs/ProxyCreateUsage.md)
 - [SwaggerClient::ProxyDeleteResponse](docs/ProxyDeleteResponse.md)
 - [SwaggerClient::ProxyGetAccount](docs/ProxyGetAccount.md)
 - [SwaggerClient::ProxyGetAmendment](docs/ProxyGetAmendment.md)
 - [SwaggerClient::ProxyGetBillRun](docs/ProxyGetBillRun.md)
 - [SwaggerClient::ProxyGetCommunicationProfile](docs/ProxyGetCommunicationProfile.md)
 - [SwaggerClient::ProxyGetContact](docs/ProxyGetContact.md)
 - [SwaggerClient::ProxyGetCreditBalanceAdjustment](docs/ProxyGetCreditBalanceAdjustment.md)
 - [SwaggerClient::ProxyGetExport](docs/ProxyGetExport.md)
 - [SwaggerClient::ProxyGetFeature](docs/ProxyGetFeature.md)
 - [SwaggerClient::ProxyGetImport](docs/ProxyGetImport.md)
 - [SwaggerClient::ProxyGetInvoice](docs/ProxyGetInvoice.md)
 - [SwaggerClient::ProxyGetInvoiceAdjustment](docs/ProxyGetInvoiceAdjustment.md)
 - [SwaggerClient::ProxyGetInvoiceItem](docs/ProxyGetInvoiceItem.md)
 - [SwaggerClient::ProxyGetInvoiceItemAdjustment](docs/ProxyGetInvoiceItemAdjustment.md)
 - [SwaggerClient::ProxyGetInvoicePayment](docs/ProxyGetInvoicePayment.md)
 - [SwaggerClient::ProxyGetInvoiceSplit](docs/ProxyGetInvoiceSplit.md)
 - [SwaggerClient::ProxyGetInvoiceSplitItem](docs/ProxyGetInvoiceSplitItem.md)
 - [SwaggerClient::ProxyGetPayment](docs/ProxyGetPayment.md)
 - [SwaggerClient::ProxyGetPaymentMethod](docs/ProxyGetPaymentMethod.md)
 - [SwaggerClient::ProxyGetPaymentMethodSnapshot](docs/ProxyGetPaymentMethodSnapshot.md)
 - [SwaggerClient::ProxyGetPaymentMethodTransactionLog](docs/ProxyGetPaymentMethodTransactionLog.md)
 - [SwaggerClient::ProxyGetPaymentTransactionLog](docs/ProxyGetPaymentTransactionLog.md)
 - [SwaggerClient::ProxyGetProduct](docs/ProxyGetProduct.md)
 - [SwaggerClient::ProxyGetProductFeature](docs/ProxyGetProductFeature.md)
 - [SwaggerClient::ProxyGetProductRatePlan](docs/ProxyGetProductRatePlan.md)
 - [SwaggerClient::ProxyGetProductRatePlanCharge](docs/ProxyGetProductRatePlanCharge.md)
 - [SwaggerClient::ProxyGetProductRatePlanChargeTier](docs/ProxyGetProductRatePlanChargeTier.md)
 - [SwaggerClient::ProxyGetRatePlan](docs/ProxyGetRatePlan.md)
 - [SwaggerClient::ProxyGetRatePlanCharge](docs/ProxyGetRatePlanCharge.md)
 - [SwaggerClient::ProxyGetRatePlanChargeTier](docs/ProxyGetRatePlanChargeTier.md)
 - [SwaggerClient::ProxyGetRefund](docs/ProxyGetRefund.md)
 - [SwaggerClient::ProxyGetRefundInvoicePayment](docs/ProxyGetRefundInvoicePayment.md)
 - [SwaggerClient::ProxyGetRefundTransactionLog](docs/ProxyGetRefundTransactionLog.md)
 - [SwaggerClient::ProxyGetSubscription](docs/ProxyGetSubscription.md)
 - [SwaggerClient::ProxyGetSubscriptionProductFeature](docs/ProxyGetSubscriptionProductFeature.md)
 - [SwaggerClient::ProxyGetTaxationItem](docs/ProxyGetTaxationItem.md)
 - [SwaggerClient::ProxyGetUnitOfMeasure](docs/ProxyGetUnitOfMeasure.md)
 - [SwaggerClient::ProxyGetUsage](docs/ProxyGetUsage.md)
 - [SwaggerClient::ProxyModifyAccount](docs/ProxyModifyAccount.md)
 - [SwaggerClient::ProxyModifyAmendment](docs/ProxyModifyAmendment.md)
 - [SwaggerClient::ProxyModifyBillRun](docs/ProxyModifyBillRun.md)
 - [SwaggerClient::ProxyModifyContact](docs/ProxyModifyContact.md)
 - [SwaggerClient::ProxyModifyInvoice](docs/ProxyModifyInvoice.md)
 - [SwaggerClient::ProxyModifyInvoiceAdjustment](docs/ProxyModifyInvoiceAdjustment.md)
 - [SwaggerClient::ProxyModifyInvoicePayment](docs/ProxyModifyInvoicePayment.md)
 - [SwaggerClient::ProxyModifyPayment](docs/ProxyModifyPayment.md)
 - [SwaggerClient::ProxyModifyPaymentMethod](docs/ProxyModifyPaymentMethod.md)
 - [SwaggerClient::ProxyModifyProduct](docs/ProxyModifyProduct.md)
 - [SwaggerClient::ProxyModifyProductRatePlan](docs/ProxyModifyProductRatePlan.md)
 - [SwaggerClient::ProxyModifyRefund](docs/ProxyModifyRefund.md)
 - [SwaggerClient::ProxyModifySubscription](docs/ProxyModifySubscription.md)
 - [SwaggerClient::ProxyModifyTaxationItem](docs/ProxyModifyTaxationItem.md)
 - [SwaggerClient::ProxyModifyUnitOfMeasure](docs/ProxyModifyUnitOfMeasure.md)
 - [SwaggerClient::ProxyModifyUsage](docs/ProxyModifyUsage.md)
 - [SwaggerClient::ProxyNoDataResponse](docs/ProxyNoDataResponse.md)
 - [SwaggerClient::PutCreditMemoTaxItemType](docs/PutCreditMemoTaxItemType.md)
 - [SwaggerClient::PutCreditMemoTaxItemTypeFinanceInformation](docs/PutCreditMemoTaxItemTypeFinanceInformation.md)
 - [SwaggerClient::PutDebitMemoTaxItemType](docs/PutDebitMemoTaxItemType.md)
 - [SwaggerClient::PutDebitMemoTaxItemTypeFinanceInformation](docs/PutDebitMemoTaxItemTypeFinanceInformation.md)
 - [SwaggerClient::PutReverseInvoiceResponseType](docs/PutReverseInvoiceResponseType.md)
 - [SwaggerClient::PutReverseInvoiceResponseTypeCreditMemo](docs/PutReverseInvoiceResponseTypeCreditMemo.md)
 - [SwaggerClient::PutReverseInvoiceType](docs/PutReverseInvoiceType.md)
 - [SwaggerClient::RatePlan](docs/RatePlan.md)
 - [SwaggerClient::RatePlanChargeData](docs/RatePlanChargeData.md)
 - [SwaggerClient::RatePlanChargeDataInRatePlanData](docs/RatePlanChargeDataInRatePlanData.md)
 - [SwaggerClient::RatePlanChargeDataInRatePlanDataRatePlanCharge](docs/RatePlanChargeDataInRatePlanDataRatePlanCharge.md)
 - [SwaggerClient::RatePlanChargeDataRatePlanCharge](docs/RatePlanChargeDataRatePlanCharge.md)
 - [SwaggerClient::RatePlanChargeTier](docs/RatePlanChargeTier.md)
 - [SwaggerClient::RatePlanData](docs/RatePlanData.md)
 - [SwaggerClient::RatePlanDataRatePlan](docs/RatePlanDataRatePlan.md)
 - [SwaggerClient::RatePlanDataSubscriptionProductFeatureList](docs/RatePlanDataSubscriptionProductFeatureList.md)
 - [SwaggerClient::RatePlanOverride](docs/RatePlanOverride.md)
 - [SwaggerClient::RatePlanUpdate](docs/RatePlanUpdate.md)
 - [SwaggerClient::RatedItem](docs/RatedItem.md)
 - [SwaggerClient::RefundCreditMemoItemType](docs/RefundCreditMemoItemType.md)
 - [SwaggerClient::RefundInvoicePayment](docs/RefundInvoicePayment.md)
 - [SwaggerClient::RefundPartResponseType](docs/RefundPartResponseType.md)
 - [SwaggerClient::RefundPartResponseTypewithSuccess](docs/RefundPartResponseTypewithSuccess.md)
 - [SwaggerClient::RemoveProduct](docs/RemoveProduct.md)
 - [SwaggerClient::RenewalTerm](docs/RenewalTerm.md)
 - [SwaggerClient::RevenueScheduleItemType](docs/RevenueScheduleItemType.md)
 - [SwaggerClient::SaveResult](docs/SaveResult.md)
 - [SwaggerClient::SubscribeRequest](docs/SubscribeRequest.md)
 - [SwaggerClient::SubscribeRequestAccount](docs/SubscribeRequestAccount.md)
 - [SwaggerClient::SubscribeRequestBillToContact](docs/SubscribeRequestBillToContact.md)
 - [SwaggerClient::SubscribeRequestPaymentMethod](docs/SubscribeRequestPaymentMethod.md)
 - [SwaggerClient::SubscribeRequestPaymentMethodGatewayOptionData](docs/SubscribeRequestPaymentMethodGatewayOptionData.md)
 - [SwaggerClient::SubscribeRequestPreviewOptions](docs/SubscribeRequestPreviewOptions.md)
 - [SwaggerClient::SubscribeRequestSoldToContact](docs/SubscribeRequestSoldToContact.md)
 - [SwaggerClient::SubscribeRequestSubscribeOptions](docs/SubscribeRequestSubscribeOptions.md)
 - [SwaggerClient::SubscribeRequestSubscribeOptionsElectronicPaymentOptions](docs/SubscribeRequestSubscribeOptionsElectronicPaymentOptions.md)
 - [SwaggerClient::SubscribeRequestSubscribeOptionsExternalPaymentOptions](docs/SubscribeRequestSubscribeOptionsExternalPaymentOptions.md)
 - [SwaggerClient::SubscribeRequestSubscribeOptionsSubscribeInvoiceProcessingOptions](docs/SubscribeRequestSubscribeOptionsSubscribeInvoiceProcessingOptions.md)
 - [SwaggerClient::SubscribeRequestSubscriptionData](docs/SubscribeRequestSubscriptionData.md)
 - [SwaggerClient::SubscribeRequestSubscriptionDataSubscription](docs/SubscribeRequestSubscriptionDataSubscription.md)
 - [SwaggerClient::SubscribeResult](docs/SubscribeResult.md)
 - [SwaggerClient::SubscribeResultChargeMetricsData](docs/SubscribeResultChargeMetricsData.md)
 - [SwaggerClient::SubscribeResultInvoiceResult](docs/SubscribeResultInvoiceResult.md)
 - [SwaggerClient::SubscriptionProductFeature](docs/SubscriptionProductFeature.md)
 - [SwaggerClient::SubscriptionProductFeatureList](docs/SubscriptionProductFeatureList.md)
 - [SwaggerClient::SubscriptionRatedResult](docs/SubscriptionRatedResult.md)
 - [SwaggerClient::TaxInfo](docs/TaxInfo.md)
 - [SwaggerClient::Terms](docs/Terms.md)
 - [SwaggerClient::TermsAndConditions](docs/TermsAndConditions.md)
 - [SwaggerClient::TimeSlicedMetrics](docs/TimeSlicedMetrics.md)
 - [SwaggerClient::TimeSlicedNetMetrics](docs/TimeSlicedNetMetrics.md)
 - [SwaggerClient::TimeSlicedTcbNetMetrics](docs/TimeSlicedTcbNetMetrics.md)
 - [SwaggerClient::TokenResponse](docs/TokenResponse.md)
 - [SwaggerClient::TransferPaymentType](docs/TransferPaymentType.md)
 - [SwaggerClient::TriggerDates](docs/TriggerDates.md)
 - [SwaggerClient::TriggerDatesInner](docs/TriggerDatesInner.md)
 - [SwaggerClient::TriggerParams](docs/TriggerParams.md)
 - [SwaggerClient::UnapplyCreditMemoType](docs/UnapplyCreditMemoType.md)
 - [SwaggerClient::UnapplyPaymentType](docs/UnapplyPaymentType.md)
 - [SwaggerClient::UpdateEntityResponseType](docs/UpdateEntityResponseType.md)
 - [SwaggerClient::UpdateEntityType](docs/UpdateEntityType.md)
 - [SwaggerClient::UpdatePaymentType](docs/UpdatePaymentType.md)
 - [SwaggerClient::ZObject](docs/ZObject.md)
 - [SwaggerClient::ZObjectUpdate](docs/ZObjectUpdate.md)
 - [SwaggerClient::GetCreditMemoAmountBreakdownByOrderResponse](docs/GetCreditMemoAmountBreakdownByOrderResponse.md)
 - [SwaggerClient::GetInvoiceAmountBreakdownByOrderResponse](docs/GetInvoiceAmountBreakdownByOrderResponse.md)
 - [SwaggerClient::GetOrderBillingInfoResponseType](docs/GetOrderBillingInfoResponseType.md)
 - [SwaggerClient::GetOrderRatedResultResponseType](docs/GetOrderRatedResultResponseType.md)
 - [SwaggerClient::GetOrderResponse](docs/GetOrderResponse.md)
 - [SwaggerClient::GetOrdersResponse](docs/GetOrdersResponse.md)
 - [SwaggerClient::PostOrderPreviewResponseType](docs/PostOrderPreviewResponseType.md)
 - [SwaggerClient::PostOrderResponseType](docs/PostOrderResponseType.md)
 - [SwaggerClient::RecurringFlatFeePricingOverride](docs/RecurringFlatFeePricingOverride.md)
 - [SwaggerClient::RecurringFlatFeePricingUpdate](docs/RecurringFlatFeePricingUpdate.md)
 - [SwaggerClient::RecurringPerUnitPricingOverride](docs/RecurringPerUnitPricingOverride.md)
 - [SwaggerClient::RecurringPerUnitPricingUpdate](docs/RecurringPerUnitPricingUpdate.md)
 - [SwaggerClient::RecurringTieredPricingOverride](docs/RecurringTieredPricingOverride.md)
 - [SwaggerClient::RecurringTieredPricingUpdate](docs/RecurringTieredPricingUpdate.md)
 - [SwaggerClient::RecurringVolumePricingOverride](docs/RecurringVolumePricingOverride.md)
 - [SwaggerClient::RecurringVolumePricingUpdate](docs/RecurringVolumePricingUpdate.md)
 - [SwaggerClient::UsageFlatFeePricingOverride](docs/UsageFlatFeePricingOverride.md)
 - [SwaggerClient::UsageFlatFeePricingUpdate](docs/UsageFlatFeePricingUpdate.md)
 - [SwaggerClient::UsageOveragePricingOverride](docs/UsageOveragePricingOverride.md)
 - [SwaggerClient::UsageOveragePricingUpdate](docs/UsageOveragePricingUpdate.md)
 - [SwaggerClient::UsagePerUnitPricingOverride](docs/UsagePerUnitPricingOverride.md)
 - [SwaggerClient::UsagePerUnitPricingUpdate](docs/UsagePerUnitPricingUpdate.md)
 - [SwaggerClient::UsageTieredPricingOverride](docs/UsageTieredPricingOverride.md)
 - [SwaggerClient::UsageTieredPricingUpdate](docs/UsageTieredPricingUpdate.md)
 - [SwaggerClient::UsageTieredWithOveragePricingOverride](docs/UsageTieredWithOveragePricingOverride.md)
 - [SwaggerClient::UsageTieredWithOveragePricingUpdate](docs/UsageTieredWithOveragePricingUpdate.md)
 - [SwaggerClient::UsageVolumePricingOverride](docs/UsageVolumePricingOverride.md)
 - [SwaggerClient::UsageVolumePricingUpdate](docs/UsageVolumePricingUpdate.md)


## Documentation for Authorization

 All endpoints do not require authorization.

