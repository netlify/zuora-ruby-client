=begin
#Zuora API Reference

#  # Introduction Welcome to the reference for the Zuora REST API!  <a href=\"http://en.wikipedia.org/wiki/REST_API\" target=\"_blank\">REST</a> is a web-service protocol that lends itself to rapid development by using everyday HTTP and JSON technology.  The Zuora REST API provides a broad set of operations and resources that:    * Enable Web Storefront integration from your website.   * Support self-service subscriber sign-ups and account management.   * Process revenue schedules through custom revenue rule models.   * Enable manipulation of most objects in the Zuora Object Model.  Want to share your opinion on how our API works for you? <a href=\"https://community.zuora.com/t5/Developers/API-Feedback-Form/gpm-p/21399\" target=\"_blank\">Tell us how you feel </a>about using our API and what we can do to make it better.    ## Endpoints      The Zuora REST API is provided via the following endpoints.   | Tenant              | Base URL for REST Endpoints |   |-------------------------|-------------------------|   |US Production | https://rest.zuora.com   |   |US API Sandbox    | https://rest.apisandbox.zuora.com|   |US Performance Test | https://rest.pt1.zuora.com |   |EU Production | https://rest.eu.zuora.com |   |EU Sandbox | https://rest.sandbox.eu.zuora.com |      The production endpoint provides access to your live user data. The API Sandbox tenant is a good place to test your code without affecting real-world data. To use it, you must be provisioned with an API Sandbox tenant - your Zuora representative can help you if needed.      ## Access to the API      If you have a Zuora tenant, you already have access to the API.      If you don't have a Zuora tenant, go to <a href=\" https://www.zuora.com/resource/zuora-test-drive\" target=\"_blank\">https://www.zuora.com/resource/zuora-test-drive</a> and sign up for a Production Test Drive tenant. The tenant comes with seed data, such as a sample product catalog.  We recommend that you <a href=\"https://knowledgecenter.zuora.com/CF_Users_and_Administrators/A_Administrator_Settings/Manage_Users/Create_an_API_User\" target=\"_blank\">create an API user</a> specifically for making API calls. Don't log in to the Zuora UI with this account. Logging in to the UI enables a security feature that periodically expires the account's password, which may eventually cause authentication failures with the API. Note that a user role does not have write access to Zuora REST services unless it has the API Write Access permission as described in those instructions.   # API Changelog You can find the <a href=\"https://community.zuora.com/t5/Developers/API-Changelog/gpm-p/18092\" target=\"_blank\">Changelog</a> of the API Reference in the Zuora Community.   # Authentication  ## OAuth v2.0  Zuora recommends that you use OAuth v2.0 to authenticate to the Zuora REST API. Currently, OAuth is not available in every environment. See [Zuora Testing Environments](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/D_Zuora_Environments) for more information.  Zuora recommends you to create a dedicated API user with API write access on a tenant when authenticating via OAuth, and then create an OAuth client for this user. By doing this, you can control permissions of the API user without affecting other non-API users. Note that if a user is deactivated, all his OAuth clients will be automatically deactivated.  Authenticating via OAuth requires the following steps: 1. Create a Client 2. Generate a Token 3. Make Authenticated Requests  ### Create a Client  You must first [create an OAuth client](https://knowledgecenter.zuora.com/CF_Users_and_Administrators/A_Administrator_Settings/Manage_Users#Create_an_OAuth_Client_for_a_User) in the Zuora UI. To do this, you must be an administrator of your Zuora tenant. This is a one-time operation. You will be provided with a Client ID and a Client Secret. Please note this information down, as it will be required for the next step.  **Note:** The OAuth client will be owned by a Zuora user account. If you want to perform PUT, POST, or DELETE operations using the OAuth client, the owner of the OAuth client must have a Platform role that includes the \"API Write Access\" permission.  ### Generate a Token  After creating a client, you must make a call to obtain a bearer token using the [Generate an OAuth token](https://www.zuora.com/developer/api-reference/#operation/createToken) operation. This operation requires the following parameters: - `client_id` - the Client ID displayed when you created the OAuth client in the previous step - `client_secret` - the Client Secret displayed when you created the OAuth client in the previous step - `grant_type` - must be set to `client_credentials`  **Note**: The Client ID and Client Secret mentioned above were displayed when you created the OAuth Client in the prior step. The [Generate an OAuth token](https://www.zuora.com/developer/api-reference/#operation/createToken) response specifies how long the bearer token is valid for. Call [Generate an OAuth token](https://www.zuora.com/developer/api-reference/#operation/createToken) again to generate a new bearer token.  ### Make Authenticated Requests  To authenticate subsequent API requests, you must provide a valid bearer token in an HTTP header:  `Authorization: Bearer {bearer_token}`  If you have [Zuora Multi-entity](https://www.zuora.com/developer/api-reference/#tag/Entities) enabled, you need to set an additional header to specify the ID of the entity that you want to access. You can use the `scope` field in the [Generate an OAuth token](https://www.zuora.com/developer/api-reference/#operation/createToken) response to determine whether you need to specify an entity ID.  If the `scope` field contains more than one entity ID, you must specify the ID of the entity that you want to access. For example, if the `scope` field contains `entity.1a2b7a37-3e7d-4cb3-b0e2-883de9e766cc` and `entity.c92ed977-510c-4c48-9b51-8d5e848671e9`, specify one of the following headers: - `Zuora-Entity-Ids: 1a2b7a37-3e7d-4cb3-b0e2-883de9e766cc` - `Zuora-Entity-Ids: c92ed977-510c-4c48-9b51-8d5e848671e9`  **Note**: For a limited period of time, Zuora will accept the `entityId` header as an alternative to the `Zuora-Entity-Ids` header. If you choose to set the `entityId` header, you must remove all \"-\" characters from the entity ID in the `scope` field.  If the `scope` field contains a single entity ID, you do not need to specify an entity ID.   ## Other Supported Authentication Schemes  Zuora continues to support the following additional legacy means of authentication:    * Use username and password. Include authentication with each request in the header:         * `apiAccessKeyId`      * `apiSecretAccessKey`    * Use an authorization cookie. The cookie authorizes the user to make calls to the REST API for the duration specified in  **Administration > Security Policies > Session timeout**. The cookie expiration time is reset with this duration after every call to the REST API. To obtain a cookie, call the [Connections](https://www.zuora.com/developer/api-reference/#tag/Connections) resource with the following API user information:         *   ID         *   password        * For CORS-enabled APIs only: Include a 'single-use' token in the request header, which re-authenticates the user with each request. See below for more details.  ### Entity Id and Entity Name  The `entityId` and `entityName` parameters are only used for [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity \"Zuora Multi-entity\"). These are the legacy parameters that Zuora will only continue to support for a period of time. Zuora recommends you to use the `Zuora-Entity-Ids` parameter instead.   The  `entityId` and `entityName` parameters specify the Id and the [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name \"Introduction to Entity and Entity Hierarchy\") that you want to access, respectively. Note that you must have permission to access the entity.   You can specify either the `entityId` or `entityName` parameter in the authentication to access and view an entity.    * If both `entityId` and `entityName` are specified in the authentication, an error occurs.    * If neither `entityId` nor `entityName` is specified in the authentication, you will log in to the entity in which your user account is created.      To get the entity Id and entity name, you can use the GET Entities REST call. For more information, see [API User Authentication](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/A_Overview_of_Multi-entity#API_User_Authentication \"API User Authentication\").      ### Token Authentication for CORS-Enabled APIs      The CORS mechanism enables REST API calls to Zuora to be made directly from your customer's browser, with all credit card and security information transmitted directly to Zuora. This minimizes your PCI compliance burden, allows you to implement advanced validation on your payment forms, and  makes your payment forms look just like any other part of your website.    For security reasons, instead of using cookies, an API request via CORS uses **tokens** for authentication.  The token method of authentication is only designed for use with requests that must originate from your customer's browser; **it should  not be considered a replacement to the existing cookie authentication** mechanism.  See [Zuora CORS REST](https://knowledgecenter.zuora.com/DC_Developers/REST_API/A_REST_basics/G_CORS_REST \"Zuora CORS REST\") for details on how CORS works and how you can begin to implement customer calls to the Zuora REST APIs. See  [HMAC Signatures](https://www.zuora.com/developer/api-reference/#operation/POSTHMACSignature \"HMAC Signatures\") for details on the HMAC method that returns the authentication token.  # Requests and Responses  ## Request IDs  As a general rule, when asked to supply a \"key\" for an account or subscription (accountKey, account-key, subscriptionKey, subscription-key), you can provide either the actual ID or  the number of the entity.  ## HTTP Request Body  Most of the parameters and data accompanying your requests will be contained in the body of the HTTP request.   The Zuora REST API accepts JSON in the HTTP request body. No other data format (e.g., XML) is supported.  ### Data Type  ([Actions](https://www.zuora.com/developer/api-reference/#tag/Actions) and CRUD operations only) We recommend that you do not specify the decimal values with quotation marks, commas, and spaces. Use characters of `+-0-9.eE`, for example, `5`, `1.9`, `-8.469`, and `7.7e2`. Also, Zuora does not convert currencies for decimal values.  ## Testing a Request  Use a third party client, such as [curl](https://curl.haxx.se \"curl\"), [Postman](https://www.getpostman.com \"Postman\"), or [Advanced REST Client](https://advancedrestclient.com \"Advanced REST Client\"), to test the Zuora REST API.  You can test the Zuora REST API from the Zuora API Sandbox or Production tenants. If connecting to Production, bear in mind that you are working with your live production data, not sample data or test data.  ## Testing with Credit Cards  Sooner or later it will probably be necessary to test some transactions that involve credit cards. For suggestions on how to handle this, see [Going Live With Your Payment Gateway](https://knowledgecenter.zuora.com/CB_Billing/M_Payment_Gateways/C_Managing_Payment_Gateways/B_Going_Live_Payment_Gateways#Testing_with_Credit_Cards \"C_Zuora_User_Guides/A_Billing_and_Payments/M_Payment_Gateways/C_Managing_Payment_Gateways/B_Going_Live_Payment_Gateways#Testing_with_Credit_Cards\" ).  ## Concurrent Request Limits  Zuora enforces tenant-level concurrent request limits. See <a href=\"https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Policies/Concurrent_Request_Limits\" target=\"_blank\">Concurrent Request Limits</a> for more information.    ## Error Handling  Responses and error codes are detailed in [Responses and errors](https://knowledgecenter.zuora.com/DC_Developers/REST_API/A_REST_basics/3_Responses_and_errors \"Responses and errors\").  # Pagination  When retrieving information (using GET methods), the optional `pageSize` query parameter sets the maximum number of rows to return in a response. The maximum is `40`; larger values are treated as `40`. If this value is empty or invalid, `pageSize` typically defaults to `10`.  The default value for the maximum number of rows retrieved can be overridden at the method level.  If more rows are available, the response will include a `nextPage` element, which contains a URL for requesting the next page.  If this value is not provided, no more rows are available. No \"previous page\" element is explicitly provided; to support backward paging, use the previous call.  ## Array Size  For data items that are not paginated, the REST API supports arrays of up to 300 rows.  Thus, for instance, repeated pagination can retrieve thousands of customer accounts, but within any account an array of no more than 300 rate plans is returned.  # API Versions  The Zuora REST API are version controlled. Versioning ensures that Zuora REST API changes are backward compatible. Zuora uses a major and minor version nomenclature to manage changes. By specifying a version in a REST request, you can get expected responses regardless of future changes to the API.  ## Major Version  The major version number of the REST API appears in the REST URL. Currently, Zuora only supports the **v1** major version. For example, `POST https://rest.zuora.com/v1/subscriptions`.  ## Minor Version  Zuora uses minor versions for the REST API to control small changes. For example, a field in a REST method is deprecated and a new field is used to replace it.   Some fields in the REST methods are supported as of minor versions. If a field is not noted with a minor version, this field is available for all minor versions. If a field is noted with a minor version, this field is in version control. You must specify the supported minor version in the request header to process without an error.   If a field is in version control, it is either with a minimum minor version or a maximum minor version, or both of them. You can only use this field with the minor version between the minimum and the maximum minor versions. For example, the `invoiceCollect` field in the POST Subscription method is in version control and its maximum minor version is 189.0. You can only use this field with the minor version 189.0 or earlier.  If you specify a version number in the request header that is not supported, Zuora will use the minimum minor version of the REST API. In our REST API documentation, if a field or feature requires a minor version number, we note that in the field description.  You only need to specify the version number when you use the fields require a minor version. To specify the minor version, set the `zuora-version` parameter to the minor version number in the request header for the request call. For example, the `collect` field is in 196.0 minor version. If you want to use this field for the POST Subscription method, set the  `zuora-version` parameter to `196.0` in the request header. The `zuora-version` parameter is case sensitive.  For all the REST API fields, by default, if the minor version is not specified in the request header, Zuora will use the minimum minor version of the REST API to avoid breaking your integration.   ### Minor Version History  The supported minor versions are not serial. This section documents the changes made to each Zuora REST API minor version.  The following table lists the supported versions and the fields that have a Zuora REST API minor version.  | Fields         | Minor Version      | REST Methods    | Description | |:--------|:--------|:--------|:--------| | invoiceCollect | 189.0 and earlier  | [Create Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_Subscription \"Create Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\"); [Renew Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_RenewSubscription \"Renew Subscription\"); [Cancel Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_CancelSubscription \"Cancel Subscription\"); [Suspend Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_SuspendSubscription \"Suspend Subscription\"); [Resume Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_ResumeSubscription \"Resume Subscription\"); [Create Account](https://www.zuora.com/developer/api-reference/#operation/POST_Account \"Create Account\")|Generates an invoice and collects a payment for a subscription. | | collect        | 196.0 and later    | [Create Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_Subscription \"Create Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\"); [Renew Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_RenewSubscription \"Renew Subscription\"); [Cancel Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_CancelSubscription \"Cancel Subscription\"); [Suspend Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_SuspendSubscription \"Suspend Subscription\"); [Resume Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_ResumeSubscription \"Resume Subscription\"); [Create Account](https://www.zuora.com/developer/api-reference/#operation/POST_Account \"Create Account\")|Collects an automatic payment for a subscription. | | invoice | 196.0 and 207.0| [Create Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_Subscription \"Create Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\"); [Renew Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_RenewSubscription \"Renew Subscription\"); [Cancel Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_CancelSubscription \"Cancel Subscription\"); [Suspend Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_SuspendSubscription \"Suspend Subscription\"); [Resume Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_ResumeSubscription \"Resume Subscription\"); [Create Account](https://www.zuora.com/developer/api-reference/#operation/POST_Account \"Create Account\")|Generates an invoice for a subscription. | | invoiceTargetDate | 196.0 and earlier  | [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview \"Preview Subscription\") |Date through which charges are calculated on the invoice, as `yyyy-mm-dd`. | | invoiceTargetDate | 207.0 and earlier  | [Create Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_Subscription \"Create Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\"); [Renew Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_RenewSubscription \"Renew Subscription\"); [Cancel Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_CancelSubscription \"Cancel Subscription\"); [Suspend Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_SuspendSubscription \"Suspend Subscription\"); [Resume Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_ResumeSubscription \"Resume Subscription\"); [Create Account](https://www.zuora.com/developer/api-reference/#operation/POST_Account \"Create Account\")|Date through which charges are calculated on the invoice, as `yyyy-mm-dd`. | | targetDate | 207.0 and later | [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview \"Preview Subscription\") |Date through which charges are calculated on the invoice, as `yyyy-mm-dd`. | | targetDate | 211.0 and later | [Create Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_Subscription \"Create Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\"); [Renew Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_RenewSubscription \"Renew Subscription\"); [Cancel Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_CancelSubscription \"Cancel Subscription\"); [Suspend Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_SuspendSubscription \"Suspend Subscription\"); [Resume Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_ResumeSubscription \"Resume Subscription\"); [Create Account](https://www.zuora.com/developer/api-reference/#operation/POST_Account \"Create Account\")|Date through which charges are calculated on the invoice, as `yyyy-mm-dd`. | | includeExisting DraftInvoiceItems | 196.0 and earlier| [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview \"Preview Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\") | Specifies whether to include draft invoice items in subscription previews. Specify it to be `true` (default) to include draft invoice items in the preview result. Specify it to be `false` to excludes draft invoice items in the preview result. | | includeExisting DraftDocItems | 207.0 and later  | [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview \"Preview Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\") | Specifies whether to include draft invoice items in subscription previews. Specify it to be `true` (default) to include draft invoice items in the preview result. Specify it to be `false` to excludes draft invoice items in the preview result. | | previewType | 196.0 and earlier| [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview \"Preview Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\") | The type of preview you will receive. The possible values are `InvoiceItem`(default), `ChargeMetrics`, and `InvoiceItemChargeMetrics`. | | previewType | 207.0 and later  | [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview \"Preview Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\") | The type of preview you will receive. The possible values are `LegalDoc`(default), `ChargeMetrics`, and `LegalDocChargeMetrics`. | | runBilling  | 211.0 and later  | [Create Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_Subscription \"Create Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\"); [Renew Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_RenewSubscription \"Renew Subscription\"); [Cancel Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_CancelSubscription \"Cancel Subscription\"); [Suspend Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_SuspendSubscription \"Suspend Subscription\"); [Resume Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_ResumeSubscription \"Resume Subscription\"); [Create Account](https://www.zuora.com/developer/api-reference/#operation/POST_Account \"Create Account\")|Generates an invoice or credit memo for a subscription. **Note:** Credit memos are only available if you have the Advanced AR Settlement feature enabled. | | invoiceDate | 214.0 and earlier  | [Invoice and Collect](https://www.zuora.com/developer/api-reference/#operation/POST_TransactionInvoicePayment \"Invoice and Collect\") |Date that should appear on the invoice being generated, as `yyyy-mm-dd`. | | invoiceTargetDate | 214.0 and earlier  | [Invoice and Collect](https://www.zuora.com/developer/api-reference/#operation/POST_TransactionInvoicePayment \"Invoice and Collect\") |Date through which to calculate charges on this account if an invoice is generated, as `yyyy-mm-dd`. | | documentDate | 215.0 and later | [Invoice and Collect](https://www.zuora.com/developer/api-reference/#operation/POST_TransactionInvoicePayment \"Invoice and Collect\") |Date that should appear on the invoice and credit memo being generated, as `yyyy-mm-dd`. | | targetDate | 215.0 and later | [Invoice and Collect](https://www.zuora.com/developer/api-reference/#operation/POST_TransactionInvoicePayment \"Invoice and Collect\") |Date through which to calculate charges on this account if an invoice or a credit memo is generated, as `yyyy-mm-dd`. |  #### Version 207.0 and Later  The response structure of the [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview \"Preview Subscription\") and [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\") methods are changed. The following invoice related response fields are moved to the invoice container:    * amount   * amountWithoutTax   * taxAmount   * invoiceItems   * targetDate   * chargeMetrics  # Zuora Object Model  The following diagram presents a high-level view of the key Zuora objects. Click the image to open it in a new tab to resize it.  <a href=\"https://www.zuora.com/wp-content/uploads/2017/01/ZuoraERD.jpeg\" target=\"_blank\"><img src=\"https://www.zuora.com/wp-content/uploads/2017/01/ZuoraERD.jpeg\" alt=\"Zuora Object Model Diagram\"></a>  You can use the [Describe object](https://www.zuora.com/developer/api-reference/#operation/GET_Describe) operation to list the fields of each Zuora object that is available in your tenant. When you call the operation, you must specify the API name of the Zuora object.  The following table provides the API name of each Zuora object:  | Object                                        | API Name                                   | |-----------------------------------------------|--------------------------------------------| | Account                                       | `Account`                                  | | Accounting Code                               | `AccountingCode`                           | | Accounting Period                             | `AccountingPeriod`                         | | Amendment                                     | `Amendment`                                | | Application Group                             | `ApplicationGroup`                         | | Billing Run                                   | `BillRun`                               | | Contact                                       | `Contact`                                  | | Contact Snapshot                              | `ContactSnapshot`                          | | Credit Balance Adjustment                     | `CreditBalanceAdjustment`                  | | Credit Memo                                   | `CreditMemo`                               | | Credit Memo Application                       | `CreditMemoApplication`                    | | Credit Memo Application Item                  | `CreditMemoApplicationItem`                | | Credit Memo Item                              | `CreditMemoItem`                           | | Credit Memo Part                              | `CreditMemoPart`                           | | Credit Memo Part Item                         | `CreditMemoPartItem`                       | | Credit Taxation Item                          | `CreditTaxationItem`                       | | Custom Exchange Rate                          | `FXCustomRate`                             | | Debit Memo                                    | `DebitMemo`                                | | Debit Memo Item                               | `DebitMemoItem`                            | | Debit Taxation Item                           | `DebitTaxationItem`                        | | Discount Applied Metrics                      | `DiscountAppliedMetrics`                   | | Entity                                        | `Tenant`                                   | | Gateway Reconciliation Event                  | `PaymentGatewayReconciliationEventLog`     | | Gateway Reconciliation Job                    | `PaymentReconciliationJob`                 | | Gateway Reconciliation Log                    | `PaymentReconciliationLog`                 | | Invoice                                       | `Invoice`                                  | | Invoice Adjustment                            | `InvoiceAdjustment`                        | | Invoice Item                                  | `InvoiceItem`                              | | Invoice Item Adjustment                       | `InvoiceItemAdjustment`                    | | Invoice Payment                               | `InvoicePayment`                           | | Journal Entry                                 | `JournalEntry`                             | | Journal Entry Item                            | `JournalEntryItem`                         | | Journal Run                                   | `JournalRun`                               | | Order                                         | `Order`                                    | | Order Action                                  | `OrderAction`                              | | Order MRR                                     | `OrderMrr`                                 | | Order Quantity                                | `OrderQuantity`                            | | Order TCB                                     | `OrderTcb`                                 | | Order TCV                                     | `OrderTcv`                                 | | Payment                                       | `Payment`                                  | | Payment Application                           | `PaymentApplication`                       | | Payment Application Item                      | `PaymentApplicationItem`                   | | Payment Method                                | `PaymentMethod`                            | | Payment Method Snapshot                       | `PaymentMethodSnapshot`                    | | Payment Method Transaction Log                | `PaymentMethodTransactionLog`              | | Payment Method Update                         | `UpdaterDetail`                            | | Payment Part                                  | `PaymentPart`                              | | Payment Part Item                             | `PaymentPartItem`                          | | Payment Run                                   | `PaymentRun`                               | | Payment Transaction Log                       | `PaymentTransactionLog`                    | | Processed Usage                               | `ProcessedUsage`                           | | Product                                       | `Product`                                  | | Product Rate Plan                             | `ProductRatePlan`                          | | Product Rate Plan Charge                      | `ProductRatePlanCharge`                    | | Product Rate Plan Charge Tier                 | `ProductRatePlanChargeTier`                | | Rate Plan                                     | `RatePlan`                                 | | Rate Plan Charge                              | `RatePlanCharge`                           | | Rate Plan Charge Tier                         | `RatePlanChargeTier`                       | | Refund                                        | `Refund`                                   | | Refund Application                            | `RefundApplication`                        | | Refund Application Item                       | `RefundApplicationItem`                    | | Refund Invoice Payment                        | `RefundInvoicePayment`                     | | Refund Part                                   | `RefundPart`                               | | Refund Part Item                              | `RefundPartItem`                           | | Refund Transaction Log                        | `RefundTransactionLog`                     | | Revenue Charge Summary                        | `RevenueChargeSummary`                     | | Revenue Charge Summary Item                   | `RevenueChargeSummaryItem`                 | | Revenue Event                                 | `RevenueEvent`                             | | Revenue Event Credit Memo Item                | `RevenueEventCreditMemoItem`               | | Revenue Event Debit Memo Item                 | `RevenueEventDebitMemoItem`                | | Revenue Event Invoice Item                    | `RevenueEventInvoiceItem`                  | | Revenue Event Invoice Item Adjustment         | `RevenueEventInvoiceItemAdjustment`        | | Revenue Event Item                            | `RevenueEventItem`                         | | Revenue Event Item Credit Memo Item           | `RevenueEventItemCreditMemoItem`           | | Revenue Event Item Debit Memo Item            | `RevenueEventItemDebitMemoItem`            | | Revenue Event Item Invoice Item               | `RevenueEventItemInvoiceItem`              | | Revenue Event Item Invoice Item Adjustment    | `RevenueEventItemInvoiceItemAdjustment`    | | Revenue Event Type                            | `RevenueEventType`                         | | Revenue Schedule                              | `RevenueSchedule`                          | | Revenue Schedule Credit Memo Item             | `RevenueScheduleCreditMemoItem`            | | Revenue Schedule Debit Memo Item              | `RevenueScheduleDebitMemoItem`             | | Revenue Schedule Invoice Item                 | `RevenueScheduleInvoiceItem`               | | Revenue Schedule Invoice Item Adjustment      | `RevenueScheduleInvoiceItemAdjustment`     | | Revenue Schedule Item                         | `RevenueScheduleItem`                      | | Revenue Schedule Item Credit Memo Item        | `RevenueScheduleItemCreditMemoItem`        | | Revenue Schedule Item Debit Memo Item         | `RevenueScheduleItemDebitMemoItem`         | | Revenue Schedule Item Invoice Item            | `RevenueScheduleItemInvoiceItem`           | | Revenue Schedule Item Invoice Item Adjustment | `RevenueScheduleItemInvoiceItemAdjustment` | | Subscription                                  | `Subscription`                             | | Taxable Item Snapshot                         | `TaxableItemSnapshot`                      | | Taxation Item                                 | `TaxationItem`                             | | Updater Batch                                 | `UpdaterBatch`                             | | Usage                                         | `Usage`                                    | 

OpenAPI spec version: 2018-02-27
Contact: docs@zuora.com
Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.0-SNAPSHOT

=end

require 'date'

module Zuora
  class ProxyGetRatePlanCharge
    # The accounting code for the charge. Accounting codes group transactions that contain similar accounting attributes.  **Character limit**: 100  **Values**: inherited from `ProductRatePlanCharge.AccountingCode`  **Note**: This value changes if `ProductRatePlanCharge.AccountingCode` is updated. The values of `UpdatedById` and `UpdatedDate` for the `RatePlanCharge` do not change when `ProductRatePlanCharge.AccountingCode` is updated. 
    attr_accessor :accounting_code

    #  Specifies the type of charges a specific discount applies to. **Character limit**: 21 **Values**: inherited from `ProductRatePlanCharge.ApplyDiscountTo` 
    attr_accessor :apply_discount_to

    #  Indicates the charge's billing cycle day (BCD), which is when bill runs generate invoices for charges associated with the product rate plan charge or the account. **Character limit**: 2 **Values**: inherited from `ProductRatePlanCharge.BillCycleDay` 
    attr_accessor :bill_cycle_day

    #  Specifies how to determine the billing day for the charge. **Character limit**: 20 **Values**: inherited from `ProductRatePlanCharge.BillCycleType` **Note:** You can override the value inherited from the Product Rate Plan Charge, but only when creating a new subscription or a New Product amendment. 
    attr_accessor :bill_cycle_type

    #  Allows billing period to be overridden on rate plan charge. ****Values**: **inherited from `ProductRatePlanCharge.BillingPeriod` **Note:** You can override the value inherited from the Product Rate Plan Charge, but only when creating a new subscription or a New Product amendment. 
    attr_accessor :billing_period

    #  Aligns charges within the same subscription if multiple charges begin on different dates. **Character limit**: 24 **Values**: inherited from `ProductRatePlanCharge.BillingPeriodAlignment` 
    attr_accessor :billing_period_alignment

    #  The billing timing for the charge. You can choose to bill in advance or in arrears for recurring charge types. This field is not used in one-time or usage based charge types. **Character limit**: **Values**: one of the following:  - `In Advance` - `In Arrears` **Note:** You can override the value inherited from the Product Rate Plan Charge when a subscription has a recurring charge type. This feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  
    attr_accessor :billing_timing

    #  Determines how to evaluate charges. Charge models must be individually activated in the web-based UI. **Character limit**: 29 **Values**: inherited from `ProductRatePlanCharge.ChargeModel` 
    attr_accessor :charge_model

    #  A unique number that identifies the charge. This number is returned as a string. **Character limit**: 50 **Values**: one of the following:  - automatically generated if left null - a unique number of 50 characters or fewer 
    attr_accessor :charge_number

    #  Specifies the type of charge. **Character limit**: 9 **Values**: inherited from `ProductRatePlanCharge.ChargeType` 
    attr_accessor :charge_type

    #  The date through which a customer has been billed for the charge. **Character limit**: 29 **Values**: automatically generated 
    attr_accessor :charged_through_date

    # The ID of the Zuora user who created the `RatePlanCharge` object. **Character limit**: 32 **Values**: automatically generated 
    attr_accessor :created_by_id

    #  The date when the `RatePlanCharge` object was created. **Character limit**: 29 **Values**: automatically generated 
    attr_accessor :created_date

    # A delta monthly recurring charge is the change in monthly recurring revenue caused by an amendment or a new subscription. **Character limit**: 16 **Values**: automatically generated 
    attr_accessor :dmrc

    #  After an Amendment, the change in the total contract value (TCV) amount for this charge, compared with its previous value. **Character limit**: 16 **Values**: automatically generated 
    attr_accessor :dtcv

    #  A description of the charge. **Character limit**: 500 **Values**: inherited from `ProductRatePlanCharge.Description` 
    attr_accessor :description

    # Specifies if the discount applies to just the product rate plan, the entire subscription, or to any activity in the account. **Character limit**: 12 **Values**: inherited from `ProductRatePlanCharge.DiscountLevel` 
    attr_accessor :discount_level

    #  The date when the segmented charge ends or ended. **Character limit**: 16 **Values**: automatically generated 
    attr_accessor :effective_end_date

    #  The date when the segmented charge starts or started. **Character limit**: 16 **Values**: automatically generated 
    attr_accessor :effective_start_date

    #  Defines when the charge ends after the charge trigger date. This field can be updated when **Status** is `Draft`. **Values**: one of the following:  - `SubscriptionEnd`: The charge ends on the subscription end date after the charge trigger date. This is the default value. - `FixedPeriod`: The charge ends after a specified period based on the trigger date of the charge. If you set this field to `FixedPeriod`, you must specify the length of the period and a period type by defining the `UpToPeriods` and `UpToPeriodsType` fields. - `SpecificEndDate`: The specific date on which the charge ends. If you set this field to `SpecificEndDate`, you must specify the specific date by defining the `SpecificEndDate` field.  **Note**: If the subscription ends before the charge end date, the charge ends when the subscription ends. But if the subscription end date is subsequently changed through a Renewal, or Terms and Conditions amendment, the charge will end on the charge end date. 
    attr_accessor :end_date_condition

    # Object identifier.
    attr_accessor :id

    # Indicates if the segment of the rate plan charge is the most recent segment. **Character limit**: 5 **Values**: automatically generated: `true`, `false` 
    attr_accessor :is_last_segment

    # The list price base for the product rate plan charge. **Values**: one of the following:  - `Per Month` - `Per Billing Period` - `Per Week` 
    attr_accessor :list_price_base

    # Monthly recurring revenue (MRR) is the amount of recurring charges in a given month. The MRR calculation doesn't include one-time charges nor usage charges. **Character limit**: 16 **Values**: automatically generated 
    attr_accessor :mrr

    # The name of the rate plan charge. **Character limit**: 100 **Values**: automatically generated 
    attr_accessor :name

    # Specifies the number of periods to use when calculating charges in an overage smoothing charge model. **Character limit**: 5 **Values**: inherited from `ProductRatePlanCharge.NumberOfPeriod` 
    attr_accessor :number_of_periods

    # The original ID of the rate plan charge. **Character limit**: 32 **Values**: automatically generated 
    attr_accessor :original_id

    # Determines when to calculate overage charges. If the value of the SmoothingMode field is null (not specified and not inherited from ProductRatePlanCharge.SmoothingMode), the value of this field is ignored. **Character limit**: 20 **Values**: inherited from `ProductRatePlanCharge.OverageCalculationOption` 
    attr_accessor :overage_calculation_option

    #  Determines whether to credit the customer with unused units of usage. **Character limit**: 20 **Values**: inherited from `ProductRatePlanCharge.OverageUnusedUnitsCreditOption` 
    attr_accessor :overage_unused_units_credit_option

    #  Applies an automatic price change when a termed subscription is renewed. **Character limit**: **Values**: one of the following:  - `NoChange` (default) - `SpecificPercentageValue` - `UseLatestProductCatalogPricing` 
    attr_accessor :price_change_option

    #  Specifies the percentage to increase or decrease the price of renewed subscriptions. **Character limit**: 16 **Values**: a decimal value between -100 and 100 
    attr_accessor :price_increase_percentage

    #  The date until when charges have been processed. When billing in arrears, such as usage, this field value is the the same as the `ChargedThroughDate` value. This date is the earliest date when a charge can be amended. **Character limit**: 29 **Values**: automatically generated 
    attr_accessor :processed_through_date

    #  The default quantity of units, such as the number of authors in a hosted wiki service. Valid for all charge models except for Flat Fee pricing. **Character limit**: 16 **Values**: a valid quantity value 
    attr_accessor :quantity

    #  The ID of the rate plan associated with the rate plan charge. **Character limit**: 32 **Values**: inherited from `RatePlan.Id` 
    attr_accessor :rate_plan_id

    #  Associates this product rate plan charge with a specific revenue recognition code.  **Character limit**: 70  **Values**: inherited from `ProductRatePlanCharge.RevRecCode` or a valid revenue recognition code  **Note**: Unless overridden, this value changes if `ProductRatePlanCharge.RevRecCode` is updated. The values of `UpdatedById` and `UpdatedDate` for the `RatePlanCharge` do not change when `ProductRatePlanCharge.RevRecCode` is updated. 
    attr_accessor :rev_rec_code

    #  Specifies when revenue recognition begins.  **Character limit**: 22  **Values**: inherited from `ProductRatePlanCharge.RevRecTriggerCondition` or one of the following:  -  `ContractEffectiveDate`  -  `ServiceActivationDate`  -  `CustomerAcceptanceDate`  Note: Unless overridden, this value changes if `ProductRatePlanCharge.RevRecTriggerCondition` is updated. The values of `UpdatedById` and `UpdatedDate` for the `RatePlanCharge` do not change when `ProductRatePlanCharge.RevRecTriggerCondition` is updated. 
    attr_accessor :rev_rec_trigger_condition

    #  Specifies the Revenue Recognition Rule that you want the Rate Plan Charge to use. This field can be updated when **Status** is `Draft`. By default, the Revenue Recognition Rule is inherited from the Product Rate Plan Charge. For Amend calls, you can use this field only for NewProduct amendments. For Update calls, you can use this field only to update subscriptions in draft status. Note that if you use this field to specify a Revenue Recognition Rule for the Rate Plan Charge, the rule will remain as specified even if you later change the rule used by the corresponding Product Rate Plan Charge.  **Character limit**: n/a  **Values**: inherited from `ProductRatePlanCharge.RevenueRecognitionRuleName` or the name of an active Revenue Recognition Rule  **Note**: Unless overridden, this value changes if `ProductRatePlanCharge.RevenueRecognitionRuleName` is updated. The values of `UpdatedById` and `UpdatedDate` for the `RatePlanCharge` do not change when `ProductRatePlanCharge.RevenueRecognitionRuleName` is updated. 
    attr_accessor :revenue_recognition_rule_name

    #  The identifying number of the subscription rate plan segment. Segments are numbered sequentially, starting with 1. **Character limit**: 2 **Values**: automatically generated 
    attr_accessor :segment

    #  Customizes the number of months or weeks for the charges billing period. This field is required if you set the value of the BillingPeriod field to `Specific Months` or `Specific Weeks`. **Character limit**: 5 **Values**: inherited from `ProductRatePlanCharge.BillingPeriod` **Note:** You can override the value inherited from the Product Rate Plan Charge, but only when creating a new subscription or a New Product amendment. 
    attr_accessor :specific_billing_period

    #  The specific date on which the charge ends, in `yyyy-mm-dd` format. **Character limit**: 29 **Note**:  - This field is only applicable when the `EndDateCondition` field is set to `SpecificEndDate`. - If the subscription ends before the specific end date, the charge ends when the subscription ends. But if the subscription end date is subsequently changed through a Renewal, or Terms and Conditions amendment, the charge will end on the specific end date. 
    attr_accessor :specific_end_date

    #  The total contract value (TCV) is the value of a single rate plan charge in a subscription over the lifetime of the subscription. This value does not represent all charges on the subscription. The TCV includes recurring charges and one-time charges, but it doesn't include usage charge. **Character limit**: 16 **Values**: automatically generated 
    attr_accessor :tcv

    #  The date when the charge becomes effective and billing begins, in `yyyy-mm-dd` format. This field is required if the `TriggerEvent` field value is `SpecificDate`. **Character limit**: 29 
    attr_accessor :trigger_date

    #  Specifies when to start billing the customer for the charge. **Note: **This field can be passed through the Subscribe and Amend calls and will override the default value set on the Product Rate Plan Charge. **Character limit**: 18 **Values**: inherited from `ProductRatePlanCharge.TriggerEvent` and can be one of the following values:  - `ContractEffective `is the date when the subscription's contract goes into effect and the charge is ready to be billed. - `ServiceActivationDate `is when the services or products for a subscription have been activated and the customers have access. - `CustomerAcceptance `is when the customer accepts the services or products for a subscription. - SpecificDate is valid only on the RatePlanCharge. 
    attr_accessor :trigger_event

    #  Specifies the units to measure usage. **Character limit**: 25 **Values**: inherited from `ProductRatePlanCharge.UOM` 
    attr_accessor :uom

    #  Specifies the length of the period during which the charge is active. If this period ends before the subscription ends, the charge ends when this period ends. **Character limit**: 5 **Values**: inherited from `ProductRatePlanCharge.UpToPeriods` **Note**:  - You must use this field together with the `UpToPeriodsType` field to specify the time period. This field is only applicable only when the `EndDateCondition` field is set to `FixedPeriod`. - You can override the value inherited from the Product Rate Plan Charge, but only when creating a new subscription or a New Product amendment. - Use this field to override the value in `ProductRatePlanCharge.UpToPeriod`. - If you override the value in this field, enter a whole number between 0 and 65535, exclusive. - If the subscription end date is subsequently changed through a Renewal, or Terms and Conditions amendment, the charge end date will change accordingly up to the original period end. 
    attr_accessor :up_to_periods

    #  The period type used to define when the charge ends. This field can be updated when **Status** is `Draft`. **Values**: one of the following:  - `Billing Periods` (default) - `Days` - `Weeks` - `Months` - `Years` **Note**:  - You must use this field together with the `UpToPeriods` field to specify the time period. - This field is only applicable only when the `EndDateCondition` field is set to `FixedPeriod`. 
    attr_accessor :up_to_periods_type

    # The ID of the last user to update the object. **Character limit**: 32 **Values**: automatically generated 
    attr_accessor :updated_by_id

    #  The date when the object was last updated. **Character limit**: 29 **Values**: automatically generated 
    attr_accessor :updated_date

    #  The version of the rate plan charge. Each time a charge is amended, Zuora creates a new version of the rate plan charge. **Character limit**: 5 **Values**: automatically generated 
    attr_accessor :version

    #  Specifies which day of the week as the bill cycle day (BCD) for the charge. This feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  **Values**: one of the following:  - `Sunday` - `Monday` - `Tuesday` - `Wednesday` - `Thursday` - `Friday` - `Saturday` 
    attr_accessor :weekly_bill_cycle_day

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'accounting_code' => :'AccountingCode',
        :'apply_discount_to' => :'ApplyDiscountTo',
        :'bill_cycle_day' => :'BillCycleDay',
        :'bill_cycle_type' => :'BillCycleType',
        :'billing_period' => :'BillingPeriod',
        :'billing_period_alignment' => :'BillingPeriodAlignment',
        :'billing_timing' => :'BillingTiming',
        :'charge_model' => :'ChargeModel',
        :'charge_number' => :'ChargeNumber',
        :'charge_type' => :'ChargeType',
        :'charged_through_date' => :'ChargedThroughDate',
        :'created_by_id' => :'CreatedById',
        :'created_date' => :'CreatedDate',
        :'dmrc' => :'DMRC',
        :'dtcv' => :'DTCV',
        :'description' => :'Description',
        :'discount_level' => :'DiscountLevel',
        :'effective_end_date' => :'EffectiveEndDate',
        :'effective_start_date' => :'EffectiveStartDate',
        :'end_date_condition' => :'EndDateCondition',
        :'id' => :'Id',
        :'is_last_segment' => :'IsLastSegment',
        :'list_price_base' => :'ListPriceBase',
        :'mrr' => :'MRR',
        :'name' => :'Name',
        :'number_of_periods' => :'NumberOfPeriods',
        :'original_id' => :'OriginalId',
        :'overage_calculation_option' => :'OverageCalculationOption',
        :'overage_unused_units_credit_option' => :'OverageUnusedUnitsCreditOption',
        :'price_change_option' => :'PriceChangeOption',
        :'price_increase_percentage' => :'PriceIncreasePercentage',
        :'processed_through_date' => :'ProcessedThroughDate',
        :'quantity' => :'Quantity',
        :'rate_plan_id' => :'RatePlanId',
        :'rev_rec_code' => :'RevRecCode',
        :'rev_rec_trigger_condition' => :'RevRecTriggerCondition',
        :'revenue_recognition_rule_name' => :'RevenueRecognitionRuleName',
        :'segment' => :'Segment',
        :'specific_billing_period' => :'SpecificBillingPeriod',
        :'specific_end_date' => :'SpecificEndDate',
        :'tcv' => :'TCV',
        :'trigger_date' => :'TriggerDate',
        :'trigger_event' => :'TriggerEvent',
        :'uom' => :'UOM',
        :'up_to_periods' => :'UpToPeriods',
        :'up_to_periods_type' => :'UpToPeriodsType',
        :'updated_by_id' => :'UpdatedById',
        :'updated_date' => :'UpdatedDate',
        :'version' => :'Version',
        :'weekly_bill_cycle_day' => :'WeeklyBillCycleDay'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'accounting_code' => :'String',
        :'apply_discount_to' => :'String',
        :'bill_cycle_day' => :'Integer',
        :'bill_cycle_type' => :'String',
        :'billing_period' => :'String',
        :'billing_period_alignment' => :'String',
        :'billing_timing' => :'String',
        :'charge_model' => :'String',
        :'charge_number' => :'String',
        :'charge_type' => :'String',
        :'charged_through_date' => :'Date',
        :'created_by_id' => :'String',
        :'created_date' => :'DateTime',
        :'dmrc' => :'Float',
        :'dtcv' => :'Float',
        :'description' => :'String',
        :'discount_level' => :'String',
        :'effective_end_date' => :'Date',
        :'effective_start_date' => :'Date',
        :'end_date_condition' => :'String',
        :'id' => :'String',
        :'is_last_segment' => :'BOOLEAN',
        :'list_price_base' => :'String',
        :'mrr' => :'Float',
        :'name' => :'String',
        :'number_of_periods' => :'Integer',
        :'original_id' => :'String',
        :'overage_calculation_option' => :'String',
        :'overage_unused_units_credit_option' => :'String',
        :'price_change_option' => :'String',
        :'price_increase_percentage' => :'Float',
        :'processed_through_date' => :'Date',
        :'quantity' => :'Float',
        :'rate_plan_id' => :'String',
        :'rev_rec_code' => :'String',
        :'rev_rec_trigger_condition' => :'String',
        :'revenue_recognition_rule_name' => :'String',
        :'segment' => :'Integer',
        :'specific_billing_period' => :'Integer',
        :'specific_end_date' => :'Date',
        :'tcv' => :'Float',
        :'trigger_date' => :'Date',
        :'trigger_event' => :'String',
        :'uom' => :'String',
        :'up_to_periods' => :'Integer',
        :'up_to_periods_type' => :'String',
        :'updated_by_id' => :'String',
        :'updated_date' => :'DateTime',
        :'version' => :'Integer',
        :'weekly_bill_cycle_day' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'AccountingCode')
        self.accounting_code = attributes[:'AccountingCode']
      end

      if attributes.has_key?(:'ApplyDiscountTo')
        self.apply_discount_to = attributes[:'ApplyDiscountTo']
      end

      if attributes.has_key?(:'BillCycleDay')
        self.bill_cycle_day = attributes[:'BillCycleDay']
      end

      if attributes.has_key?(:'BillCycleType')
        self.bill_cycle_type = attributes[:'BillCycleType']
      end

      if attributes.has_key?(:'BillingPeriod')
        self.billing_period = attributes[:'BillingPeriod']
      end

      if attributes.has_key?(:'BillingPeriodAlignment')
        self.billing_period_alignment = attributes[:'BillingPeriodAlignment']
      end

      if attributes.has_key?(:'BillingTiming')
        self.billing_timing = attributes[:'BillingTiming']
      end

      if attributes.has_key?(:'ChargeModel')
        self.charge_model = attributes[:'ChargeModel']
      end

      if attributes.has_key?(:'ChargeNumber')
        self.charge_number = attributes[:'ChargeNumber']
      end

      if attributes.has_key?(:'ChargeType')
        self.charge_type = attributes[:'ChargeType']
      end

      if attributes.has_key?(:'ChargedThroughDate')
        self.charged_through_date = attributes[:'ChargedThroughDate']
      end

      if attributes.has_key?(:'CreatedById')
        self.created_by_id = attributes[:'CreatedById']
      end

      if attributes.has_key?(:'CreatedDate')
        self.created_date = attributes[:'CreatedDate']
      end

      if attributes.has_key?(:'DMRC')
        self.dmrc = attributes[:'DMRC']
      end

      if attributes.has_key?(:'DTCV')
        self.dtcv = attributes[:'DTCV']
      end

      if attributes.has_key?(:'Description')
        self.description = attributes[:'Description']
      end

      if attributes.has_key?(:'DiscountLevel')
        self.discount_level = attributes[:'DiscountLevel']
      end

      if attributes.has_key?(:'EffectiveEndDate')
        self.effective_end_date = attributes[:'EffectiveEndDate']
      end

      if attributes.has_key?(:'EffectiveStartDate')
        self.effective_start_date = attributes[:'EffectiveStartDate']
      end

      if attributes.has_key?(:'EndDateCondition')
        self.end_date_condition = attributes[:'EndDateCondition']
      end

      if attributes.has_key?(:'Id')
        self.id = attributes[:'Id']
      end

      if attributes.has_key?(:'IsLastSegment')
        self.is_last_segment = attributes[:'IsLastSegment']
      end

      if attributes.has_key?(:'ListPriceBase')
        self.list_price_base = attributes[:'ListPriceBase']
      end

      if attributes.has_key?(:'MRR')
        self.mrr = attributes[:'MRR']
      end

      if attributes.has_key?(:'Name')
        self.name = attributes[:'Name']
      end

      if attributes.has_key?(:'NumberOfPeriods')
        self.number_of_periods = attributes[:'NumberOfPeriods']
      end

      if attributes.has_key?(:'OriginalId')
        self.original_id = attributes[:'OriginalId']
      end

      if attributes.has_key?(:'OverageCalculationOption')
        self.overage_calculation_option = attributes[:'OverageCalculationOption']
      end

      if attributes.has_key?(:'OverageUnusedUnitsCreditOption')
        self.overage_unused_units_credit_option = attributes[:'OverageUnusedUnitsCreditOption']
      end

      if attributes.has_key?(:'PriceChangeOption')
        self.price_change_option = attributes[:'PriceChangeOption']
      end

      if attributes.has_key?(:'PriceIncreasePercentage')
        self.price_increase_percentage = attributes[:'PriceIncreasePercentage']
      end

      if attributes.has_key?(:'ProcessedThroughDate')
        self.processed_through_date = attributes[:'ProcessedThroughDate']
      end

      if attributes.has_key?(:'Quantity')
        self.quantity = attributes[:'Quantity']
      end

      if attributes.has_key?(:'RatePlanId')
        self.rate_plan_id = attributes[:'RatePlanId']
      end

      if attributes.has_key?(:'RevRecCode')
        self.rev_rec_code = attributes[:'RevRecCode']
      end

      if attributes.has_key?(:'RevRecTriggerCondition')
        self.rev_rec_trigger_condition = attributes[:'RevRecTriggerCondition']
      end

      if attributes.has_key?(:'RevenueRecognitionRuleName')
        self.revenue_recognition_rule_name = attributes[:'RevenueRecognitionRuleName']
      end

      if attributes.has_key?(:'Segment')
        self.segment = attributes[:'Segment']
      end

      if attributes.has_key?(:'SpecificBillingPeriod')
        self.specific_billing_period = attributes[:'SpecificBillingPeriod']
      end

      if attributes.has_key?(:'SpecificEndDate')
        self.specific_end_date = attributes[:'SpecificEndDate']
      end

      if attributes.has_key?(:'TCV')
        self.tcv = attributes[:'TCV']
      end

      if attributes.has_key?(:'TriggerDate')
        self.trigger_date = attributes[:'TriggerDate']
      end

      if attributes.has_key?(:'TriggerEvent')
        self.trigger_event = attributes[:'TriggerEvent']
      end

      if attributes.has_key?(:'UOM')
        self.uom = attributes[:'UOM']
      end

      if attributes.has_key?(:'UpToPeriods')
        self.up_to_periods = attributes[:'UpToPeriods']
      end

      if attributes.has_key?(:'UpToPeriodsType')
        self.up_to_periods_type = attributes[:'UpToPeriodsType']
      end

      if attributes.has_key?(:'UpdatedById')
        self.updated_by_id = attributes[:'UpdatedById']
      end

      if attributes.has_key?(:'UpdatedDate')
        self.updated_date = attributes[:'UpdatedDate']
      end

      if attributes.has_key?(:'Version')
        self.version = attributes[:'Version']
      end

      if attributes.has_key?(:'WeeklyBillCycleDay')
        self.weekly_bill_cycle_day = attributes[:'WeeklyBillCycleDay']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          accounting_code == o.accounting_code &&
          apply_discount_to == o.apply_discount_to &&
          bill_cycle_day == o.bill_cycle_day &&
          bill_cycle_type == o.bill_cycle_type &&
          billing_period == o.billing_period &&
          billing_period_alignment == o.billing_period_alignment &&
          billing_timing == o.billing_timing &&
          charge_model == o.charge_model &&
          charge_number == o.charge_number &&
          charge_type == o.charge_type &&
          charged_through_date == o.charged_through_date &&
          created_by_id == o.created_by_id &&
          created_date == o.created_date &&
          dmrc == o.dmrc &&
          dtcv == o.dtcv &&
          description == o.description &&
          discount_level == o.discount_level &&
          effective_end_date == o.effective_end_date &&
          effective_start_date == o.effective_start_date &&
          end_date_condition == o.end_date_condition &&
          id == o.id &&
          is_last_segment == o.is_last_segment &&
          list_price_base == o.list_price_base &&
          mrr == o.mrr &&
          name == o.name &&
          number_of_periods == o.number_of_periods &&
          original_id == o.original_id &&
          overage_calculation_option == o.overage_calculation_option &&
          overage_unused_units_credit_option == o.overage_unused_units_credit_option &&
          price_change_option == o.price_change_option &&
          price_increase_percentage == o.price_increase_percentage &&
          processed_through_date == o.processed_through_date &&
          quantity == o.quantity &&
          rate_plan_id == o.rate_plan_id &&
          rev_rec_code == o.rev_rec_code &&
          rev_rec_trigger_condition == o.rev_rec_trigger_condition &&
          revenue_recognition_rule_name == o.revenue_recognition_rule_name &&
          segment == o.segment &&
          specific_billing_period == o.specific_billing_period &&
          specific_end_date == o.specific_end_date &&
          tcv == o.tcv &&
          trigger_date == o.trigger_date &&
          trigger_event == o.trigger_event &&
          uom == o.uom &&
          up_to_periods == o.up_to_periods &&
          up_to_periods_type == o.up_to_periods_type &&
          updated_by_id == o.updated_by_id &&
          updated_date == o.updated_date &&
          version == o.version &&
          weekly_bill_cycle_day == o.weekly_bill_cycle_day
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [accounting_code, apply_discount_to, bill_cycle_day, bill_cycle_type, billing_period, billing_period_alignment, billing_timing, charge_model, charge_number, charge_type, charged_through_date, created_by_id, created_date, dmrc, dtcv, description, discount_level, effective_end_date, effective_start_date, end_date_condition, id, is_last_segment, list_price_base, mrr, name, number_of_periods, original_id, overage_calculation_option, overage_unused_units_credit_option, price_change_option, price_increase_percentage, processed_through_date, quantity, rate_plan_id, rev_rec_code, rev_rec_trigger_condition, revenue_recognition_rule_name, segment, specific_billing_period, specific_end_date, tcv, trigger_date, trigger_event, uom, up_to_periods, up_to_periods_type, updated_by_id, updated_date, version, weekly_bill_cycle_day].hash
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
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
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
        temp_model = Zuora.const_get(type).new
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
        value.compact.map { |v| _to_hash(v) }
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
