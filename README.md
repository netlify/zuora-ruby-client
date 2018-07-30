# zuora

Zuora - the Ruby gem for the Zuora API Reference

  # Introduction Welcome to the reference for the Zuora REST API!  <a href=\"http://en.wikipedia.org/wiki/REST_API\" target=\"_blank\">REST</a> is a web-service protocol that lends itself to rapid development by using everyday HTTP and JSON technology.  The Zuora REST API provides a broad set of operations and resources that:    * Enable Web Storefront integration from your website.   * Support self-service subscriber sign-ups and account management.   * Process revenue schedules through custom revenue rule models.   * Enable manipulation of most objects in the Zuora Object Model.  Want to share your opinion on how our API works for you? <a href=\"https://community.zuora.com/t5/Developers/API-Feedback-Form/gpm-p/21399\" target=\"_blank\">Tell us how you feel </a>about using our API and what we can do to make it better.    ## Endpoints      The Zuora REST API is provided via the following endpoints.   | Tenant              | Base URL for REST Endpoints |   |-------------------------|-------------------------|   |US Production | https://rest.zuora.com   |   |US API Sandbox    | https://rest.apisandbox.zuora.com|   |US Performance Test | https://rest.pt1.zuora.com |   |EU Production | https://rest.eu.zuora.com |   |EU Sandbox | https://rest.sandbox.eu.zuora.com |      The production endpoint provides access to your live user data. The API Sandbox tenant is a good place to test your code without affecting real-world data. To use it, you must be provisioned with an API Sandbox tenant - your Zuora representative can help you if needed.      ## Access to the API      If you have a Zuora tenant, you already have access to the API.      If you don't have a Zuora tenant, go to <a href=\" https://www.zuora.com/resource/zuora-test-drive\" target=\"_blank\">https://www.zuora.com/resource/zuora-test-drive</a> and sign up for a Production Test Drive tenant. The tenant comes with seed data, such as a sample product catalog.  We recommend that you <a href=\"https://knowledgecenter.zuora.com/CF_Users_and_Administrators/A_Administrator_Settings/Manage_Users/Create_an_API_User\" target=\"_blank\">create an API user</a> specifically for making API calls. Don't log in to the Zuora UI with this account. Logging in to the UI enables a security feature that periodically expires the account's password, which may eventually cause authentication failures with the API. Note that a user role does not have write access to Zuora REST services unless it has the API Write Access permission as described in those instructions.   # API Changelog You can find the <a href=\"https://community.zuora.com/t5/Developers/API-Changelog/gpm-p/18092\" target=\"_blank\">Changelog</a> of the API Reference in the Zuora Community.   # Authentication  ## OAuth v2.0  Zuora recommends that you use OAuth v2.0 to authenticate to the Zuora REST API. Currently, OAuth is not available in every environment. See [Zuora Testing Environments](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/D_Zuora_Environments) for more information.  Zuora recommends you to create a dedicated API user with API write access on a tenant when authenticating via OAuth, and then create an OAuth client for this user. By doing this, you can control permissions of the API user without affecting other non-API users. Note that if a user is deactivated, all his OAuth clients will be automatically deactivated.  Authenticating via OAuth requires the following steps: 1. Create a Client 2. Generate a Token 3. Make Authenticated Requests  ### Create a Client  You must first [create an OAuth client](https://knowledgecenter.zuora.com/CF_Users_and_Administrators/A_Administrator_Settings/Manage_Users#Create_an_OAuth_Client_for_a_User) in the Zuora UI. To do this, you must be an administrator of your Zuora tenant. This is a one-time operation. You will be provided with a Client ID and a Client Secret. Please note this information down, as it will be required for the next step.  **Note:** The OAuth client will be owned by a Zuora user account. If you want to perform PUT, POST, or DELETE operations using the OAuth client, the owner of the OAuth client must have a Platform role that includes the \"API Write Access\" permission.  ### Generate a Token  After creating a client, you must make a call to obtain a bearer token using the [Generate an OAuth token](https://www.zuora.com/developer/api-reference/#operation/createToken) operation. This operation requires the following parameters: - `client_id` - the Client ID displayed when you created the OAuth client in the previous step - `client_secret` - the Client Secret displayed when you created the OAuth client in the previous step - `grant_type` - must be set to `client_credentials`  **Note**: The Client ID and Client Secret mentioned above were displayed when you created the OAuth Client in the prior step. The [Generate an OAuth token](https://www.zuora.com/developer/api-reference/#operation/createToken) response specifies how long the bearer token is valid for. Call [Generate an OAuth token](https://www.zuora.com/developer/api-reference/#operation/createToken) again to generate a new bearer token.  ### Make Authenticated Requests  To authenticate subsequent API requests, you must provide a valid bearer token in an HTTP header:  `Authorization: Bearer {bearer_token}`  If you have [Zuora Multi-entity](https://www.zuora.com/developer/api-reference/#tag/Entities) enabled, you need to set an additional header to specify the ID of the entity that you want to access. You can use the `scope` field in the [Generate an OAuth token](https://www.zuora.com/developer/api-reference/#operation/createToken) response to determine whether you need to specify an entity ID.  If the `scope` field contains more than one entity ID, you must specify the ID of the entity that you want to access. For example, if the `scope` field contains `entity.1a2b7a37-3e7d-4cb3-b0e2-883de9e766cc` and `entity.c92ed977-510c-4c48-9b51-8d5e848671e9`, specify one of the following headers: - `Zuora-Entity-Ids: 1a2b7a37-3e7d-4cb3-b0e2-883de9e766cc` - `Zuora-Entity-Ids: c92ed977-510c-4c48-9b51-8d5e848671e9`  **Note**: For a limited period of time, Zuora will accept the `entityId` header as an alternative to the `Zuora-Entity-Ids` header. If you choose to set the `entityId` header, you must remove all \"-\" characters from the entity ID in the `scope` field.  If the `scope` field contains a single entity ID, you do not need to specify an entity ID.   ## Other Supported Authentication Schemes  Zuora continues to support the following additional legacy means of authentication:    * Use username and password. Include authentication with each request in the header:         * `apiAccessKeyId`      * `apiSecretAccessKey`    * Use an authorization cookie. The cookie authorizes the user to make calls to the REST API for the duration specified in  **Administration > Security Policies > Session timeout**. The cookie expiration time is reset with this duration after every call to the REST API. To obtain a cookie, call the [Connections](https://www.zuora.com/developer/api-reference/#tag/Connections) resource with the following API user information:         *   ID         *   password        * For CORS-enabled APIs only: Include a 'single-use' token in the request header, which re-authenticates the user with each request. See below for more details.  ### Entity Id and Entity Name  The `entityId` and `entityName` parameters are only used for [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity \"Zuora Multi-entity\"). These are the legacy parameters that Zuora will only continue to support for a period of time. Zuora recommends you to use the `Zuora-Entity-Ids` parameter instead.   The  `entityId` and `entityName` parameters specify the Id and the [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name \"Introduction to Entity and Entity Hierarchy\") that you want to access, respectively. Note that you must have permission to access the entity.   You can specify either the `entityId` or `entityName` parameter in the authentication to access and view an entity.    * If both `entityId` and `entityName` are specified in the authentication, an error occurs.    * If neither `entityId` nor `entityName` is specified in the authentication, you will log in to the entity in which your user account is created.      To get the entity Id and entity name, you can use the GET Entities REST call. For more information, see [API User Authentication](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/A_Overview_of_Multi-entity#API_User_Authentication \"API User Authentication\").      ### Token Authentication for CORS-Enabled APIs      The CORS mechanism enables REST API calls to Zuora to be made directly from your customer's browser, with all credit card and security information transmitted directly to Zuora. This minimizes your PCI compliance burden, allows you to implement advanced validation on your payment forms, and  makes your payment forms look just like any other part of your website.    For security reasons, instead of using cookies, an API request via CORS uses **tokens** for authentication.  The token method of authentication is only designed for use with requests that must originate from your customer's browser; **it should  not be considered a replacement to the existing cookie authentication** mechanism.  See [Zuora CORS REST](https://knowledgecenter.zuora.com/DC_Developers/REST_API/A_REST_basics/G_CORS_REST \"Zuora CORS REST\") for details on how CORS works and how you can begin to implement customer calls to the Zuora REST APIs. See  [HMAC Signatures](https://www.zuora.com/developer/api-reference/#operation/POSTHMACSignature \"HMAC Signatures\") for details on the HMAC method that returns the authentication token.  # Requests and Responses  ## Request IDs  As a general rule, when asked to supply a \"key\" for an account or subscription (accountKey, account-key, subscriptionKey, subscription-key), you can provide either the actual ID or  the number of the entity.  ## HTTP Request Body  Most of the parameters and data accompanying your requests will be contained in the body of the HTTP request.   The Zuora REST API accepts JSON in the HTTP request body. No other data format (e.g., XML) is supported.  ### Data Type  ([Actions](https://www.zuora.com/developer/api-reference/#tag/Actions) and CRUD operations only) We recommend that you do not specify the decimal values with quotation marks, commas, and spaces. Use characters of `+-0-9.eE`, for example, `5`, `1.9`, `-8.469`, and `7.7e2`. Also, Zuora does not convert currencies for decimal values.  ## Testing a Request  Use a third party client, such as [curl](https://curl.haxx.se \"curl\"), [Postman](https://www.getpostman.com \"Postman\"), or [Advanced REST Client](https://advancedrestclient.com \"Advanced REST Client\"), to test the Zuora REST API.  You can test the Zuora REST API from the Zuora API Sandbox or Production tenants. If connecting to Production, bear in mind that you are working with your live production data, not sample data or test data.  ## Testing with Credit Cards  Sooner or later it will probably be necessary to test some transactions that involve credit cards. For suggestions on how to handle this, see [Going Live With Your Payment Gateway](https://knowledgecenter.zuora.com/CB_Billing/M_Payment_Gateways/C_Managing_Payment_Gateways/B_Going_Live_Payment_Gateways#Testing_with_Credit_Cards \"C_Zuora_User_Guides/A_Billing_and_Payments/M_Payment_Gateways/C_Managing_Payment_Gateways/B_Going_Live_Payment_Gateways#Testing_with_Credit_Cards\" ).  ## Concurrent Request Limits  Zuora enforces tenant-level concurrent request limits. See <a href=\"https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Policies/Concurrent_Request_Limits\" target=\"_blank\">Concurrent Request Limits</a> for more information.    ## Error Handling  Responses and error codes are detailed in [Responses and errors](https://knowledgecenter.zuora.com/DC_Developers/REST_API/A_REST_basics/3_Responses_and_errors \"Responses and errors\").  # Pagination  When retrieving information (using GET methods), the optional `pageSize` query parameter sets the maximum number of rows to return in a response. The maximum is `40`; larger values are treated as `40`. If this value is empty or invalid, `pageSize` typically defaults to `10`.  The default value for the maximum number of rows retrieved can be overridden at the method level.  If more rows are available, the response will include a `nextPage` element, which contains a URL for requesting the next page.  If this value is not provided, no more rows are available. No \"previous page\" element is explicitly provided; to support backward paging, use the previous call.  ## Array Size  For data items that are not paginated, the REST API supports arrays of up to 300 rows.  Thus, for instance, repeated pagination can retrieve thousands of customer accounts, but within any account an array of no more than 300 rate plans is returned.  # API Versions  The Zuora REST API are version controlled. Versioning ensures that Zuora REST API changes are backward compatible. Zuora uses a major and minor version nomenclature to manage changes. By specifying a version in a REST request, you can get expected responses regardless of future changes to the API.  ## Major Version  The major version number of the REST API appears in the REST URL. Currently, Zuora only supports the **v1** major version. For example, `POST https://rest.zuora.com/v1/subscriptions`.  ## Minor Version  Zuora uses minor versions for the REST API to control small changes. For example, a field in a REST method is deprecated and a new field is used to replace it.   Some fields in the REST methods are supported as of minor versions. If a field is not noted with a minor version, this field is available for all minor versions. If a field is noted with a minor version, this field is in version control. You must specify the supported minor version in the request header to process without an error.   If a field is in version control, it is either with a minimum minor version or a maximum minor version, or both of them. You can only use this field with the minor version between the minimum and the maximum minor versions. For example, the `invoiceCollect` field in the POST Subscription method is in version control and its maximum minor version is 189.0. You can only use this field with the minor version 189.0 or earlier.  If you specify a version number in the request header that is not supported, Zuora will use the minimum minor version of the REST API. In our REST API documentation, if a field or feature requires a minor version number, we note that in the field description.  You only need to specify the version number when you use the fields require a minor version. To specify the minor version, set the `zuora-version` parameter to the minor version number in the request header for the request call. For example, the `collect` field is in 196.0 minor version. If you want to use this field for the POST Subscription method, set the  `zuora-version` parameter to `196.0` in the request header. The `zuora-version` parameter is case sensitive.  For all the REST API fields, by default, if the minor version is not specified in the request header, Zuora will use the minimum minor version of the REST API to avoid breaking your integration.   ### Minor Version History  The supported minor versions are not serial. This section documents the changes made to each Zuora REST API minor version.  The following table lists the supported versions and the fields that have a Zuora REST API minor version.  | Fields         | Minor Version      | REST Methods    | Description | |:--------|:--------|:--------|:--------| | invoiceCollect | 189.0 and earlier  | [Create Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_Subscription \"Create Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\"); [Renew Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_RenewSubscription \"Renew Subscription\"); [Cancel Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_CancelSubscription \"Cancel Subscription\"); [Suspend Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_SuspendSubscription \"Suspend Subscription\"); [Resume Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_ResumeSubscription \"Resume Subscription\"); [Create Account](https://www.zuora.com/developer/api-reference/#operation/POST_Account \"Create Account\")|Generates an invoice and collects a payment for a subscription. | | collect        | 196.0 and later    | [Create Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_Subscription \"Create Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\"); [Renew Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_RenewSubscription \"Renew Subscription\"); [Cancel Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_CancelSubscription \"Cancel Subscription\"); [Suspend Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_SuspendSubscription \"Suspend Subscription\"); [Resume Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_ResumeSubscription \"Resume Subscription\"); [Create Account](https://www.zuora.com/developer/api-reference/#operation/POST_Account \"Create Account\")|Collects an automatic payment for a subscription. | | invoice | 196.0 and 207.0| [Create Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_Subscription \"Create Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\"); [Renew Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_RenewSubscription \"Renew Subscription\"); [Cancel Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_CancelSubscription \"Cancel Subscription\"); [Suspend Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_SuspendSubscription \"Suspend Subscription\"); [Resume Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_ResumeSubscription \"Resume Subscription\"); [Create Account](https://www.zuora.com/developer/api-reference/#operation/POST_Account \"Create Account\")|Generates an invoice for a subscription. | | invoiceTargetDate | 196.0 and earlier  | [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview \"Preview Subscription\") |Date through which charges are calculated on the invoice, as `yyyy-mm-dd`. | | invoiceTargetDate | 207.0 and earlier  | [Create Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_Subscription \"Create Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\"); [Renew Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_RenewSubscription \"Renew Subscription\"); [Cancel Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_CancelSubscription \"Cancel Subscription\"); [Suspend Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_SuspendSubscription \"Suspend Subscription\"); [Resume Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_ResumeSubscription \"Resume Subscription\"); [Create Account](https://www.zuora.com/developer/api-reference/#operation/POST_Account \"Create Account\")|Date through which charges are calculated on the invoice, as `yyyy-mm-dd`. | | targetDate | 207.0 and later | [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview \"Preview Subscription\") |Date through which charges are calculated on the invoice, as `yyyy-mm-dd`. | | targetDate | 211.0 and later | [Create Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_Subscription \"Create Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\"); [Renew Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_RenewSubscription \"Renew Subscription\"); [Cancel Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_CancelSubscription \"Cancel Subscription\"); [Suspend Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_SuspendSubscription \"Suspend Subscription\"); [Resume Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_ResumeSubscription \"Resume Subscription\"); [Create Account](https://www.zuora.com/developer/api-reference/#operation/POST_Account \"Create Account\")|Date through which charges are calculated on the invoice, as `yyyy-mm-dd`. | | includeExisting DraftInvoiceItems | 196.0 and earlier| [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview \"Preview Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\") | Specifies whether to include draft invoice items in subscription previews. Specify it to be `true` (default) to include draft invoice items in the preview result. Specify it to be `false` to excludes draft invoice items in the preview result. | | includeExisting DraftDocItems | 207.0 and later  | [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview \"Preview Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\") | Specifies whether to include draft invoice items in subscription previews. Specify it to be `true` (default) to include draft invoice items in the preview result. Specify it to be `false` to excludes draft invoice items in the preview result. | | previewType | 196.0 and earlier| [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview \"Preview Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\") | The type of preview you will receive. The possible values are `InvoiceItem`(default), `ChargeMetrics`, and `InvoiceItemChargeMetrics`. | | previewType | 207.0 and later  | [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview \"Preview Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\") | The type of preview you will receive. The possible values are `LegalDoc`(default), `ChargeMetrics`, and `LegalDocChargeMetrics`. | | runBilling  | 211.0 and later  | [Create Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_Subscription \"Create Subscription\"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\"); [Renew Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_RenewSubscription \"Renew Subscription\"); [Cancel Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_CancelSubscription \"Cancel Subscription\"); [Suspend Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_SuspendSubscription \"Suspend Subscription\"); [Resume Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_ResumeSubscription \"Resume Subscription\"); [Create Account](https://www.zuora.com/developer/api-reference/#operation/POST_Account \"Create Account\")|Generates an invoice or credit memo for a subscription. **Note:** Credit memos are only available if you have the Advanced AR Settlement feature enabled. | | invoiceDate | 214.0 and earlier  | [Invoice and Collect](https://www.zuora.com/developer/api-reference/#operation/POST_TransactionInvoicePayment \"Invoice and Collect\") |Date that should appear on the invoice being generated, as `yyyy-mm-dd`. | | invoiceTargetDate | 214.0 and earlier  | [Invoice and Collect](https://www.zuora.com/developer/api-reference/#operation/POST_TransactionInvoicePayment \"Invoice and Collect\") |Date through which to calculate charges on this account if an invoice is generated, as `yyyy-mm-dd`. | | documentDate | 215.0 and later | [Invoice and Collect](https://www.zuora.com/developer/api-reference/#operation/POST_TransactionInvoicePayment \"Invoice and Collect\") |Date that should appear on the invoice and credit memo being generated, as `yyyy-mm-dd`. | | targetDate | 215.0 and later | [Invoice and Collect](https://www.zuora.com/developer/api-reference/#operation/POST_TransactionInvoicePayment \"Invoice and Collect\") |Date through which to calculate charges on this account if an invoice or a credit memo is generated, as `yyyy-mm-dd`. |  #### Version 207.0 and Later  The response structure of the [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview \"Preview Subscription\") and [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription \"Update Subscription\") methods are changed. The following invoice related response fields are moved to the invoice container:    * amount   * amountWithoutTax   * taxAmount   * invoiceItems   * targetDate   * chargeMetrics  # Zuora Object Model  The following diagram presents a high-level view of the key Zuora objects. Click the image to open it in a new tab to resize it.  <a href=\"https://www.zuora.com/wp-content/uploads/2017/01/ZuoraERD.jpeg\" target=\"_blank\"><img src=\"https://www.zuora.com/wp-content/uploads/2017/01/ZuoraERD.jpeg\" alt=\"Zuora Object Model Diagram\"></a>  You can use the [Describe object](https://www.zuora.com/developer/api-reference/#operation/GET_Describe) operation to list the fields of each Zuora object that is available in your tenant. When you call the operation, you must specify the API name of the Zuora object.  The following table provides the API name of each Zuora object:  | Object                                        | API Name                                   | |-----------------------------------------------|--------------------------------------------| | Account                                       | `Account`                                  | | Accounting Code                               | `AccountingCode`                           | | Accounting Period                             | `AccountingPeriod`                         | | Amendment                                     | `Amendment`                                | | Application Group                             | `ApplicationGroup`                         | | Billing Run                                   | `BillRun`                               | | Contact                                       | `Contact`                                  | | Contact Snapshot                              | `ContactSnapshot`                          | | Credit Balance Adjustment                     | `CreditBalanceAdjustment`                  | | Credit Memo                                   | `CreditMemo`                               | | Credit Memo Application                       | `CreditMemoApplication`                    | | Credit Memo Application Item                  | `CreditMemoApplicationItem`                | | Credit Memo Item                              | `CreditMemoItem`                           | | Credit Memo Part                              | `CreditMemoPart`                           | | Credit Memo Part Item                         | `CreditMemoPartItem`                       | | Credit Taxation Item                          | `CreditTaxationItem`                       | | Custom Exchange Rate                          | `FXCustomRate`                             | | Debit Memo                                    | `DebitMemo`                                | | Debit Memo Item                               | `DebitMemoItem`                            | | Debit Taxation Item                           | `DebitTaxationItem`                        | | Discount Applied Metrics                      | `DiscountAppliedMetrics`                   | | Entity                                        | `Tenant`                                   | | Gateway Reconciliation Event                  | `PaymentGatewayReconciliationEventLog`     | | Gateway Reconciliation Job                    | `PaymentReconciliationJob`                 | | Gateway Reconciliation Log                    | `PaymentReconciliationLog`                 | | Invoice                                       | `Invoice`                                  | | Invoice Adjustment                            | `InvoiceAdjustment`                        | | Invoice Item                                  | `InvoiceItem`                              | | Invoice Item Adjustment                       | `InvoiceItemAdjustment`                    | | Invoice Payment                               | `InvoicePayment`                           | | Journal Entry                                 | `JournalEntry`                             | | Journal Entry Item                            | `JournalEntryItem`                         | | Journal Run                                   | `JournalRun`                               | | Order                                         | `Order`                                    | | Order Action                                  | `OrderAction`                              | | Order MRR                                     | `OrderMrr`                                 | | Order Quantity                                | `OrderQuantity`                            | | Order TCB                                     | `OrderTcb`                                 | | Order TCV                                     | `OrderTcv`                                 | | Payment                                       | `Payment`                                  | | Payment Application                           | `PaymentApplication`                       | | Payment Application Item                      | `PaymentApplicationItem`                   | | Payment Method                                | `PaymentMethod`                            | | Payment Method Snapshot                       | `PaymentMethodSnapshot`                    | | Payment Method Transaction Log                | `PaymentMethodTransactionLog`              | | Payment Method Update                         | `UpdaterDetail`                            | | Payment Part                                  | `PaymentPart`                              | | Payment Part Item                             | `PaymentPartItem`                          | | Payment Run                                   | `PaymentRun`                               | | Payment Transaction Log                       | `PaymentTransactionLog`                    | | Processed Usage                               | `ProcessedUsage`                           | | Product                                       | `Product`                                  | | Product Rate Plan                             | `ProductRatePlan`                          | | Product Rate Plan Charge                      | `ProductRatePlanCharge`                    | | Product Rate Plan Charge Tier                 | `ProductRatePlanChargeTier`                | | Rate Plan                                     | `RatePlan`                                 | | Rate Plan Charge                              | `RatePlanCharge`                           | | Rate Plan Charge Tier                         | `RatePlanChargeTier`                       | | Refund                                        | `Refund`                                   | | Refund Application                            | `RefundApplication`                        | | Refund Application Item                       | `RefundApplicationItem`                    | | Refund Invoice Payment                        | `RefundInvoicePayment`                     | | Refund Part                                   | `RefundPart`                               | | Refund Part Item                              | `RefundPartItem`                           | | Refund Transaction Log                        | `RefundTransactionLog`                     | | Revenue Charge Summary                        | `RevenueChargeSummary`                     | | Revenue Charge Summary Item                   | `RevenueChargeSummaryItem`                 | | Revenue Event                                 | `RevenueEvent`                             | | Revenue Event Credit Memo Item                | `RevenueEventCreditMemoItem`               | | Revenue Event Debit Memo Item                 | `RevenueEventDebitMemoItem`                | | Revenue Event Invoice Item                    | `RevenueEventInvoiceItem`                  | | Revenue Event Invoice Item Adjustment         | `RevenueEventInvoiceItemAdjustment`        | | Revenue Event Item                            | `RevenueEventItem`                         | | Revenue Event Item Credit Memo Item           | `RevenueEventItemCreditMemoItem`           | | Revenue Event Item Debit Memo Item            | `RevenueEventItemDebitMemoItem`            | | Revenue Event Item Invoice Item               | `RevenueEventItemInvoiceItem`              | | Revenue Event Item Invoice Item Adjustment    | `RevenueEventItemInvoiceItemAdjustment`    | | Revenue Event Type                            | `RevenueEventType`                         | | Revenue Schedule                              | `RevenueSchedule`                          | | Revenue Schedule Credit Memo Item             | `RevenueScheduleCreditMemoItem`            | | Revenue Schedule Debit Memo Item              | `RevenueScheduleDebitMemoItem`             | | Revenue Schedule Invoice Item                 | `RevenueScheduleInvoiceItem`               | | Revenue Schedule Invoice Item Adjustment      | `RevenueScheduleInvoiceItemAdjustment`     | | Revenue Schedule Item                         | `RevenueScheduleItem`                      | | Revenue Schedule Item Credit Memo Item        | `RevenueScheduleItemCreditMemoItem`        | | Revenue Schedule Item Debit Memo Item         | `RevenueScheduleItemDebitMemoItem`         | | Revenue Schedule Item Invoice Item            | `RevenueScheduleItemInvoiceItem`           | | Revenue Schedule Item Invoice Item Adjustment | `RevenueScheduleItemInvoiceItemAdjustment` | | Subscription                                  | `Subscription`                             | | Taxable Item Snapshot                         | `TaxableItemSnapshot`                      | | Taxation Item                                 | `TaxationItem`                             | | Updater Batch                                 | `UpdaterBatch`                             | | Usage                                         | `Usage`                                    | 

This SDK is automatically generated by the [Swagger Codegen](https://github.com/swagger-api/swagger-codegen) project:

- API version: 2018-02-27
- Package version: 1.0.0
- Build package: io.swagger.codegen.languages.RubyClientCodegen

## Installation

### Build a gem

To build the Ruby code into a gem:

```shell
gem build zuora.gemspec
```

Then either install the gem locally:

```shell
gem install ./zuora-1.0.0.gem
```
(for development, run `gem install --dev ./zuora-1.0.0.gem` to install the development dependencies)

or publish the gem to a gem hosting service, e.g. [RubyGems](https://rubygems.org/).

Finally add this to the Gemfile:

    gem 'zuora', '~> 1.0.0'

### Install from Git

If the Ruby gem is hosted at a git repository: https://github.com/GIT_USER_ID/GIT_REPO_ID, then add the following in the Gemfile:

    gem 'zuora', :git => 'https://github.com/GIT_USER_ID/GIT_REPO_ID.git'

### Include the Ruby code directly

Include the Ruby code directly using `-I` as follows:

```shell
ruby -Ilib script.rb
```

## Getting Started

Please follow the [installation](#installation) procedure and then run the following code:
```ruby
# Load the gem
require 'zuora'

api_instance = Zuora::AccountingCodesApi.new

ac_id = 'ac_id_example' # String | ID of the accounting code you want to delete.

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Delete accounting code
  result = api_instance.d_elete_accounting_code(ac_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling AccountingCodesApi->d_elete_accounting_code: #{e}"
end

```

## Documentation for API Endpoints

All URIs are relative to *https://rest.zuora.com*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*Zuora::AccountingCodesApi* | [**d_elete_accounting_code**](docs/AccountingCodesApi.md#d_elete_accounting_code) | **DELETE** /v1/accounting-codes/{ac-id} | Delete accounting code
*Zuora::AccountingCodesApi* | [**g_et_accounting_code**](docs/AccountingCodesApi.md#g_et_accounting_code) | **GET** /v1/accounting-codes/{ac-id} | Query an accounting code
*Zuora::AccountingCodesApi* | [**g_et_all_accounting_codes**](docs/AccountingCodesApi.md#g_et_all_accounting_codes) | **GET** /v1/accounting-codes | Get all accounting codes
*Zuora::AccountingCodesApi* | [**p_ost_accounting_code**](docs/AccountingCodesApi.md#p_ost_accounting_code) | **POST** /v1/accounting-codes | Create accounting code
*Zuora::AccountingCodesApi* | [**p_ut_accounting_code**](docs/AccountingCodesApi.md#p_ut_accounting_code) | **PUT** /v1/accounting-codes/{ac-id} | Update an accounting code
*Zuora::AccountingCodesApi* | [**p_ut_activate_accounting_code**](docs/AccountingCodesApi.md#p_ut_activate_accounting_code) | **PUT** /v1/accounting-codes/{ac-id}/activate | Activate accounting code
*Zuora::AccountingCodesApi* | [**p_ut_deactivate_accounting_code**](docs/AccountingCodesApi.md#p_ut_deactivate_accounting_code) | **PUT** /v1/accounting-codes/{ac-id}/deactivate | Deactivate accounting code
*Zuora::AccountingPeriodsApi* | [**d_elete_accounting_period**](docs/AccountingPeriodsApi.md#d_elete_accounting_period) | **DELETE** /v1/accounting-periods/{ap-id} | Delete accounting period
*Zuora::AccountingPeriodsApi* | [**g_et_accounting_period**](docs/AccountingPeriodsApi.md#g_et_accounting_period) | **GET** /v1/accounting-periods/{ap-id} | Get accounting period
*Zuora::AccountingPeriodsApi* | [**g_et_all_accounting_periods**](docs/AccountingPeriodsApi.md#g_et_all_accounting_periods) | **GET** /v1/accounting-periods | Get all accounting periods
*Zuora::AccountingPeriodsApi* | [**p_ost_accounting_period**](docs/AccountingPeriodsApi.md#p_ost_accounting_period) | **POST** /v1/accounting-periods | Create accounting period
*Zuora::AccountingPeriodsApi* | [**p_ut_close_accounting_period**](docs/AccountingPeriodsApi.md#p_ut_close_accounting_period) | **PUT** /v1/accounting-periods/{ap-id}/close | Close accounting period
*Zuora::AccountingPeriodsApi* | [**p_ut_pending_close_accounting_period**](docs/AccountingPeriodsApi.md#p_ut_pending_close_accounting_period) | **PUT** /v1/accounting-periods/{ap-id}/pending-close | Set accounting period to pending close
*Zuora::AccountingPeriodsApi* | [**p_ut_reopen_accounting_period**](docs/AccountingPeriodsApi.md#p_ut_reopen_accounting_period) | **PUT** /v1/accounting-periods/{ap-id}/reopen | Re-open accounting period
*Zuora::AccountingPeriodsApi* | [**p_ut_run_trial_balance**](docs/AccountingPeriodsApi.md#p_ut_run_trial_balance) | **PUT** /v1/accounting-periods/{ap-id}/run-trial-balance | Run trial balance
*Zuora::AccountingPeriodsApi* | [**p_ut_update_accounting_period**](docs/AccountingPeriodsApi.md#p_ut_update_accounting_period) | **PUT** /v1/accounting-periods/{ap-id} | Update accounting period
*Zuora::AccountsApi* | [**g_et_account**](docs/AccountsApi.md#g_et_account) | **GET** /v1/accounts/{account-key} | Get account
*Zuora::AccountsApi* | [**g_et_account_summary**](docs/AccountsApi.md#g_et_account_summary) | **GET** /v1/accounts/{account-key}/summary | Get account summary
*Zuora::AccountsApi* | [**object_delete_account**](docs/AccountsApi.md#object_delete_account) | **DELETE** /v1/object/account/{id} | CRUD: Delete Account
*Zuora::AccountsApi* | [**object_get_account**](docs/AccountsApi.md#object_get_account) | **GET** /v1/object/account/{id} | CRUD: Retrieve Account
*Zuora::AccountsApi* | [**object_post_account**](docs/AccountsApi.md#object_post_account) | **POST** /v1/object/account | CRUD: Create Account
*Zuora::AccountsApi* | [**object_put_account**](docs/AccountsApi.md#object_put_account) | **PUT** /v1/object/account/{id} | CRUD: Update Account
*Zuora::AccountsApi* | [**p_ost_account**](docs/AccountsApi.md#p_ost_account) | **POST** /v1/accounts | Create account
*Zuora::AccountsApi* | [**p_ost_generate_billing_documents**](docs/AccountsApi.md#p_ost_generate_billing_documents) | **POST** /v1/accounts/{id}/billing-documents/generate | Generate billing documents by account
*Zuora::AccountsApi* | [**p_ut_account**](docs/AccountsApi.md#p_ut_account) | **PUT** /v1/accounts/{account-key} | Update account
*Zuora::ActionsApi* | [**action_pos_tamend**](docs/ActionsApi.md#action_pos_tamend) | **POST** /v1/action/amend | Amend
*Zuora::ActionsApi* | [**action_pos_tcreate**](docs/ActionsApi.md#action_pos_tcreate) | **POST** /v1/action/create | Create
*Zuora::ActionsApi* | [**action_pos_tdelete**](docs/ActionsApi.md#action_pos_tdelete) | **POST** /v1/action/delete | Delete
*Zuora::ActionsApi* | [**action_pos_texecute**](docs/ActionsApi.md#action_pos_texecute) | **POST** /v1/action/execute | Execute
*Zuora::ActionsApi* | [**action_pos_tgenerate**](docs/ActionsApi.md#action_pos_tgenerate) | **POST** /v1/action/generate | Generate
*Zuora::ActionsApi* | [**action_pos_tquery**](docs/ActionsApi.md#action_pos_tquery) | **POST** /v1/action/query | Query
*Zuora::ActionsApi* | [**action_pos_tquery_more**](docs/ActionsApi.md#action_pos_tquery_more) | **POST** /v1/action/queryMore | QueryMore
*Zuora::ActionsApi* | [**action_pos_tsubscribe**](docs/ActionsApi.md#action_pos_tsubscribe) | **POST** /v1/action/subscribe | Subscribe
*Zuora::ActionsApi* | [**action_pos_tupdate**](docs/ActionsApi.md#action_pos_tupdate) | **POST** /v1/action/update | Update
*Zuora::AmendmentsApi* | [**g_et_amendments_by_key**](docs/AmendmentsApi.md#g_et_amendments_by_key) | **GET** /v1/amendments/{amendment-key} | Get amendments by key
*Zuora::AmendmentsApi* | [**g_et_amendments_by_subscription_id**](docs/AmendmentsApi.md#g_et_amendments_by_subscription_id) | **GET** /v1/amendments/subscriptions/{subscription-id} | Get amendments by subscription ID
*Zuora::AmendmentsApi* | [**object_delete_amendment**](docs/AmendmentsApi.md#object_delete_amendment) | **DELETE** /v1/object/amendment/{id} | CRUD: Delete amendment
*Zuora::AmendmentsApi* | [**object_get_amendment**](docs/AmendmentsApi.md#object_get_amendment) | **GET** /v1/object/amendment/{id} | CRUD: Get amendment
*Zuora::AmendmentsApi* | [**object_post_amendment**](docs/AmendmentsApi.md#object_post_amendment) | **POST** /v1/object/amendment | CRUD: Create amendment
*Zuora::AmendmentsApi* | [**object_put_amendment**](docs/AmendmentsApi.md#object_put_amendment) | **PUT** /v1/object/amendment/{id} | CRUD: Update amendment
*Zuora::AttachmentsApi* | [**d_elete_attachments**](docs/AttachmentsApi.md#d_elete_attachments) | **DELETE** /v1/attachments/{attachment-id} | Delete attachments
*Zuora::AttachmentsApi* | [**g_et_attachments**](docs/AttachmentsApi.md#g_et_attachments) | **GET** /v1/attachments/{attachment-id} | View attachments
*Zuora::AttachmentsApi* | [**g_et_attachments_list**](docs/AttachmentsApi.md#g_et_attachments_list) | **GET** /v1/attachments/{object-type}/{object-key} | View attachments list
*Zuora::AttachmentsApi* | [**p_ost_attachments**](docs/AttachmentsApi.md#p_ost_attachments) | **POST** /v1/attachments | Add attachments
*Zuora::AttachmentsApi* | [**p_ut_attachments**](docs/AttachmentsApi.md#p_ut_attachments) | **PUT** /v1/attachments/{attachment-id} | Edit attachments
*Zuora::BillRunApi* | [**object_delete_bill_run**](docs/BillRunApi.md#object_delete_bill_run) | **DELETE** /v1/object/bill-run/{id} | CRUD: Delete Bill Run
*Zuora::BillRunApi* | [**object_get_bill_run**](docs/BillRunApi.md#object_get_bill_run) | **GET** /v1/object/bill-run/{id} | CRUD: Retrieve Bill Run
*Zuora::BillRunApi* | [**object_post_bill_run**](docs/BillRunApi.md#object_post_bill_run) | **POST** /v1/object/bill-run | CRUD: Create Bill Run
*Zuora::BillRunApi* | [**object_put_bill_run**](docs/BillRunApi.md#object_put_bill_run) | **PUT** /v1/object/bill-run/{id} | CRUD: Post or Cancel Bill Run
*Zuora::BillRunApi* | [**p_ost_email_billing_documentsfrom_bill_run**](docs/BillRunApi.md#p_ost_email_billing_documentsfrom_bill_run) | **POST** /v1/bill-runs/{billRunId}/emails | Email billing documents generated from bill run
*Zuora::BillingDocumentsApi* | [**g_et_billing_documents**](docs/BillingDocumentsApi.md#g_et_billing_documents) | **GET** /v1/billing-documents | Get billing documents
*Zuora::BillingPreviewRunApi* | [**g_et_billing_preview_run**](docs/BillingPreviewRunApi.md#g_et_billing_preview_run) | **GET** /v1/billing-preview-runs/{billingPreviewRunId} | Get Billing Preview Run
*Zuora::BillingPreviewRunApi* | [**p_ost_billing_preview_run**](docs/BillingPreviewRunApi.md#p_ost_billing_preview_run) | **POST** /v1/billing-preview-runs | Create Billing Preview Run
*Zuora::CatalogApi* | [**g_et_catalog**](docs/CatalogApi.md#g_et_catalog) | **GET** /v1/catalog/products | Get product catalog
*Zuora::CatalogApi* | [**p_ut_catalog**](docs/CatalogApi.md#p_ut_catalog) | **PUT** /v1/catalog/products/{product-id}/share | Multi-entity: Share a Product with an Entity
*Zuora::ChargeRevenueSummariesApi* | [**g_etcrs_by_charge_id**](docs/ChargeRevenueSummariesApi.md#g_etcrs_by_charge_id) | **GET** /v1/charge-revenue-summaries/subscription-charges/{charge-key} | Get charge summary details by charge ID
*Zuora::ChargeRevenueSummariesApi* | [**g_etcrs_by_crs_number**](docs/ChargeRevenueSummariesApi.md#g_etcrs_by_crs_number) | **GET** /v1/charge-revenue-summaries/{crs-number} | Get charge summary details by CRS number
*Zuora::CommunicationProfilesApi* | [**object_get_communication_profile**](docs/CommunicationProfilesApi.md#object_get_communication_profile) | **GET** /v1/object/communication-profile/{id} | CRUD: Retrieve CommunicationProfile
*Zuora::ConnectionsApi* | [**p_ost_connections**](docs/ConnectionsApi.md#p_ost_connections) | **POST** /v1/connections | Establish connection to Zuora REST API service
*Zuora::ContactsApi* | [**object_delete_contact**](docs/ContactsApi.md#object_delete_contact) | **DELETE** /v1/object/contact/{id} | CRUD: Delete Contact
*Zuora::ContactsApi* | [**object_get_contact**](docs/ContactsApi.md#object_get_contact) | **GET** /v1/object/contact/{id} | CRUD: Retrieve Contact
*Zuora::ContactsApi* | [**object_post_contact**](docs/ContactsApi.md#object_post_contact) | **POST** /v1/object/contact | CRUD: Create Contact
*Zuora::ContactsApi* | [**object_put_contact**](docs/ContactsApi.md#object_put_contact) | **PUT** /v1/object/contact/{id} | CRUD: Update Contact
*Zuora::CreditBalanceAdjustmentsApi* | [**object_get_credit_balance_adjustment**](docs/CreditBalanceAdjustmentsApi.md#object_get_credit_balance_adjustment) | **GET** /v1/object/credit-balance-adjustment/{id} | CRUD: Retrieve CreditBalanceAdjustment
*Zuora::CreditMemosApi* | [**d_elete_credit_memo**](docs/CreditMemosApi.md#d_elete_credit_memo) | **DELETE** /v1/creditmemos/{creditMemoId} | Delete credit memo
*Zuora::CreditMemosApi* | [**g_et_breakdown_credit_memo_by_order**](docs/CreditMemosApi.md#g_et_breakdown_credit_memo_by_order) | **GET** /v1/creditmemos/{creditMemoNumber}/amountBreakdownByOrder | Get breakdown of credit memo by order
*Zuora::CreditMemosApi* | [**g_et_credit_memo**](docs/CreditMemosApi.md#g_et_credit_memo) | **GET** /v1/creditmemos/{creditMemoId} | Get credit memo
*Zuora::CreditMemosApi* | [**g_et_credit_memo_item**](docs/CreditMemosApi.md#g_et_credit_memo_item) | **GET** /v1/creditmemos/{creditMemoId}/items/{cmitemid} | Get credit memo item
*Zuora::CreditMemosApi* | [**g_et_credit_memo_item_part**](docs/CreditMemosApi.md#g_et_credit_memo_item_part) | **GET** /v1/creditmemos/{creditMemoId}/parts/{partid}/itemparts/{itempartid} | Get credit memo part item
*Zuora::CreditMemosApi* | [**g_et_credit_memo_item_parts**](docs/CreditMemosApi.md#g_et_credit_memo_item_parts) | **GET** /v1/creditmemos/{creditMemoId}/parts/{partid}/itemparts | Get credit memo part items
*Zuora::CreditMemosApi* | [**g_et_credit_memo_items**](docs/CreditMemosApi.md#g_et_credit_memo_items) | **GET** /v1/creditmemos/{creditMemoId}/items | Get credit memo items
*Zuora::CreditMemosApi* | [**g_et_credit_memo_part**](docs/CreditMemosApi.md#g_et_credit_memo_part) | **GET** /v1/creditmemos/{creditMemoId}/parts/{partid} | Get credit memo part
*Zuora::CreditMemosApi* | [**g_et_credit_memo_parts**](docs/CreditMemosApi.md#g_et_credit_memo_parts) | **GET** /v1/creditmemos/{creditMemoId}/parts | Get credit memo parts
*Zuora::CreditMemosApi* | [**g_et_credit_memos**](docs/CreditMemosApi.md#g_et_credit_memos) | **GET** /v1/creditmemos | Get credit memos
*Zuora::CreditMemosApi* | [**p_ost_credit_memo_from_prpc**](docs/CreditMemosApi.md#p_ost_credit_memo_from_prpc) | **POST** /v1/creditmemos | Create credit memo from charge
*Zuora::CreditMemosApi* | [**p_ost_credit_memo_pdf**](docs/CreditMemosApi.md#p_ost_credit_memo_pdf) | **POST** /v1/creditmemos/{creditMemoId}/pdfs | Create credit memo PDF
*Zuora::CreditMemosApi* | [**p_ost_email_credit_memo**](docs/CreditMemosApi.md#p_ost_email_credit_memo) | **POST** /v1/creditmemos/{creditMemoId}/emails | Email credit memo
*Zuora::CreditMemosApi* | [**p_ost_refund_credit_memo**](docs/CreditMemosApi.md#p_ost_refund_credit_memo) | **POST** /v1/creditmemos/{creditmemoId}/refunds | Refund credit memo
*Zuora::CreditMemosApi* | [**p_ostcm_taxation_items**](docs/CreditMemosApi.md#p_ostcm_taxation_items) | **POST** /v1/creditmemos/{creditMemoId}/taxationitems | Create taxation items for credit memo
*Zuora::CreditMemosApi* | [**p_ut_apply_credit_memo**](docs/CreditMemosApi.md#p_ut_apply_credit_memo) | **PUT** /v1/creditmemos/{creditMemoId}/apply | Apply credit memo
*Zuora::CreditMemosApi* | [**p_ut_cancel_credit_memo**](docs/CreditMemosApi.md#p_ut_cancel_credit_memo) | **PUT** /v1/creditmemos/{creditMemoId}/cancel | Cancel credit memo
*Zuora::CreditMemosApi* | [**p_ut_post_credit_memo**](docs/CreditMemosApi.md#p_ut_post_credit_memo) | **PUT** /v1/creditmemos/{creditMemoId}/post | Post credit memo
*Zuora::CreditMemosApi* | [**p_ut_unapply_credit_memo**](docs/CreditMemosApi.md#p_ut_unapply_credit_memo) | **PUT** /v1/creditmemos/{creditMemoId}/unapply | Unapply credit memo
*Zuora::CreditMemosApi* | [**p_ut_update_credit_memo**](docs/CreditMemosApi.md#p_ut_update_credit_memo) | **PUT** /v1/creditmemos/{creditMemoId} | Update credit memo
*Zuora::CustomExchangeRatesApi* | [**g_et_custom_exchange_rates**](docs/CustomExchangeRatesApi.md#g_et_custom_exchange_rates) | **GET** /v1/custom-exchange-rates/{currency} | Get custom foreign currency exchange rates
*Zuora::CustomFieldsApi* | [**d_elete_custom_fields_definition_in_global_namespace**](docs/CustomFieldsApi.md#d_elete_custom_fields_definition_in_global_namespace) | **DELETE** /fields/definitions/{type} | Delete schema of custom fields definition in the global namespace
*Zuora::CustomFieldsApi* | [**d_elete_custom_fields_definition_in_namespace**](docs/CustomFieldsApi.md#d_elete_custom_fields_definition_in_namespace) | **DELETE** /fields/{namespace}/definitions/{type} | Delete schema of custom fields definition in namespace
*Zuora::CustomFieldsApi* | [**g_et_custom_fields_definition_in_global_namespace**](docs/CustomFieldsApi.md#g_et_custom_fields_definition_in_global_namespace) | **GET** /fields/definitions/{type} | Get custom fields definition in the global namespace
*Zuora::CustomFieldsApi* | [**g_et_custom_fields_definition_in_namespace**](docs/CustomFieldsApi.md#g_et_custom_fields_definition_in_namespace) | **GET** /fields/{namespace}/definitions/{type} | Get custom fields definition in namespace
*Zuora::CustomFieldsApi* | [**g_et_custom_fields_definitions_in_global_namespace**](docs/CustomFieldsApi.md#g_et_custom_fields_definitions_in_global_namespace) | **GET** /fields/definitions | Get all custom fields definitions in the global namespace
*Zuora::CustomFieldsApi* | [**g_et_custom_fields_definitions_in_namespace**](docs/CustomFieldsApi.md#g_et_custom_fields_definitions_in_namespace) | **GET** /fields/{namespace}/definitions | Get all custom fields definitions in namespace
*Zuora::CustomFieldsApi* | [**g_et_custom_fields_namespaces**](docs/CustomFieldsApi.md#g_et_custom_fields_namespaces) | **GET** /fields/namespaces | Get namespaces for custom fields definitions
*Zuora::CustomFieldsApi* | [**g_et_custom_fields_types_in_global_namespace**](docs/CustomFieldsApi.md#g_et_custom_fields_types_in_global_namespace) | **GET** /fields/types | Get all custom fields types in the global namespace
*Zuora::CustomFieldsApi* | [**g_et_custom_fields_types_in_namespace**](docs/CustomFieldsApi.md#g_et_custom_fields_types_in_namespace) | **GET** /fields/{namespace}/types | Get all custom fields types in namespace
*Zuora::CustomFieldsApi* | [**p_ut_custom_fields_definition_in_global_namespace**](docs/CustomFieldsApi.md#p_ut_custom_fields_definition_in_global_namespace) | **PUT** /fields/definitions/{type} | Set schema of custom fields definition in the global namespace
*Zuora::CustomFieldsApi* | [**p_ut_custom_fields_definition_in_namespace**](docs/CustomFieldsApi.md#p_ut_custom_fields_definition_in_namespace) | **PUT** /fields/{namespace}/definitions/{type} | Set schema of custom fields definition in namespace
*Zuora::DebitMemosApi* | [**d_elete_debit_memo**](docs/DebitMemosApi.md#d_elete_debit_memo) | **DELETE** /v1/debitmemos/{debitMemoId} | Delete debit memo
*Zuora::DebitMemosApi* | [**g_et_debit_memo**](docs/DebitMemosApi.md#g_et_debit_memo) | **GET** /v1/debitmemos/{debitMemoId} | Get debit memo
*Zuora::DebitMemosApi* | [**g_et_debit_memo_application_parts**](docs/DebitMemosApi.md#g_et_debit_memo_application_parts) | **GET** /v1/debitmemos/{debitMemoId}/application-parts | Get debit memo application parts
*Zuora::DebitMemosApi* | [**g_et_debit_memo_item**](docs/DebitMemosApi.md#g_et_debit_memo_item) | **GET** /v1/debitmemos/{debitMemoId}/items/{dmitemid} | Get debit memo item
*Zuora::DebitMemosApi* | [**g_et_debit_memo_items**](docs/DebitMemosApi.md#g_et_debit_memo_items) | **GET** /v1/debitmemos/{debitMemoId}/items | Get debit memo items
*Zuora::DebitMemosApi* | [**g_et_debit_memos**](docs/DebitMemosApi.md#g_et_debit_memos) | **GET** /v1/debitmemos | Get debit memos
*Zuora::DebitMemosApi* | [**p_ost_debit_memo_from_prpc**](docs/DebitMemosApi.md#p_ost_debit_memo_from_prpc) | **POST** /v1/debitmemos | Create debit memo from charge
*Zuora::DebitMemosApi* | [**p_ost_debit_memo_pdf**](docs/DebitMemosApi.md#p_ost_debit_memo_pdf) | **POST** /v1/debitmemos/{debitMemoId}/pdfs | Create debit memo PDF
*Zuora::DebitMemosApi* | [**p_ost_email_debit_memo**](docs/DebitMemosApi.md#p_ost_email_debit_memo) | **POST** /v1/debitmemos/{debitMemoId}/emails | Email debit memo
*Zuora::DebitMemosApi* | [**p_ostdm_taxation_items**](docs/DebitMemosApi.md#p_ostdm_taxation_items) | **POST** /v1/debitmemos/{debitMemoId}/taxationitems | Create taxation items for debit memo
*Zuora::DebitMemosApi* | [**p_ut_batch_update_debit_memos**](docs/DebitMemosApi.md#p_ut_batch_update_debit_memos) | **PUT** /v1/debitmemos | Update debit memos
*Zuora::DebitMemosApi* | [**p_ut_cancel_debit_memo**](docs/DebitMemosApi.md#p_ut_cancel_debit_memo) | **PUT** /v1/debitmemos/{debitMemoId}/cancel | Cancel debit memo
*Zuora::DebitMemosApi* | [**p_ut_debit_memo**](docs/DebitMemosApi.md#p_ut_debit_memo) | **PUT** /v1/debitmemos/{debitMemoId} | Update debit memo
*Zuora::DebitMemosApi* | [**p_ut_post_debit_memo**](docs/DebitMemosApi.md#p_ut_post_debit_memo) | **PUT** /v1/debitmemos/{debitMemoId}/post | Post debit memo
*Zuora::DescribeApi* | [**g_et_describe**](docs/DescribeApi.md#g_et_describe) | **GET** /v1/describe/{object} | Describe object
*Zuora::EntitiesApi* | [**d_elete_entities**](docs/EntitiesApi.md#d_elete_entities) | **DELETE** /v1/entities/{id} | Multi-entity: Delete entity
*Zuora::EntitiesApi* | [**g_et_entities**](docs/EntitiesApi.md#g_et_entities) | **GET** /v1/entities | Multi-entity: Get entities
*Zuora::EntitiesApi* | [**g_et_entity_by_id**](docs/EntitiesApi.md#g_et_entity_by_id) | **GET** /v1/entities/{id} | Multi-entity: Get entity by Id
*Zuora::EntitiesApi* | [**p_ost_entities**](docs/EntitiesApi.md#p_ost_entities) | **POST** /v1/entities | Multi-entity: Create entity
*Zuora::EntitiesApi* | [**p_ut_entities**](docs/EntitiesApi.md#p_ut_entities) | **PUT** /v1/entities/{id} | Multi-entity: Update entity
*Zuora::EntitiesApi* | [**p_ut_provision_entity**](docs/EntitiesApi.md#p_ut_provision_entity) | **PUT** /v1/entities/{id}/provision | Multi-entity: Provision entity
*Zuora::EntityConnectionsApi* | [**g_et_entity_connections**](docs/EntityConnectionsApi.md#g_et_entity_connections) | **GET** /v1/entity-connections | Multi-entity: Get connections
*Zuora::EntityConnectionsApi* | [**p_ost_entity_connections**](docs/EntityConnectionsApi.md#p_ost_entity_connections) | **POST** /v1/entity-connections | Multi-entity: Initiate connection
*Zuora::EntityConnectionsApi* | [**p_ut_entity_connections_accept**](docs/EntityConnectionsApi.md#p_ut_entity_connections_accept) | **PUT** /v1/entity-connections/{connection-id}/accept | Multi-entity: Accept connection
*Zuora::EntityConnectionsApi* | [**p_ut_entity_connections_deny**](docs/EntityConnectionsApi.md#p_ut_entity_connections_deny) | **PUT** /v1/entity-connections/{connection-id}/deny | Multi-entity: Deny connection
*Zuora::EntityConnectionsApi* | [**p_ut_entity_connections_disconnect**](docs/EntityConnectionsApi.md#p_ut_entity_connections_disconnect) | **PUT** /v1/entity-connections/{connection-id}/disconnect | Multi-entity: Disconnect connection
*Zuora::ExportsApi* | [**object_get_export**](docs/ExportsApi.md#object_get_export) | **GET** /v1/object/export/{id} | CRUD: Retrieve Export
*Zuora::ExportsApi* | [**object_post_export**](docs/ExportsApi.md#object_post_export) | **POST** /v1/object/export | CRUD: Create Export
*Zuora::FeaturesApi* | [**object_delete_feature**](docs/FeaturesApi.md#object_delete_feature) | **DELETE** /v1/object/feature/{id} | CRUD: Delete Feature
*Zuora::FeaturesApi* | [**object_get_feature**](docs/FeaturesApi.md#object_get_feature) | **GET** /v1/object/feature/{id} | CRUD: Retrieve Feature
*Zuora::GetFilesApi* | [**g_et_files**](docs/GetFilesApi.md#g_et_files) | **GET** /v1/files/{file-id} | Get files
*Zuora::HMACSignaturesApi* | [**p_osthmac_signatures**](docs/HMACSignaturesApi.md#p_osthmac_signatures) | **POST** /v1/hmac-signatures | Return HMAC signatures
*Zuora::HostedPagesApi* | [**get_hosted_pages**](docs/HostedPagesApi.md#get_hosted_pages) | **GET** /v1/hostedpages | Return hosted pages
*Zuora::ImportsApi* | [**object_get_import**](docs/ImportsApi.md#object_get_import) | **GET** /v1/object/import/{id} | CRUD: Retrieve Import
*Zuora::ImportsApi* | [**object_post_import**](docs/ImportsApi.md#object_post_import) | **POST** /v1/object/import | CRUD: Create Import
*Zuora::InvoiceAdjustmentsApi* | [**object_delete_invoice_adjustment**](docs/InvoiceAdjustmentsApi.md#object_delete_invoice_adjustment) | **DELETE** /v1/object/invoice-adjustment/{id} | CRUD: Delete InvoiceAdjustment
*Zuora::InvoiceAdjustmentsApi* | [**object_get_invoice_adjustment**](docs/InvoiceAdjustmentsApi.md#object_get_invoice_adjustment) | **GET** /v1/object/invoice-adjustment/{id} | CRUD: Retrieve InvoiceAdjustment
*Zuora::InvoiceAdjustmentsApi* | [**object_post_invoice_adjustment**](docs/InvoiceAdjustmentsApi.md#object_post_invoice_adjustment) | **POST** /v1/object/invoice-adjustment | CRUD: Create InvoiceAdjustment
*Zuora::InvoiceAdjustmentsApi* | [**object_put_invoice_adjustment**](docs/InvoiceAdjustmentsApi.md#object_put_invoice_adjustment) | **PUT** /v1/object/invoice-adjustment/{id} | CRUD: Update InvoiceAdjustment
*Zuora::InvoiceItemAdjustmentsApi* | [**object_delete_invoice_item_adjustment**](docs/InvoiceItemAdjustmentsApi.md#object_delete_invoice_item_adjustment) | **DELETE** /v1/object/invoice-item-adjustment/{id} | CRUD: Delete InvoiceItemAdjustment
*Zuora::InvoiceItemAdjustmentsApi* | [**object_get_invoice_item_adjustment**](docs/InvoiceItemAdjustmentsApi.md#object_get_invoice_item_adjustment) | **GET** /v1/object/invoice-item-adjustment/{id} | CRUD: Retrieve InvoiceItemAdjustment
*Zuora::InvoiceItemsApi* | [**object_get_invoice_item**](docs/InvoiceItemsApi.md#object_get_invoice_item) | **GET** /v1/object/invoice-item/{id} | CRUD: Retrieve InvoiceItem
*Zuora::InvoicePaymentsApi* | [**object_get_invoice_payment**](docs/InvoicePaymentsApi.md#object_get_invoice_payment) | **GET** /v1/object/invoice-payment/{id} | CRUD: Retrieve InvoicePayment
*Zuora::InvoicePaymentsApi* | [**object_post_invoice_payment**](docs/InvoicePaymentsApi.md#object_post_invoice_payment) | **POST** /v1/object/invoice-payment | CRUD: Create InvoicePayment
*Zuora::InvoicePaymentsApi* | [**object_put_invoice_payment**](docs/InvoicePaymentsApi.md#object_put_invoice_payment) | **PUT** /v1/object/invoice-payment/{id} | CRUD: Update InvoicePayment
*Zuora::InvoiceSplitItemsApi* | [**object_get_invoice_split_item**](docs/InvoiceSplitItemsApi.md#object_get_invoice_split_item) | **GET** /v1/object/invoice-split-item/{id} | CRUD: Retrieve InvoiceSplitItem
*Zuora::InvoiceSplitsApi* | [**object_get_invoice_split**](docs/InvoiceSplitsApi.md#object_get_invoice_split) | **GET** /v1/object/invoice-split/{id} | CRUD: Retrieve InvoiceSplit
*Zuora::InvoicesApi* | [**g_et_invoice_application_parts**](docs/InvoicesApi.md#g_et_invoice_application_parts) | **GET** /v1/invoices/{invoiceId}/application-parts | Get invoice application parts
*Zuora::InvoicesApi* | [**object_delete_invoice**](docs/InvoicesApi.md#object_delete_invoice) | **DELETE** /v1/object/invoice/{id} | CRUD: Delete Invoice
*Zuora::InvoicesApi* | [**object_get_invoice**](docs/InvoicesApi.md#object_get_invoice) | **GET** /v1/object/invoice/{id} | CRUD: Retrieve Invoice
*Zuora::InvoicesApi* | [**object_put_invoice**](docs/InvoicesApi.md#object_put_invoice) | **PUT** /v1/object/invoice/{id} | CRUD: Update Invoice
*Zuora::InvoicesApi* | [**p_ost_credit_memo_from_invoice**](docs/InvoicesApi.md#p_ost_credit_memo_from_invoice) | **POST** /v1/invoices/{invoiceId}/creditmemos | Create credit memo from invoice
*Zuora::InvoicesApi* | [**p_ost_debit_memo_from_invoice**](docs/InvoicesApi.md#p_ost_debit_memo_from_invoice) | **POST** /v1/invoices/{invoiceId}/debitmemos | Create debit memo from invoice
*Zuora::InvoicesApi* | [**p_ost_email_invoice**](docs/InvoicesApi.md#p_ost_email_invoice) | **POST** /v1/invoices/{invoiceId}/emails | Email invoice
*Zuora::InvoicesApi* | [**p_ut_batch_update_invoices**](docs/InvoicesApi.md#p_ut_batch_update_invoices) | **PUT** /v1/invoices | Update invoices
*Zuora::InvoicesApi* | [**p_ut_reverse_invoice**](docs/InvoicesApi.md#p_ut_reverse_invoice) | **PUT** /v1/invoices/{invoiceId}/reverse | Reverse invoice
*Zuora::InvoicesApi* | [**p_ut_update_invoice**](docs/InvoicesApi.md#p_ut_update_invoice) | **PUT** /v1/invoices/{invoiceId} | Update invoice
*Zuora::JournalRunsApi* | [**d_elete_journal_run**](docs/JournalRunsApi.md#d_elete_journal_run) | **DELETE** /v1/journal-runs/{jr-number} | Delete journal run
*Zuora::JournalRunsApi* | [**g_et_journal_run**](docs/JournalRunsApi.md#g_et_journal_run) | **GET** /v1/journal-runs/{jr-number} | Get journal run
*Zuora::JournalRunsApi* | [**p_ost_journal_run**](docs/JournalRunsApi.md#p_ost_journal_run) | **POST** /v1/journal-runs | Create journal run
*Zuora::JournalRunsApi* | [**p_ut_journal_run**](docs/JournalRunsApi.md#p_ut_journal_run) | **PUT** /v1/journal-runs/{jr-number}/cancel | Cancel journal run
*Zuora::MassUpdaterApi* | [**g_et_mass_updater**](docs/MassUpdaterApi.md#g_et_mass_updater) | **GET** /v1/bulk/{bulk-key} | Get mass action result
*Zuora::MassUpdaterApi* | [**p_ost_mass_updater**](docs/MassUpdaterApi.md#p_ost_mass_updater) | **POST** /v1/bulk | Perform mass action
*Zuora::MassUpdaterApi* | [**p_ut_mass_updater**](docs/MassUpdaterApi.md#p_ut_mass_updater) | **PUT** /v1/bulk/{bulk-key}/stop | Stop mass action
*Zuora::NotificationHistoryApi* | [**g_et_callout_history**](docs/NotificationHistoryApi.md#g_et_callout_history) | **GET** /v1/notification-history/callout | Get callout notification histories
*Zuora::NotificationHistoryApi* | [**g_et_email_history**](docs/NotificationHistoryApi.md#g_et_email_history) | **GET** /v1/notification-history/email | Get email notification histories
*Zuora::OAuthApi* | [**create_token**](docs/OAuthApi.md#create_token) | **POST** /oauth/token | Generate an OAuth token
*Zuora::OperationsApi* | [**p_ost_billing_preview**](docs/OperationsApi.md#p_ost_billing_preview) | **POST** /v1/operations/billing-preview | Create billing preview
*Zuora::OperationsApi* | [**p_ost_transaction_invoice_payment**](docs/OperationsApi.md#p_ost_transaction_invoice_payment) | **POST** /v1/operations/invoice-collect | Invoice and collect
*Zuora::OrdersApi* | [**d_elete_order**](docs/OrdersApi.md#d_elete_order) | **DELETE** /v1/orders/{orderNumber} | Delete order
*Zuora::OrdersApi* | [**g_et_all_orders**](docs/OrdersApi.md#g_et_all_orders) | **GET** /v1/orders | Get all orders
*Zuora::OrdersApi* | [**g_et_breakdown_invoice_by_order**](docs/OrdersApi.md#g_et_breakdown_invoice_by_order) | **GET** /v1/invoices/{invoiceNumber}/amountBreakdownByOrder | Get breakdown of invoice by order
*Zuora::OrdersApi* | [**g_et_order**](docs/OrdersApi.md#g_et_order) | **GET** /v1/orders/{orderNumber} | Get an order
*Zuora::OrdersApi* | [**g_et_order_billing_info**](docs/OrdersApi.md#g_et_order_billing_info) | **GET** /v1/orders/{orderNumber}/billingInfo | Get billing information for order
*Zuora::OrdersApi* | [**g_et_order_metricsfor_evergreen_subscription**](docs/OrdersApi.md#g_et_order_metricsfor_evergreen_subscription) | **GET** /v1/orders/{orderNumber}/evergreenMetrics/{subscriptionNumber} | Get order metrics for evergreen subscription
*Zuora::OrdersApi* | [**g_et_order_rated_result**](docs/OrdersApi.md#g_et_order_rated_result) | **GET** /v1/orders/{orderNumber}/ratedResults | Get rated result for order
*Zuora::OrdersApi* | [**g_et_orders_by_invoice_owner**](docs/OrdersApi.md#g_et_orders_by_invoice_owner) | **GET** /v1/orders/invoiceOwner/{accountNumber} | Get orders by invoice owner
*Zuora::OrdersApi* | [**g_et_orders_by_subscription_number**](docs/OrdersApi.md#g_et_orders_by_subscription_number) | **GET** /v1/orders/subscription/{subscriptionNumber} | Get orders by subscription number
*Zuora::OrdersApi* | [**g_et_orders_by_subscription_owner**](docs/OrdersApi.md#g_et_orders_by_subscription_owner) | **GET** /v1/orders/subscriptionOwner/{accountNumber} | Get orders by subscription owner
*Zuora::OrdersApi* | [**g_et_subscription_term_info**](docs/OrdersApi.md#g_et_subscription_term_info) | **GET** /v1/orders/term/{subscriptionNumber} | Get term information for subscription
*Zuora::OrdersApi* | [**p_ost_order**](docs/OrdersApi.md#p_ost_order) | **POST** /v1/orders | Create and activate order
*Zuora::OrdersApi* | [**p_ost_preview_order**](docs/OrdersApi.md#p_ost_preview_order) | **POST** /v1/orders/preview | Preview order
*Zuora::OrdersApi* | [**p_ut_update_order_custom_fields**](docs/OrdersApi.md#p_ut_update_order_custom_fields) | **PUT** /v1/orders/{orderNumber}/customFields | Update order custom fields
*Zuora::OrdersApi* | [**p_ut_update_subscription_custom_fields**](docs/OrdersApi.md#p_ut_update_subscription_custom_fields) | **PUT** /v1/subscriptions/{subscriptionNumber}/customFields | Update subscription custom fields
*Zuora::PaymentGatewaysApi* | [**g_et_paymentgateways**](docs/PaymentGatewaysApi.md#g_et_paymentgateways) | **GET** /v1/paymentgateways | Get payment gateways
*Zuora::PaymentMethodSnapshotsApi* | [**object_delete_payment_method_snapshot**](docs/PaymentMethodSnapshotsApi.md#object_delete_payment_method_snapshot) | **DELETE** /v1/object/payment-method-snapshot/{id} | CRUD: Delete PaymentMethodSnapshot
*Zuora::PaymentMethodSnapshotsApi* | [**object_get_payment_method_snapshot**](docs/PaymentMethodSnapshotsApi.md#object_get_payment_method_snapshot) | **GET** /v1/object/payment-method-snapshot/{id} | CRUD: Retrieve PaymentMethodSnapshot
*Zuora::PaymentMethodTransactionLogsApi* | [**object_get_payment_method_transaction_log**](docs/PaymentMethodTransactionLogsApi.md#object_get_payment_method_transaction_log) | **GET** /v1/object/payment-method-transaction-log/{id} | CRUD: Retrieve PaymentMethodTransactionLog
*Zuora::PaymentMethodsApi* | [**d_elete_payment_methods**](docs/PaymentMethodsApi.md#d_elete_payment_methods) | **DELETE** /v1/payment-methods/{payment-method-id} | Delete payment method
*Zuora::PaymentMethodsApi* | [**g_et_payment_methods**](docs/PaymentMethodsApi.md#g_et_payment_methods) | **GET** /v1/payment-methods/credit-cards/accounts/{account-key} | Get payment methods
*Zuora::PaymentMethodsApi* | [**object_delete_payment_method**](docs/PaymentMethodsApi.md#object_delete_payment_method) | **DELETE** /v1/object/payment-method/{id} | CRUD: Delete payment method
*Zuora::PaymentMethodsApi* | [**object_get_payment_method**](docs/PaymentMethodsApi.md#object_get_payment_method) | **GET** /v1/object/payment-method/{id} | CRUD: Get payment method
*Zuora::PaymentMethodsApi* | [**object_post_payment_method**](docs/PaymentMethodsApi.md#object_post_payment_method) | **POST** /v1/object/payment-method | CRUD: Create payment method
*Zuora::PaymentMethodsApi* | [**object_put_payment_method**](docs/PaymentMethodsApi.md#object_put_payment_method) | **PUT** /v1/object/payment-method/{id} | CRUD: Update payment method
*Zuora::PaymentMethodsApi* | [**p_ost_payment_methods**](docs/PaymentMethodsApi.md#p_ost_payment_methods) | **POST** /v1/payment-methods/credit-cards | Create payment method
*Zuora::PaymentMethodsApi* | [**p_ost_payment_methods_decryption**](docs/PaymentMethodsApi.md#p_ost_payment_methods_decryption) | **POST** /v1/payment-methods/decryption | Create Apple Pay payment method
*Zuora::PaymentMethodsApi* | [**p_ut_payment_methods**](docs/PaymentMethodsApi.md#p_ut_payment_methods) | **PUT** /v1/payment-methods/credit-cards/{payment-method-id} | Update payment method
*Zuora::PaymentMethodsApi* | [**p_ut_verify_payment_methods**](docs/PaymentMethodsApi.md#p_ut_verify_payment_methods) | **PUT** /v1/payment-methods/{payment-method-id}/verify | Verify payment method
*Zuora::PaymentRunsApi* | [**d_elete_payment_run**](docs/PaymentRunsApi.md#d_elete_payment_run) | **DELETE** /v1/payment-runs/{paymentRunId} | Delete payment run
*Zuora::PaymentRunsApi* | [**g_et_payment_run**](docs/PaymentRunsApi.md#g_et_payment_run) | **GET** /v1/payment-runs/{paymentRunId} | Get payment run
*Zuora::PaymentRunsApi* | [**g_et_payment_run_summary**](docs/PaymentRunsApi.md#g_et_payment_run_summary) | **GET** /v1/payment-runs/{paymentRunId}/summary | Get payment run summary
*Zuora::PaymentRunsApi* | [**g_et_payment_runs**](docs/PaymentRunsApi.md#g_et_payment_runs) | **GET** /v1/payment-runs | Get payment runs
*Zuora::PaymentRunsApi* | [**p_ost_payment_run**](docs/PaymentRunsApi.md#p_ost_payment_run) | **POST** /v1/payment-runs | Create payment run
*Zuora::PaymentRunsApi* | [**p_ut_payment_run**](docs/PaymentRunsApi.md#p_ut_payment_run) | **PUT** /v1/payment-runs/{paymentRunId} | Update payment run
*Zuora::PaymentTransactionLogsApi* | [**object_get_payment_transaction_log**](docs/PaymentTransactionLogsApi.md#object_get_payment_transaction_log) | **GET** /v1/object/payment-transaction-log/{id} | CRUD: Get payment transaction log
*Zuora::PaymentsApi* | [**d_elete_payment**](docs/PaymentsApi.md#d_elete_payment) | **DELETE** /v1/payments/{paymentId} | Delete payment
*Zuora::PaymentsApi* | [**g_et_payment**](docs/PaymentsApi.md#g_et_payment) | **GET** /v1/payments/{paymentId} | Get payment
*Zuora::PaymentsApi* | [**g_et_payment_item_part**](docs/PaymentsApi.md#g_et_payment_item_part) | **GET** /v1/payments/{paymentId}/parts/{partid}/itemparts/{itempartid} | Get payment part item
*Zuora::PaymentsApi* | [**g_et_payment_item_parts**](docs/PaymentsApi.md#g_et_payment_item_parts) | **GET** /v1/payments/{paymentId}/parts/{partid}/itemparts | Get payment part items
*Zuora::PaymentsApi* | [**g_et_payment_part**](docs/PaymentsApi.md#g_et_payment_part) | **GET** /v1/payments/{paymentId}/parts/{partid} | Get payment part
*Zuora::PaymentsApi* | [**g_et_payment_parts**](docs/PaymentsApi.md#g_et_payment_parts) | **GET** /v1/payments/{paymentId}/parts | Get payment parts
*Zuora::PaymentsApi* | [**g_et_retrieve_all_payments**](docs/PaymentsApi.md#g_et_retrieve_all_payments) | **GET** /v1/payments | Get all payments
*Zuora::PaymentsApi* | [**object_delete_payment**](docs/PaymentsApi.md#object_delete_payment) | **DELETE** /v1/object/payment/{id} | CRUD: Delete payment
*Zuora::PaymentsApi* | [**object_get_payment**](docs/PaymentsApi.md#object_get_payment) | **GET** /v1/object/payment/{id} | CRUD: Get payment
*Zuora::PaymentsApi* | [**object_post_payment**](docs/PaymentsApi.md#object_post_payment) | **POST** /v1/object/payment | CRUD: Create payment
*Zuora::PaymentsApi* | [**object_put_payment**](docs/PaymentsApi.md#object_put_payment) | **PUT** /v1/object/payment/{id} | CRUD: Update payment
*Zuora::PaymentsApi* | [**p_ost_create_payment**](docs/PaymentsApi.md#p_ost_create_payment) | **POST** /v1/payments | Create payment
*Zuora::PaymentsApi* | [**p_ost_refund_payment**](docs/PaymentsApi.md#p_ost_refund_payment) | **POST** /v1/payments/{paymentId}/refunds | Refund payment
*Zuora::PaymentsApi* | [**p_ut_apply_payment**](docs/PaymentsApi.md#p_ut_apply_payment) | **PUT** /v1/payments/{paymentId}/apply | Apply payment
*Zuora::PaymentsApi* | [**p_ut_cancel_payment**](docs/PaymentsApi.md#p_ut_cancel_payment) | **PUT** /v1/payments/{paymentId}/cancel | Cancel payment
*Zuora::PaymentsApi* | [**p_ut_transfer_payment**](docs/PaymentsApi.md#p_ut_transfer_payment) | **PUT** /v1/payments/{paymentId}/transfer | Transfer payment
*Zuora::PaymentsApi* | [**p_ut_unapply_payment**](docs/PaymentsApi.md#p_ut_unapply_payment) | **PUT** /v1/payments/{paymentId}/unapply | Unapply payment
*Zuora::PaymentsApi* | [**p_ut_update_payment**](docs/PaymentsApi.md#p_ut_update_payment) | **PUT** /v1/payments/{paymentId} | Update payment
*Zuora::ProductFeaturesApi* | [**object_delete_product_feature**](docs/ProductFeaturesApi.md#object_delete_product_feature) | **DELETE** /v1/object/product-feature/{id} | CRUD: Delete ProductFeature
*Zuora::ProductFeaturesApi* | [**object_get_product_feature**](docs/ProductFeaturesApi.md#object_get_product_feature) | **GET** /v1/object/product-feature/{id} | CRUD: Retrieve ProductFeature
*Zuora::ProductRatePlanChargeTiersApi* | [**object_get_product_rate_plan_charge_tier**](docs/ProductRatePlanChargeTiersApi.md#object_get_product_rate_plan_charge_tier) | **GET** /v1/object/product-rate-plan-charge-tier/{id} | CRUD: Retrieve ProductRatePlanChargeTier
*Zuora::ProductRatePlanChargesApi* | [**object_delete_product_rate_plan_charge**](docs/ProductRatePlanChargesApi.md#object_delete_product_rate_plan_charge) | **DELETE** /v1/object/product-rate-plan-charge/{id} | CRUD: Delete ProductRatePlanCharge
*Zuora::ProductRatePlanChargesApi* | [**object_get_product_rate_plan_charge**](docs/ProductRatePlanChargesApi.md#object_get_product_rate_plan_charge) | **GET** /v1/object/product-rate-plan-charge/{id} | CRUD: Retrieve ProductRatePlanCharge
*Zuora::ProductRatePlansApi* | [**object_delete_product_rate_plan**](docs/ProductRatePlansApi.md#object_delete_product_rate_plan) | **DELETE** /v1/object/product-rate-plan/{id} | CRUD: Delete ProductRatePlan
*Zuora::ProductRatePlansApi* | [**object_get_product_rate_plan**](docs/ProductRatePlansApi.md#object_get_product_rate_plan) | **GET** /v1/object/product-rate-plan/{id} | CRUD: Retrieve ProductRatePlan
*Zuora::ProductRatePlansApi* | [**object_post_product_rate_plan**](docs/ProductRatePlansApi.md#object_post_product_rate_plan) | **POST** /v1/object/product-rate-plan | CRUD: Create ProductRatePlan
*Zuora::ProductRatePlansApi* | [**object_put_product_rate_plan**](docs/ProductRatePlansApi.md#object_put_product_rate_plan) | **PUT** /v1/object/product-rate-plan/{id} | CRUD: Update ProductRatePlan
*Zuora::ProductsApi* | [**object_delete_product**](docs/ProductsApi.md#object_delete_product) | **DELETE** /v1/object/product/{id} | CRUD: Delete Product
*Zuora::ProductsApi* | [**object_get_product**](docs/ProductsApi.md#object_get_product) | **GET** /v1/object/product/{id} | CRUD: Retrieve Product
*Zuora::ProductsApi* | [**object_post_product**](docs/ProductsApi.md#object_post_product) | **POST** /v1/object/product | CRUD: Create Product
*Zuora::ProductsApi* | [**object_put_product**](docs/ProductsApi.md#object_put_product) | **PUT** /v1/object/product/{id} | CRUD: Update Product
*Zuora::QuotesDocumentApi* | [**p_ost_quotes_document**](docs/QuotesDocumentApi.md#p_ost_quotes_document) | **POST** /v1/quotes/document | Generate quotes document
*Zuora::RSASignaturesApi* | [**p_ost_decrypt_rsa_signatures**](docs/RSASignaturesApi.md#p_ost_decrypt_rsa_signatures) | **POST** /v1/rsa-signatures/decrypt | Decrypt RSA signature
*Zuora::RSASignaturesApi* | [**p_ostrsa_signatures**](docs/RSASignaturesApi.md#p_ostrsa_signatures) | **POST** /v1/rsa-signatures | Generate RSA signature
*Zuora::RatePlanChargeTiersApi* | [**object_get_rate_plan_charge_tier**](docs/RatePlanChargeTiersApi.md#object_get_rate_plan_charge_tier) | **GET** /v1/object/rate-plan-charge-tier/{id} | CRUD: Retrieve RatePlanChargeTier
*Zuora::RatePlanChargesApi* | [**object_get_rate_plan_charge**](docs/RatePlanChargesApi.md#object_get_rate_plan_charge) | **GET** /v1/object/rate-plan-charge/{id} | CRUD: Retrieve RatePlanCharge
*Zuora::RatePlansApi* | [**object_get_rate_plan**](docs/RatePlansApi.md#object_get_rate_plan) | **GET** /v1/object/rate-plan/{id} | CRUD: Retrieve RatePlan
*Zuora::RefundInvoicePaymentsApi* | [**object_get_refund_invoice_payment**](docs/RefundInvoicePaymentsApi.md#object_get_refund_invoice_payment) | **GET** /v1/object/refund-invoice-payment/{id} | CRUD: Retrieve RefundInvoicePayment
*Zuora::RefundTransactionLogsApi* | [**object_get_refund_transaction_log**](docs/RefundTransactionLogsApi.md#object_get_refund_transaction_log) | **GET** /v1/object/refund-transaction-log/{id} | CRUD: Retrieve RefundTransactionLog
*Zuora::RefundsApi* | [**d_elete_refund**](docs/RefundsApi.md#d_elete_refund) | **DELETE** /v1/refunds/{refundId} | Delete refund
*Zuora::RefundsApi* | [**g_et_refund**](docs/RefundsApi.md#g_et_refund) | **GET** /v1/refunds/{refundId} | Get refund
*Zuora::RefundsApi* | [**g_et_refund_item_part**](docs/RefundsApi.md#g_et_refund_item_part) | **GET** /v1/refunds/{refundId}/parts/{refundpartid}/itemparts/{itempartid} | Get refund part item
*Zuora::RefundsApi* | [**g_et_refund_item_parts**](docs/RefundsApi.md#g_et_refund_item_parts) | **GET** /v1/refunds/{refundId}/parts/{refundpartid}/itemparts | Get refund part items
*Zuora::RefundsApi* | [**g_et_refund_part**](docs/RefundsApi.md#g_et_refund_part) | **GET** /v1/refunds/{refundId}/parts/{refundpartid} | Get refund part
*Zuora::RefundsApi* | [**g_et_refund_parts**](docs/RefundsApi.md#g_et_refund_parts) | **GET** /v1/refunds/{refundId}/parts | Get refund parts
*Zuora::RefundsApi* | [**g_et_refunds**](docs/RefundsApi.md#g_et_refunds) | **GET** /v1/refunds | Get all refunds
*Zuora::RefundsApi* | [**object_delete_refund**](docs/RefundsApi.md#object_delete_refund) | **DELETE** /v1/object/refund/{id} | CRUD: Delete refund
*Zuora::RefundsApi* | [**object_get_refund**](docs/RefundsApi.md#object_get_refund) | **GET** /v1/object/refund/{id} | CRUD: Get refund
*Zuora::RefundsApi* | [**object_post_refund**](docs/RefundsApi.md#object_post_refund) | **POST** /v1/object/refund | CRUD: Create refund
*Zuora::RefundsApi* | [**object_put_refund**](docs/RefundsApi.md#object_put_refund) | **PUT** /v1/object/refund/{id} | CRUD: Update refund
*Zuora::RefundsApi* | [**p_ut_cancel_refund**](docs/RefundsApi.md#p_ut_cancel_refund) | **PUT** /v1/refunds/{refundId}/cancel | Cancel refund
*Zuora::RefundsApi* | [**p_ut_update_refund**](docs/RefundsApi.md#p_ut_update_refund) | **PUT** /v1/refunds/{refundId} | Update refund
*Zuora::RevenueEventsApi* | [**g_et_revenue_event_details**](docs/RevenueEventsApi.md#g_et_revenue_event_details) | **GET** /v1/revenue-events/{event-number} | Get revenue event details
*Zuora::RevenueEventsApi* | [**g_et_revenue_event_for_revenue_schedule**](docs/RevenueEventsApi.md#g_et_revenue_event_for_revenue_schedule) | **GET** /v1/revenue-events/revenue-schedules/{rs-number} | Get revenue events for a revenue schedule
*Zuora::RevenueItemsApi* | [**g_et_revenue_items_by_charge_revenue_event_number**](docs/RevenueItemsApi.md#g_et_revenue_items_by_charge_revenue_event_number) | **GET** /v1/revenue-items/revenue-events/{event-number} | Get revenue items by revenue event number
*Zuora::RevenueItemsApi* | [**g_et_revenue_items_by_charge_revenue_summary_number**](docs/RevenueItemsApi.md#g_et_revenue_items_by_charge_revenue_summary_number) | **GET** /v1/revenue-items/charge-revenue-summaries/{crs-number} | Get revenue items by charge revenue summary number
*Zuora::RevenueItemsApi* | [**g_et_revenue_items_by_revenue_schedule**](docs/RevenueItemsApi.md#g_et_revenue_items_by_revenue_schedule) | **GET** /v1/revenue-items/revenue-schedules/{rs-number} | Get revenue items by revenue schedule
*Zuora::RevenueItemsApi* | [**p_ut_custom_fieldson_revenue_items_by_revenue_event**](docs/RevenueItemsApi.md#p_ut_custom_fieldson_revenue_items_by_revenue_event) | **PUT** /v1/revenue-items/revenue-events/{event-number} | Update custom fields on revenue items by revenue event number
*Zuora::RevenueItemsApi* | [**p_ut_custom_fieldson_revenue_items_by_revenue_schedule**](docs/RevenueItemsApi.md#p_ut_custom_fieldson_revenue_items_by_revenue_schedule) | **PUT** /v1/revenue-items/revenue-schedules/{rs-number} | Update custom fields on revenue items by revenue schedule number
*Zuora::RevenueRulesApi* | [**g_et_revenue_rec_ruleby_product_rate_plan_charge**](docs/RevenueRulesApi.md#g_et_revenue_rec_ruleby_product_rate_plan_charge) | **GET** /v1/revenue-recognition-rules/product-charges/{charge-key} | Get revenue recognition rule by product rate plan charge
*Zuora::RevenueRulesApi* | [**g_et_revenue_rec_rules**](docs/RevenueRulesApi.md#g_et_revenue_rec_rules) | **GET** /v1/revenue-recognition-rules/subscription-charges/{charge-key} | Get revenue recognition rule by subscription charge
*Zuora::RevenueSchedulesApi* | [**d_eleters**](docs/RevenueSchedulesApi.md#d_eleters) | **DELETE** /v1/revenue-schedules/{rs-number} | Delete revenue schedule
*Zuora::RevenueSchedulesApi* | [**g_etr_sby_credit_memo_item**](docs/RevenueSchedulesApi.md#g_etr_sby_credit_memo_item) | **GET** /v1/revenue-schedules/credit-memo-items/{cmi-id} | Get revenue schedule by credit memo item ID 
*Zuora::RevenueSchedulesApi* | [**g_etr_sby_debit_memo_item**](docs/RevenueSchedulesApi.md#g_etr_sby_debit_memo_item) | **GET** /v1/revenue-schedules/debit-memo-items/{dmi-id} | Get revenue schedule by debit memo item ID 
*Zuora::RevenueSchedulesApi* | [**g_etr_sby_invoice_item**](docs/RevenueSchedulesApi.md#g_etr_sby_invoice_item) | **GET** /v1/revenue-schedules/invoice-items/{invoice-item-id} | Get revenue schedule by invoice item ID
*Zuora::RevenueSchedulesApi* | [**g_etr_sby_invoice_item_adjustment**](docs/RevenueSchedulesApi.md#g_etr_sby_invoice_item_adjustment) | **GET** /v1/revenue-schedules/invoice-item-adjustments/{invoice-item-adj-id} | Get revenue schedule by invoice item adjustment
*Zuora::RevenueSchedulesApi* | [**g_etr_sby_product_charge_and_billing_account**](docs/RevenueSchedulesApi.md#g_etr_sby_product_charge_and_billing_account) | **GET** /v1/revenue-schedules/product-charges/{charge-key}/{account-key} | Get all revenue schedules of product charge by charge ID and billing account ID 
*Zuora::RevenueSchedulesApi* | [**g_etr_sfor_subsc_charge**](docs/RevenueSchedulesApi.md#g_etr_sfor_subsc_charge) | **GET** /v1/revenue-schedules/subscription-charges/{charge-key} | Get revenue schedule by subscription charge
*Zuora::RevenueSchedulesApi* | [**g_etrs**](docs/RevenueSchedulesApi.md#g_etrs) | **GET** /v1/revenue-schedules/{rs-number} | Get revenue schedule details
*Zuora::RevenueSchedulesApi* | [**p_ostr_sfor_credit_memo_item_distribute_by_date_range**](docs/RevenueSchedulesApi.md#p_ostr_sfor_credit_memo_item_distribute_by_date_range) | **POST** /v1/revenue-schedules/credit-memo-items/{cmi-id}/distribute-revenue-with-date-range | Create revenue schedule for credit memo item (distribute by date range) 
*Zuora::RevenueSchedulesApi* | [**p_ostr_sfor_credit_memo_item_manual_distribution**](docs/RevenueSchedulesApi.md#p_ostr_sfor_credit_memo_item_manual_distribution) | **POST** /v1/revenue-schedules/credit-memo-items/{cmi-id} | Create revenue schedule for credit memo item (manual distribution) 
*Zuora::RevenueSchedulesApi* | [**p_ostr_sfor_debit_memo_item_distribute_by_date_range**](docs/RevenueSchedulesApi.md#p_ostr_sfor_debit_memo_item_distribute_by_date_range) | **POST** /v1/revenue-schedules/debit-memo-items/{dmi-id}/distribute-revenue-with-date-range | Create revenue schedule for debit memo item (distribute by date range) 
*Zuora::RevenueSchedulesApi* | [**p_ostr_sfor_debit_memo_item_manual_distribution**](docs/RevenueSchedulesApi.md#p_ostr_sfor_debit_memo_item_manual_distribution) | **POST** /v1/revenue-schedules/debit-memo-items/{dmi-id} | Create revenue schedule for debit memo item (manual distribution) 
*Zuora::RevenueSchedulesApi* | [**p_ostr_sfor_invoice_item_adjustment_distribute_by_date_range**](docs/RevenueSchedulesApi.md#p_ostr_sfor_invoice_item_adjustment_distribute_by_date_range) | **POST** /v1/revenue-schedules/invoice-item-adjustments/{invoice-item-adj-key}/distribute-revenue-with-date-range | Create revenue schedule for Invoice Item Adjustment (distribute by date range)
*Zuora::RevenueSchedulesApi* | [**p_ostr_sfor_invoice_item_adjustment_manual_distribution**](docs/RevenueSchedulesApi.md#p_ostr_sfor_invoice_item_adjustment_manual_distribution) | **POST** /v1/revenue-schedules/invoice-item-adjustments/{invoice-item-adj-key} | Create revenue schedule for Invoice Item Adjustment (manual distribution)
*Zuora::RevenueSchedulesApi* | [**p_ostr_sfor_invoice_item_distribute_by_date_range**](docs/RevenueSchedulesApi.md#p_ostr_sfor_invoice_item_distribute_by_date_range) | **POST** /v1/revenue-schedules/invoice-items/{invoice-item-id}/distribute-revenue-with-date-range | Create revenue schedule for Invoice Item (distribute by date range)
*Zuora::RevenueSchedulesApi* | [**p_ostr_sfor_invoice_item_manual_distribution**](docs/RevenueSchedulesApi.md#p_ostr_sfor_invoice_item_manual_distribution) | **POST** /v1/revenue-schedules/invoice-items/{invoice-item-id} | Create revenue schedule for Invoice Item (manual distribution)
*Zuora::RevenueSchedulesApi* | [**p_ostr_sfor_subsc_charge**](docs/RevenueSchedulesApi.md#p_ostr_sfor_subsc_charge) | **POST** /v1/revenue-schedules/subscription-charges/{charge-key} | Create revenue schedule on subscription charge
*Zuora::RevenueSchedulesApi* | [**p_ut_revenue_across_ap**](docs/RevenueSchedulesApi.md#p_ut_revenue_across_ap) | **PUT** /v1/revenue-schedules/{rs-number}/distribute-revenue-across-accounting-periods | Distribute revenue across accounting periods
*Zuora::RevenueSchedulesApi* | [**p_ut_revenue_by_recognition_startand_end_dates**](docs/RevenueSchedulesApi.md#p_ut_revenue_by_recognition_startand_end_dates) | **PUT** /v1/revenue-schedules/{rs-number}/distribute-revenue-with-date-range | Distribute revenue by recognition start and end dates
*Zuora::RevenueSchedulesApi* | [**p_ut_revenue_specific_date**](docs/RevenueSchedulesApi.md#p_ut_revenue_specific_date) | **PUT** /v1/revenue-schedules/{rs-number}/distribute-revenue-on-specific-date | Distribute revenue on specific date
*Zuora::RevenueSchedulesApi* | [**p_utrs_basic_info**](docs/RevenueSchedulesApi.md#p_utrs_basic_info) | **PUT** /v1/revenue-schedules/{rs-number}/basic-information | Update revenue schedule basic information
*Zuora::SettingsApi* | [**g_et_revenue_automation_start_date**](docs/SettingsApi.md#g_et_revenue_automation_start_date) | **GET** /v1/settings/finance/revenue-automation-start-date | Get the revenue automation start date
*Zuora::SubscriptionProductFeaturesApi* | [**object_get_subscription_product_feature**](docs/SubscriptionProductFeaturesApi.md#object_get_subscription_product_feature) | **GET** /v1/object/subscription-product-feature/{id} | CRUD: Retrieve SubscriptionProductFeature
*Zuora::SubscriptionsApi* | [**g_et_subscriptions_by_account**](docs/SubscriptionsApi.md#g_et_subscriptions_by_account) | **GET** /v1/subscriptions/accounts/{account-key} | Get subscriptions by account
*Zuora::SubscriptionsApi* | [**g_et_subscriptions_by_key**](docs/SubscriptionsApi.md#g_et_subscriptions_by_key) | **GET** /v1/subscriptions/{subscription-key} | Get subscriptions by key
*Zuora::SubscriptionsApi* | [**g_et_subscriptions_by_key_and_version**](docs/SubscriptionsApi.md#g_et_subscriptions_by_key_and_version) | **GET** /v1/subscriptions/{subscription-key}/versions/{version} | Get subscriptions by key and version
*Zuora::SubscriptionsApi* | [**object_delete_subscription**](docs/SubscriptionsApi.md#object_delete_subscription) | **DELETE** /v1/object/subscription/{id} | CRUD: Delete Subscription
*Zuora::SubscriptionsApi* | [**object_get_subscription**](docs/SubscriptionsApi.md#object_get_subscription) | **GET** /v1/object/subscription/{id} | CRUD: Retrieve Subscription
*Zuora::SubscriptionsApi* | [**object_put_subscription**](docs/SubscriptionsApi.md#object_put_subscription) | **PUT** /v1/object/subscription/{id} | CRUD: Update Subscription
*Zuora::SubscriptionsApi* | [**p_ost_preview_subscription**](docs/SubscriptionsApi.md#p_ost_preview_subscription) | **POST** /v1/subscriptions/preview | Preview subscription
*Zuora::SubscriptionsApi* | [**p_ost_subscription**](docs/SubscriptionsApi.md#p_ost_subscription) | **POST** /v1/subscriptions | Create subscription
*Zuora::SubscriptionsApi* | [**p_ut_cancel_subscription**](docs/SubscriptionsApi.md#p_ut_cancel_subscription) | **PUT** /v1/subscriptions/{subscription-key}/cancel | Cancel subscription
*Zuora::SubscriptionsApi* | [**p_ut_renew_subscription**](docs/SubscriptionsApi.md#p_ut_renew_subscription) | **PUT** /v1/subscriptions/{subscription-key}/renew | Renew subscription
*Zuora::SubscriptionsApi* | [**p_ut_resume_subscription**](docs/SubscriptionsApi.md#p_ut_resume_subscription) | **PUT** /v1/subscriptions/{subscription-key}/resume | Resume subscription
*Zuora::SubscriptionsApi* | [**p_ut_subscription**](docs/SubscriptionsApi.md#p_ut_subscription) | **PUT** /v1/subscriptions/{subscription-key} | Update subscription
*Zuora::SubscriptionsApi* | [**p_ut_suspend_subscription**](docs/SubscriptionsApi.md#p_ut_suspend_subscription) | **PUT** /v1/subscriptions/{subscription-key}/suspend | Suspend subscription
*Zuora::SummaryJournalEntriesApi* | [**d_elete_summary_journal_entry**](docs/SummaryJournalEntriesApi.md#d_elete_summary_journal_entry) | **DELETE** /v1/journal-entries/{je-number} | Delete summary journal entry
*Zuora::SummaryJournalEntriesApi* | [**g_et_all_summary_journal_entries**](docs/SummaryJournalEntriesApi.md#g_et_all_summary_journal_entries) | **GET** /v1/journal-entries/journal-runs/{jr-number} | Get all summary journal entries in a journal run
*Zuora::SummaryJournalEntriesApi* | [**g_et_summary_journal_entry**](docs/SummaryJournalEntriesApi.md#g_et_summary_journal_entry) | **GET** /v1/journal-entries/{je-number} | Get summary journal entry
*Zuora::SummaryJournalEntriesApi* | [**p_ost_summary_journal_entry**](docs/SummaryJournalEntriesApi.md#p_ost_summary_journal_entry) | **POST** /v1/journal-entries | Create summary journal entry
*Zuora::SummaryJournalEntriesApi* | [**p_ut_basic_summary_journal_entry**](docs/SummaryJournalEntriesApi.md#p_ut_basic_summary_journal_entry) | **PUT** /v1/journal-entries/{je-number}/basic-information | Update basic information of a summary journal entry
*Zuora::SummaryJournalEntriesApi* | [**p_ut_summary_journal_entry**](docs/SummaryJournalEntriesApi.md#p_ut_summary_journal_entry) | **PUT** /v1/journal-entries/{je-number}/cancel | Cancel summary journal entry
*Zuora::TaxationItemsApi* | [**d_elete_taxation_item**](docs/TaxationItemsApi.md#d_elete_taxation_item) | **DELETE** /v1/taxationitems/{id} | Delete taxation item
*Zuora::TaxationItemsApi* | [**g_et_taxation_item**](docs/TaxationItemsApi.md#g_et_taxation_item) | **GET** /v1/taxationitems/{id} | Get taxation item 
*Zuora::TaxationItemsApi* | [**object_delete_taxation_item**](docs/TaxationItemsApi.md#object_delete_taxation_item) | **DELETE** /v1/object/taxation-item/{id} | CRUD: Delete TaxationItem
*Zuora::TaxationItemsApi* | [**object_get_taxation_item**](docs/TaxationItemsApi.md#object_get_taxation_item) | **GET** /v1/object/taxation-item/{id} | CRUD: Retrieve TaxationItem
*Zuora::TaxationItemsApi* | [**object_post_taxation_item**](docs/TaxationItemsApi.md#object_post_taxation_item) | **POST** /v1/object/taxation-item | CRUD: Create TaxationItem
*Zuora::TaxationItemsApi* | [**object_put_taxation_item**](docs/TaxationItemsApi.md#object_put_taxation_item) | **PUT** /v1/object/taxation-item/{id} | CRUD: Update TaxationItem
*Zuora::TaxationItemsApi* | [**p_ut_taxation_item**](docs/TaxationItemsApi.md#p_ut_taxation_item) | **PUT** /v1/taxationitems/{id} | Update taxation item
*Zuora::TransactionsApi* | [**g_et_transaction_invoice**](docs/TransactionsApi.md#g_et_transaction_invoice) | **GET** /v1/transactions/invoices/accounts/{account-key} | Get invoices
*Zuora::TransactionsApi* | [**g_et_transaction_payment**](docs/TransactionsApi.md#g_et_transaction_payment) | **GET** /v1/transactions/payments/accounts/{account-key} | Get payments
*Zuora::UnitOfMeasureApi* | [**object_delete_unit_of_measure**](docs/UnitOfMeasureApi.md#object_delete_unit_of_measure) | **DELETE** /v1/object/unit-of-measure/{id} | CRUD: Delete UnitOfMeasure
*Zuora::UnitOfMeasureApi* | [**object_get_unit_of_measure**](docs/UnitOfMeasureApi.md#object_get_unit_of_measure) | **GET** /v1/object/unit-of-measure/{id} | CRUD: Retrieve UnitOfMeasure
*Zuora::UnitOfMeasureApi* | [**object_post_unit_of_measure**](docs/UnitOfMeasureApi.md#object_post_unit_of_measure) | **POST** /v1/object/unit-of-measure | CRUD: Create UnitOfMeasure
*Zuora::UnitOfMeasureApi* | [**object_put_unit_of_measure**](docs/UnitOfMeasureApi.md#object_put_unit_of_measure) | **PUT** /v1/object/unit-of-measure/{id} | CRUD: Update UnitOfMeasure
*Zuora::UsageApi* | [**g_et_usage**](docs/UsageApi.md#g_et_usage) | **GET** /v1/usage/accounts/{account-key} | Get usage
*Zuora::UsageApi* | [**object_delete_usage**](docs/UsageApi.md#object_delete_usage) | **DELETE** /v1/object/usage/{id} | CRUD: Delete Usage
*Zuora::UsageApi* | [**object_get_usage**](docs/UsageApi.md#object_get_usage) | **GET** /v1/object/usage/{id} | CRUD: Retrieve Usage
*Zuora::UsageApi* | [**object_post_usage**](docs/UsageApi.md#object_post_usage) | **POST** /v1/object/usage | CRUD: Create Usage
*Zuora::UsageApi* | [**object_put_usage**](docs/UsageApi.md#object_put_usage) | **PUT** /v1/object/usage/{id} | CRUD: Update Usage
*Zuora::UsageApi* | [**p_ost_usage**](docs/UsageApi.md#p_ost_usage) | **POST** /v1/usage | Post usage
*Zuora::UsageWithRealTimeRatingApi* | [**d_elete_usage_record**](docs/UsageWithRealTimeRatingApi.md#d_elete_usage_record) | **DELETE** /usage/{id} | Delete usage record
*Zuora::UsageWithRealTimeRatingApi* | [**g_et_download_usage_file_template**](docs/UsageWithRealTimeRatingApi.md#g_et_download_usage_file_template) | **GET** /usage-imports/templates/{fileType} | Download usage file template
*Zuora::UsageWithRealTimeRatingApi* | [**g_et_download_usage_import_failure_file**](docs/UsageWithRealTimeRatingApi.md#g_et_download_usage_import_failure_file) | **GET** /usage-imports/{id}/errors | Download usage import failure file
*Zuora::UsageWithRealTimeRatingApi* | [**g_et_download_usage_import_file**](docs/UsageWithRealTimeRatingApi.md#g_et_download_usage_import_file) | **GET** /usage-imports/{id}/import-file | Download usage import file
*Zuora::UsageWithRealTimeRatingApi* | [**g_et_rating_results_by_account**](docs/UsageWithRealTimeRatingApi.md#g_et_rating_results_by_account) | **GET** /rating/rated-results/account/{accountNumber} | Get rating results by account
*Zuora::UsageWithRealTimeRatingApi* | [**g_et_rating_results_by_charge**](docs/UsageWithRealTimeRatingApi.md#g_et_rating_results_by_charge) | **GET** /rating/rated-results/charge/{chargeNumber} | Get rating results by charge
*Zuora::UsageWithRealTimeRatingApi* | [**g_et_rating_results_by_subscripiton**](docs/UsageWithRealTimeRatingApi.md#g_et_rating_results_by_subscripiton) | **GET** /rating/rated-results/subscription/{subscriptionNumber} | Get rating results by subscription
*Zuora::UsageWithRealTimeRatingApi* | [**g_et_usage_import_details**](docs/UsageWithRealTimeRatingApi.md#g_et_usage_import_details) | **GET** /usage-imports/{id}/detail | Get details of usage import
*Zuora::UsageWithRealTimeRatingApi* | [**g_et_usage_import_status**](docs/UsageWithRealTimeRatingApi.md#g_et_usage_import_status) | **GET** /usage-imports/{id}/status | Get status of usage import
*Zuora::UsageWithRealTimeRatingApi* | [**g_et_usage_imports**](docs/UsageWithRealTimeRatingApi.md#g_et_usage_imports) | **GET** /usage-imports | Get usage imports
*Zuora::UsageWithRealTimeRatingApi* | [**g_et_usage_rating_by_account**](docs/UsageWithRealTimeRatingApi.md#g_et_usage_rating_by_account) | **GET** /rating/rated-usages/account/{accountNumber} | Get usage rating by account
*Zuora::UsageWithRealTimeRatingApi* | [**g_et_usage_rating_by_charge**](docs/UsageWithRealTimeRatingApi.md#g_et_usage_rating_by_charge) | **GET** /rating/rated-usages/charge/{chargeNumber} | Get usage rating by charge
*Zuora::UsageWithRealTimeRatingApi* | [**g_et_usage_rating_by_subscription**](docs/UsageWithRealTimeRatingApi.md#g_et_usage_rating_by_subscription) | **GET** /rating/rated-usages/subscription/{subscriptionNumber} | Get usage rating by subscription
*Zuora::UsageWithRealTimeRatingApi* | [**g_et_usage_record**](docs/UsageWithRealTimeRatingApi.md#g_et_usage_record) | **GET** /usage/{id} | Get usage record
*Zuora::UsageWithRealTimeRatingApi* | [**g_et_usage_records_query**](docs/UsageWithRealTimeRatingApi.md#g_et_usage_records_query) | **GET** /usage/query | Query usage records
*Zuora::UsageWithRealTimeRatingApi* | [**g_et_usage_records_stream_query**](docs/UsageWithRealTimeRatingApi.md#g_et_usage_records_stream_query) | **GET** /usage/stream-query | Query usage records in stream
*Zuora::UsageWithRealTimeRatingApi* | [**p_ost_import_usage_file**](docs/UsageWithRealTimeRatingApi.md#p_ost_import_usage_file) | **POST** /usage-imports | Import usage file
*Zuora::UsageWithRealTimeRatingApi* | [**p_ost_usage_records**](docs/UsageWithRealTimeRatingApi.md#p_ost_usage_records) | **POST** /usage | Create usage records
*Zuora::UsageWithRealTimeRatingApi* | [**p_ut_usage_record**](docs/UsageWithRealTimeRatingApi.md#p_ut_usage_record) | **PUT** /usage/{id} | Update usage record
*Zuora::UsersApi* | [**g_et_entities_user_accessible**](docs/UsersApi.md#g_et_entities_user_accessible) | **GET** /v1/users/{username}/accessible-entities | Multi-entity: Get entities that a user can access
*Zuora::UsersApi* | [**p_ut_accept_user_access**](docs/UsersApi.md#p_ut_accept_user_access) | **PUT** /v1/users/{username}/accept-access | Multi-entity: Accept user access
*Zuora::UsersApi* | [**p_ut_deny_user_access**](docs/UsersApi.md#p_ut_deny_user_access) | **PUT** /v1/users/{username}/deny-access | Multi-entity: Deny user access
*Zuora::UsersApi* | [**p_ut_send_user_access_requests**](docs/UsersApi.md#p_ut_send_user_access_requests) | **PUT** /v1/users/{username}/request-access | Multi-entity: Send user access requests


## Documentation for Models

 - [Zuora::Account](docs/Account.md)
 - [Zuora::AccountCreditCardHolder](docs/AccountCreditCardHolder.md)
 - [Zuora::ActionsErrorResponse](docs/ActionsErrorResponse.md)
 - [Zuora::AmendRequest](docs/AmendRequest.md)
 - [Zuora::AmendRequestAmendOptions](docs/AmendRequestAmendOptions.md)
 - [Zuora::AmendRequestPreviewOptions](docs/AmendRequestPreviewOptions.md)
 - [Zuora::AmendResult](docs/AmendResult.md)
 - [Zuora::Amendment](docs/Amendment.md)
 - [Zuora::AmendmentRatePlanChargeData](docs/AmendmentRatePlanChargeData.md)
 - [Zuora::AmendmentRatePlanChargeDataRatePlanCharge](docs/AmendmentRatePlanChargeDataRatePlanCharge.md)
 - [Zuora::AmendmentRatePlanChargeTier](docs/AmendmentRatePlanChargeTier.md)
 - [Zuora::AmendmentRatePlanData](docs/AmendmentRatePlanData.md)
 - [Zuora::ApplyCreditMemoType](docs/ApplyCreditMemoType.md)
 - [Zuora::ApplyPaymentType](docs/ApplyPaymentType.md)
 - [Zuora::BatchDebitMemoType](docs/BatchDebitMemoType.md)
 - [Zuora::BatchInvoiceType](docs/BatchInvoiceType.md)
 - [Zuora::BillingDocumentQueryResponseElementType](docs/BillingDocumentQueryResponseElementType.md)
 - [Zuora::BillingOptions](docs/BillingOptions.md)
 - [Zuora::BillingOverride](docs/BillingOverride.md)
 - [Zuora::BillingPreviewResult](docs/BillingPreviewResult.md)
 - [Zuora::BillingUpdate](docs/BillingUpdate.md)
 - [Zuora::BreakdownDetail](docs/BreakdownDetail.md)
 - [Zuora::CancelSubscription](docs/CancelSubscription.md)
 - [Zuora::ChargeMetricsData](docs/ChargeMetricsData.md)
 - [Zuora::ChargeOverride](docs/ChargeOverride.md)
 - [Zuora::ChargePreviewMetrics](docs/ChargePreviewMetrics.md)
 - [Zuora::ChargePreviewMetricsCmrr](docs/ChargePreviewMetricsCmrr.md)
 - [Zuora::ChargePreviewMetricsTax](docs/ChargePreviewMetricsTax.md)
 - [Zuora::ChargePreviewMetricsTcb](docs/ChargePreviewMetricsTcb.md)
 - [Zuora::ChargePreviewMetricsTcv](docs/ChargePreviewMetricsTcv.md)
 - [Zuora::ChargeRatedResult](docs/ChargeRatedResult.md)
 - [Zuora::ChargeTier](docs/ChargeTier.md)
 - [Zuora::ChargeUpdate](docs/ChargeUpdate.md)
 - [Zuora::CommonErrorResponse](docs/CommonErrorResponse.md)
 - [Zuora::CommonRatingErrorResponse](docs/CommonRatingErrorResponse.md)
 - [Zuora::CommonRatingErrorResponseReasons](docs/CommonRatingErrorResponseReasons.md)
 - [Zuora::CommonResponseType](docs/CommonResponseType.md)
 - [Zuora::CommonUsageErrorResponse](docs/CommonUsageErrorResponse.md)
 - [Zuora::CommonUsageErrorResponseError](docs/CommonUsageErrorResponseError.md)
 - [Zuora::CommonUsageImportsErrorResponse](docs/CommonUsageImportsErrorResponse.md)
 - [Zuora::CommonUsageImportsErrorResponseError](docs/CommonUsageImportsErrorResponseError.md)
 - [Zuora::Contact](docs/Contact.md)
 - [Zuora::CreateEntityResponseType](docs/CreateEntityResponseType.md)
 - [Zuora::CreateEntityType](docs/CreateEntityType.md)
 - [Zuora::CreatePaymentType](docs/CreatePaymentType.md)
 - [Zuora::CreatePaymentTypeFinanceInformation](docs/CreatePaymentTypeFinanceInformation.md)
 - [Zuora::CreateSubscription](docs/CreateSubscription.md)
 - [Zuora::CreditCard](docs/CreditCard.md)
 - [Zuora::CreditMemoApplyDebitMemoItemRequestType](docs/CreditMemoApplyDebitMemoItemRequestType.md)
 - [Zuora::CreditMemoApplyDebitMemoRequestType](docs/CreditMemoApplyDebitMemoRequestType.md)
 - [Zuora::CreditMemoApplyInvoiceItemRequestType](docs/CreditMemoApplyInvoiceItemRequestType.md)
 - [Zuora::CreditMemoApplyInvoiceRequestType](docs/CreditMemoApplyInvoiceRequestType.md)
 - [Zuora::CreditMemoFromChargeDetailType](docs/CreditMemoFromChargeDetailType.md)
 - [Zuora::CreditMemoFromChargeDetailTypeFinanceInformation](docs/CreditMemoFromChargeDetailTypeFinanceInformation.md)
 - [Zuora::CreditMemoFromChargeType](docs/CreditMemoFromChargeType.md)
 - [Zuora::CreditMemoFromInvoiceType](docs/CreditMemoFromInvoiceType.md)
 - [Zuora::CreditMemoItemBreakdown](docs/CreditMemoItemBreakdown.md)
 - [Zuora::CreditMemoItemFromInvoiceItemType](docs/CreditMemoItemFromInvoiceItemType.md)
 - [Zuora::CreditMemoItemFromInvoiceItemTypeFinanceInformation](docs/CreditMemoItemFromInvoiceItemTypeFinanceInformation.md)
 - [Zuora::CreditMemoResponseType](docs/CreditMemoResponseType.md)
 - [Zuora::CreditMemoTaxItemFromInvoiceTaxItemType](docs/CreditMemoTaxItemFromInvoiceTaxItemType.md)
 - [Zuora::CreditMemoTaxItemFromInvoiceTaxItemTypeFinanceInformation](docs/CreditMemoTaxItemFromInvoiceTaxItemTypeFinanceInformation.md)
 - [Zuora::CreditMemoUnapplyDebitMemoItemRequestType](docs/CreditMemoUnapplyDebitMemoItemRequestType.md)
 - [Zuora::CreditMemoUnapplyDebitMemoRequestType](docs/CreditMemoUnapplyDebitMemoRequestType.md)
 - [Zuora::CreditMemoUnapplyInvoiceItemRequestType](docs/CreditMemoUnapplyInvoiceItemRequestType.md)
 - [Zuora::CreditMemoUnapplyInvoiceRequestType](docs/CreditMemoUnapplyInvoiceRequestType.md)
 - [Zuora::CustomFields](docs/CustomFields.md)
 - [Zuora::CustomFieldsDefinition](docs/CustomFieldsDefinition.md)
 - [Zuora::CustomFieldsDefinitionNoNamespace](docs/CustomFieldsDefinitionNoNamespace.md)
 - [Zuora::DELETEUsageResponseType](docs/DELETEUsageResponseType.md)
 - [Zuora::DELETEntityResponseType](docs/DELETEntityResponseType.md)
 - [Zuora::Data](docs/Data.md)
 - [Zuora::DebitMemoFromChargeDetailType](docs/DebitMemoFromChargeDetailType.md)
 - [Zuora::DebitMemoFromChargeDetailTypeFinanceInformation](docs/DebitMemoFromChargeDetailTypeFinanceInformation.md)
 - [Zuora::DebitMemoFromChargeType](docs/DebitMemoFromChargeType.md)
 - [Zuora::DebitMemoFromInvoiceType](docs/DebitMemoFromInvoiceType.md)
 - [Zuora::DebitMemoItemFromInvoiceItemType](docs/DebitMemoItemFromInvoiceItemType.md)
 - [Zuora::DebitMemoItemFromInvoiceItemTypeFinanceInformation](docs/DebitMemoItemFromInvoiceItemTypeFinanceInformation.md)
 - [Zuora::DebitMemoTaxItemFromInvoiceTaxItemType](docs/DebitMemoTaxItemFromInvoiceTaxItemType.md)
 - [Zuora::DebitMemoTaxItemFromInvoiceTaxItemTypeFinanceInformation](docs/DebitMemoTaxItemFromInvoiceTaxItemTypeFinanceInformation.md)
 - [Zuora::DeleteResult](docs/DeleteResult.md)
 - [Zuora::DiscountPricingOverride](docs/DiscountPricingOverride.md)
 - [Zuora::DiscountPricingUpdate](docs/DiscountPricingUpdate.md)
 - [Zuora::ElectronicPaymentOptions](docs/ElectronicPaymentOptions.md)
 - [Zuora::EndConditions](docs/EndConditions.md)
 - [Zuora::Errors](docs/Errors.md)
 - [Zuora::Errors1](docs/Errors1.md)
 - [Zuora::EventRevenueItemType](docs/EventRevenueItemType.md)
 - [Zuora::ExecuteResult](docs/ExecuteResult.md)
 - [Zuora::ExternalPaymentOptions](docs/ExternalPaymentOptions.md)
 - [Zuora::FinanceInformation](docs/FinanceInformation.md)
 - [Zuora::GETAPaymentGatwayResponse](docs/GETAPaymentGatwayResponse.md)
 - [Zuora::GETARPaymentType](docs/GETARPaymentType.md)
 - [Zuora::GETARPaymentTypeFinanceInformation](docs/GETARPaymentTypeFinanceInformation.md)
 - [Zuora::GETARPaymentTypewithSuccess](docs/GETARPaymentTypewithSuccess.md)
 - [Zuora::GETARatedResultType](docs/GETARatedResultType.md)
 - [Zuora::GETARatedResultTypeAdditionalInfo](docs/GETARatedResultTypeAdditionalInfo.md)
 - [Zuora::GETAccountSummaryInvoiceType](docs/GETAccountSummaryInvoiceType.md)
 - [Zuora::GETAccountSummaryPaymentInvoiceType](docs/GETAccountSummaryPaymentInvoiceType.md)
 - [Zuora::GETAccountSummaryPaymentType](docs/GETAccountSummaryPaymentType.md)
 - [Zuora::GETAccountSummarySubscriptionRatePlanType](docs/GETAccountSummarySubscriptionRatePlanType.md)
 - [Zuora::GETAccountSummarySubscriptionType](docs/GETAccountSummarySubscriptionType.md)
 - [Zuora::GETAccountSummaryType](docs/GETAccountSummaryType.md)
 - [Zuora::GETAccountSummaryTypeBasicInfo](docs/GETAccountSummaryTypeBasicInfo.md)
 - [Zuora::GETAccountSummaryTypeBasicInfoDefaultPaymentMethod](docs/GETAccountSummaryTypeBasicInfoDefaultPaymentMethod.md)
 - [Zuora::GETAccountSummaryTypeBillToContact](docs/GETAccountSummaryTypeBillToContact.md)
 - [Zuora::GETAccountSummaryTypeSoldToContact](docs/GETAccountSummaryTypeSoldToContact.md)
 - [Zuora::GETAccountSummaryTypeTaxInfo](docs/GETAccountSummaryTypeTaxInfo.md)
 - [Zuora::GETAccountSummaryUsageType](docs/GETAccountSummaryUsageType.md)
 - [Zuora::GETAccountType](docs/GETAccountType.md)
 - [Zuora::GETAccountTypeBasicInfo](docs/GETAccountTypeBasicInfo.md)
 - [Zuora::GETAccountTypeBillToContact](docs/GETAccountTypeBillToContact.md)
 - [Zuora::GETAccountTypeBillingAndPayment](docs/GETAccountTypeBillingAndPayment.md)
 - [Zuora::GETAccountTypeMetrics](docs/GETAccountTypeMetrics.md)
 - [Zuora::GETAccountTypeSoldToContact](docs/GETAccountTypeSoldToContact.md)
 - [Zuora::GETAccountingCodeItemType](docs/GETAccountingCodeItemType.md)
 - [Zuora::GETAccountingCodeItemWithoutSuccessType](docs/GETAccountingCodeItemWithoutSuccessType.md)
 - [Zuora::GETAccountingCodesType](docs/GETAccountingCodesType.md)
 - [Zuora::GETAccountingPeriodType](docs/GETAccountingPeriodType.md)
 - [Zuora::GETAccountingPeriodTypeFileIds](docs/GETAccountingPeriodTypeFileIds.md)
 - [Zuora::GETAccountingPeriodWithoutSuccessType](docs/GETAccountingPeriodWithoutSuccessType.md)
 - [Zuora::GETAccountingPeriodsType](docs/GETAccountingPeriodsType.md)
 - [Zuora::GETAmendmentType](docs/GETAmendmentType.md)
 - [Zuora::GETAttachmentResponseType](docs/GETAttachmentResponseType.md)
 - [Zuora::GETAttachmentResponseWithoutSuccessType](docs/GETAttachmentResponseWithoutSuccessType.md)
 - [Zuora::GETAttachmentsResponseType](docs/GETAttachmentsResponseType.md)
 - [Zuora::GETBillingDocumentsResponseType](docs/GETBillingDocumentsResponseType.md)
 - [Zuora::GETCMTaxItemType](docs/GETCMTaxItemType.md)
 - [Zuora::GETCMTaxItemTypeFinanceInformation](docs/GETCMTaxItemTypeFinanceInformation.md)
 - [Zuora::GETCalloutHistoryVOType](docs/GETCalloutHistoryVOType.md)
 - [Zuora::GETCalloutHistoryVOsType](docs/GETCalloutHistoryVOsType.md)
 - [Zuora::GETCatalogType](docs/GETCatalogType.md)
 - [Zuora::GETChargeRSDetailType](docs/GETChargeRSDetailType.md)
 - [Zuora::GETCreditMemoCollectionType](docs/GETCreditMemoCollectionType.md)
 - [Zuora::GETCreditMemoItemPartType](docs/GETCreditMemoItemPartType.md)
 - [Zuora::GETCreditMemoItemPartTypewithSuccess](docs/GETCreditMemoItemPartTypewithSuccess.md)
 - [Zuora::GETCreditMemoItemPartsCollectionType](docs/GETCreditMemoItemPartsCollectionType.md)
 - [Zuora::GETCreditMemoItemType](docs/GETCreditMemoItemType.md)
 - [Zuora::GETCreditMemoItemTypeFinanceInformation](docs/GETCreditMemoItemTypeFinanceInformation.md)
 - [Zuora::GETCreditMemoItemTypewithSuccess](docs/GETCreditMemoItemTypewithSuccess.md)
 - [Zuora::GETCreditMemoItemTypewithSuccessFinanceInformation](docs/GETCreditMemoItemTypewithSuccessFinanceInformation.md)
 - [Zuora::GETCreditMemoItemsListType](docs/GETCreditMemoItemsListType.md)
 - [Zuora::GETCreditMemoPartType](docs/GETCreditMemoPartType.md)
 - [Zuora::GETCreditMemoPartTypewithSuccess](docs/GETCreditMemoPartTypewithSuccess.md)
 - [Zuora::GETCreditMemoPartsCollectionType](docs/GETCreditMemoPartsCollectionType.md)
 - [Zuora::GETCreditMemoType](docs/GETCreditMemoType.md)
 - [Zuora::GETCreditMemoTypewithSuccess](docs/GETCreditMemoTypewithSuccess.md)
 - [Zuora::GETCustomExchangeRatesDataType](docs/GETCustomExchangeRatesDataType.md)
 - [Zuora::GETCustomExchangeRatesType](docs/GETCustomExchangeRatesType.md)
 - [Zuora::GETDMTaxItemType](docs/GETDMTaxItemType.md)
 - [Zuora::GETDMTaxItemTypeFinanceInformation](docs/GETDMTaxItemTypeFinanceInformation.md)
 - [Zuora::GETDebitMemoCollectionType](docs/GETDebitMemoCollectionType.md)
 - [Zuora::GETDebitMemoItemCollectionType](docs/GETDebitMemoItemCollectionType.md)
 - [Zuora::GETDebitMemoItemType](docs/GETDebitMemoItemType.md)
 - [Zuora::GETDebitMemoItemTypeFinanceInformation](docs/GETDebitMemoItemTypeFinanceInformation.md)
 - [Zuora::GETDebitMemoItemTypewithSuccess](docs/GETDebitMemoItemTypewithSuccess.md)
 - [Zuora::GETDebitMemoType](docs/GETDebitMemoType.md)
 - [Zuora::GETDebitMemoTypewithSuccess](docs/GETDebitMemoTypewithSuccess.md)
 - [Zuora::GETDiscountApplyDetailsType](docs/GETDiscountApplyDetailsType.md)
 - [Zuora::GETEmailHistoryVOType](docs/GETEmailHistoryVOType.md)
 - [Zuora::GETEmailHistoryVOsType](docs/GETEmailHistoryVOsType.md)
 - [Zuora::GETEntitiesResponseType](docs/GETEntitiesResponseType.md)
 - [Zuora::GETEntitiesResponseTypeWithId](docs/GETEntitiesResponseTypeWithId.md)
 - [Zuora::GETEntitiesType](docs/GETEntitiesType.md)
 - [Zuora::GETEntitiesUserAccessibleResponseType](docs/GETEntitiesUserAccessibleResponseType.md)
 - [Zuora::GETEntityConnectionsArrayItemsType](docs/GETEntityConnectionsArrayItemsType.md)
 - [Zuora::GETEntityConnectionsResponseType](docs/GETEntityConnectionsResponseType.md)
 - [Zuora::GETInvoiceFileType](docs/GETInvoiceFileType.md)
 - [Zuora::GETInvoiceFileWrapper](docs/GETInvoiceFileWrapper.md)
 - [Zuora::GETInvoiceType](docs/GETInvoiceType.md)
 - [Zuora::GETInvoicesInvoiceItemType](docs/GETInvoicesInvoiceItemType.md)
 - [Zuora::GETJournalEntriesInJournalRunType](docs/GETJournalEntriesInJournalRunType.md)
 - [Zuora::GETJournalEntryDetailType](docs/GETJournalEntryDetailType.md)
 - [Zuora::GETJournalEntryDetailTypeWithoutSuccess](docs/GETJournalEntryDetailTypeWithoutSuccess.md)
 - [Zuora::GETJournalEntryItemType](docs/GETJournalEntryItemType.md)
 - [Zuora::GETJournalEntrySegmentType](docs/GETJournalEntrySegmentType.md)
 - [Zuora::GETJournalRunTransactionType](docs/GETJournalRunTransactionType.md)
 - [Zuora::GETJournalRunType](docs/GETJournalRunType.md)
 - [Zuora::GETMassUpdateType](docs/GETMassUpdateType.md)
 - [Zuora::GETPaidInvoicesType](docs/GETPaidInvoicesType.md)
 - [Zuora::GETPaymentGatwaysResponse](docs/GETPaymentGatwaysResponse.md)
 - [Zuora::GETPaymentItemPartCollectionType](docs/GETPaymentItemPartCollectionType.md)
 - [Zuora::GETPaymentItemPartType](docs/GETPaymentItemPartType.md)
 - [Zuora::GETPaymentItemPartTypewithSuccess](docs/GETPaymentItemPartTypewithSuccess.md)
 - [Zuora::GETPaymentMethodType](docs/GETPaymentMethodType.md)
 - [Zuora::GETPaymentMethodTypeCardHolderInfo](docs/GETPaymentMethodTypeCardHolderInfo.md)
 - [Zuora::GETPaymentMethodsType](docs/GETPaymentMethodsType.md)
 - [Zuora::GETPaymentPartType](docs/GETPaymentPartType.md)
 - [Zuora::GETPaymentPartTypewithSuccess](docs/GETPaymentPartTypewithSuccess.md)
 - [Zuora::GETPaymentPartsCollectionType](docs/GETPaymentPartsCollectionType.md)
 - [Zuora::GETPaymentRunCollectionType](docs/GETPaymentRunCollectionType.md)
 - [Zuora::GETPaymentRunSummaryResponse](docs/GETPaymentRunSummaryResponse.md)
 - [Zuora::GETPaymentRunSummaryTotalValues](docs/GETPaymentRunSummaryTotalValues.md)
 - [Zuora::GETPaymentRunType](docs/GETPaymentRunType.md)
 - [Zuora::GETPaymentType](docs/GETPaymentType.md)
 - [Zuora::GETPaymentsType](docs/GETPaymentsType.md)
 - [Zuora::GETProductDiscountApplyDetailsType](docs/GETProductDiscountApplyDetailsType.md)
 - [Zuora::GETProductRatePlanChargePricingTierType](docs/GETProductRatePlanChargePricingTierType.md)
 - [Zuora::GETProductRatePlanChargePricingType](docs/GETProductRatePlanChargePricingType.md)
 - [Zuora::GETProductRatePlanChargeType](docs/GETProductRatePlanChargeType.md)
 - [Zuora::GETProductRatePlanType](docs/GETProductRatePlanType.md)
 - [Zuora::GETProductType](docs/GETProductType.md)
 - [Zuora::GETRSDetailForProductChargeType](docs/GETRSDetailForProductChargeType.md)
 - [Zuora::GETRSDetailType](docs/GETRSDetailType.md)
 - [Zuora::GETRSDetailWithoutSuccessType](docs/GETRSDetailWithoutSuccessType.md)
 - [Zuora::GETRSDetailsByChargeType](docs/GETRSDetailsByChargeType.md)
 - [Zuora::GETRSDetailsByProductChargeType](docs/GETRSDetailsByProductChargeType.md)
 - [Zuora::GETRefundCollectionType](docs/GETRefundCollectionType.md)
 - [Zuora::GETRefundCreditMemoType](docs/GETRefundCreditMemoType.md)
 - [Zuora::GETRefundCreditMemoTypeFinanceInformation](docs/GETRefundCreditMemoTypeFinanceInformation.md)
 - [Zuora::GETRefundItemPartCollectionType](docs/GETRefundItemPartCollectionType.md)
 - [Zuora::GETRefundItemPartType](docs/GETRefundItemPartType.md)
 - [Zuora::GETRefundItemPartTypewithSuccess](docs/GETRefundItemPartTypewithSuccess.md)
 - [Zuora::GETRefundPartCollectionType](docs/GETRefundPartCollectionType.md)
 - [Zuora::GETRefundPaymentType](docs/GETRefundPaymentType.md)
 - [Zuora::GETRefundType](docs/GETRefundType.md)
 - [Zuora::GETRefundTypewithSuccess](docs/GETRefundTypewithSuccess.md)
 - [Zuora::GETRevenueEventDetailType](docs/GETRevenueEventDetailType.md)
 - [Zuora::GETRevenueEventDetailWithoutSuccessType](docs/GETRevenueEventDetailWithoutSuccessType.md)
 - [Zuora::GETRevenueEventDetailsType](docs/GETRevenueEventDetailsType.md)
 - [Zuora::GETRevenueItemType](docs/GETRevenueItemType.md)
 - [Zuora::GETRevenueItemsType](docs/GETRevenueItemsType.md)
 - [Zuora::GETRevenueRecognitionRuleAssociationType](docs/GETRevenueRecognitionRuleAssociationType.md)
 - [Zuora::GETRevenueStartDateSettingType](docs/GETRevenueStartDateSettingType.md)
 - [Zuora::GETRsRevenueItemType](docs/GETRsRevenueItemType.md)
 - [Zuora::GETRsRevenueItemsType](docs/GETRsRevenueItemsType.md)
 - [Zuora::GETSubscriptionProductFeatureType](docs/GETSubscriptionProductFeatureType.md)
 - [Zuora::GETSubscriptionRatePlanChargesType](docs/GETSubscriptionRatePlanChargesType.md)
 - [Zuora::GETSubscriptionRatePlanType](docs/GETSubscriptionRatePlanType.md)
 - [Zuora::GETSubscriptionType](docs/GETSubscriptionType.md)
 - [Zuora::GETSubscriptionTypeWithSuccess](docs/GETSubscriptionTypeWithSuccess.md)
 - [Zuora::GETSubscriptionWrapper](docs/GETSubscriptionWrapper.md)
 - [Zuora::GETTaxationItemListType](docs/GETTaxationItemListType.md)
 - [Zuora::GETTaxationItemType](docs/GETTaxationItemType.md)
 - [Zuora::GETTaxationItemTypeFinanceInformation](docs/GETTaxationItemTypeFinanceInformation.md)
 - [Zuora::GETTaxationItemTypewithSuccess](docs/GETTaxationItemTypewithSuccess.md)
 - [Zuora::GETTierType](docs/GETTierType.md)
 - [Zuora::GETUsageImportStatusResponseType](docs/GETUsageImportStatusResponseType.md)
 - [Zuora::GETUsageResponseType](docs/GETUsageResponseType.md)
 - [Zuora::GETUsageType](docs/GETUsageType.md)
 - [Zuora::GETUsageWrapper](docs/GETUsageWrapper.md)
 - [Zuora::GatewayOption](docs/GatewayOption.md)
 - [Zuora::GenerateBillingDocumentResponseType](docs/GenerateBillingDocumentResponseType.md)
 - [Zuora::GetARatedUsageResultType](docs/GetARatedUsageResultType.md)
 - [Zuora::GetAllOrdersResponseType](docs/GetAllOrdersResponseType.md)
 - [Zuora::GetBillingPreviewRunResponse](docs/GetBillingPreviewRunResponse.md)
 - [Zuora::GetCustomFieldsDefinitionsResponse](docs/GetCustomFieldsDefinitionsResponse.md)
 - [Zuora::GetCustomFieldsDefinitionsResponseNoNamespace](docs/GetCustomFieldsDefinitionsResponseNoNamespace.md)
 - [Zuora::GetCustomFieldsNamespacesResponse](docs/GetCustomFieldsNamespacesResponse.md)
 - [Zuora::GetCustomFieldsTypesResponse](docs/GetCustomFieldsTypesResponse.md)
 - [Zuora::GetCustomFieldsTypesResponseNoNamespace](docs/GetCustomFieldsTypesResponseNoNamespace.md)
 - [Zuora::GetDebitMemoApplicationPartCollectionType](docs/GetDebitMemoApplicationPartCollectionType.md)
 - [Zuora::GetDebitMemoApplicationPartType](docs/GetDebitMemoApplicationPartType.md)
 - [Zuora::GetHostedPageType](docs/GetHostedPageType.md)
 - [Zuora::GetHostedPagesType](docs/GetHostedPagesType.md)
 - [Zuora::GetInvoiceApplicationPartCollectionType](docs/GetInvoiceApplicationPartCollectionType.md)
 - [Zuora::GetInvoiceApplicationPartType](docs/GetInvoiceApplicationPartType.md)
 - [Zuora::GetOrderBillingInfoResponseTypeBillingInfo](docs/GetOrderBillingInfoResponseTypeBillingInfo.md)
 - [Zuora::GetProductFeatureType](docs/GetProductFeatureType.md)
 - [Zuora::GetRatedResultsType](docs/GetRatedResultsType.md)
 - [Zuora::GetRatedUsageResultsType](docs/GetRatedUsageResultsType.md)
 - [Zuora::GetUsageDetailResponseType](docs/GetUsageDetailResponseType.md)
 - [Zuora::InitialTerm](docs/InitialTerm.md)
 - [Zuora::InlineResponse200](docs/InlineResponse200.md)
 - [Zuora::Invoice](docs/Invoice.md)
 - [Zuora::InvoiceData](docs/InvoiceData.md)
 - [Zuora::InvoiceDataInvoice](docs/InvoiceDataInvoice.md)
 - [Zuora::InvoiceItem](docs/InvoiceItem.md)
 - [Zuora::InvoiceItemBreakdown](docs/InvoiceItemBreakdown.md)
 - [Zuora::InvoiceItemPreviewResult](docs/InvoiceItemPreviewResult.md)
 - [Zuora::InvoiceItemPreviewResultAdditionalInfo](docs/InvoiceItemPreviewResultAdditionalInfo.md)
 - [Zuora::InvoicePayment](docs/InvoicePayment.md)
 - [Zuora::InvoicePaymentData](docs/InvoicePaymentData.md)
 - [Zuora::InvoiceProcessingOptions](docs/InvoiceProcessingOptions.md)
 - [Zuora::InvoiceResponseType](docs/InvoiceResponseType.md)
 - [Zuora::LastTerm](docs/LastTerm.md)
 - [Zuora::ListOfExchangeRates](docs/ListOfExchangeRates.md)
 - [Zuora::NewChargeMetrics](docs/NewChargeMetrics.md)
 - [Zuora::NewSubscriptionOwnerAccount](docs/NewSubscriptionOwnerAccount.md)
 - [Zuora::ObjectCustomFields](docs/ObjectCustomFields.md)
 - [Zuora::OneTimeFlatFeePricingOverride](docs/OneTimeFlatFeePricingOverride.md)
 - [Zuora::OneTimePerUnitPricingOverride](docs/OneTimePerUnitPricingOverride.md)
 - [Zuora::OneTimeTieredPricingOverride](docs/OneTimeTieredPricingOverride.md)
 - [Zuora::OneTimeVolumePricingOverride](docs/OneTimeVolumePricingOverride.md)
 - [Zuora::Order](docs/Order.md)
 - [Zuora::OrderAction](docs/OrderAction.md)
 - [Zuora::OrderActionRequest](docs/OrderActionRequest.md)
 - [Zuora::OrderMetrics](docs/OrderMetrics.md)
 - [Zuora::OrderMetricsInner](docs/OrderMetricsInner.md)
 - [Zuora::OrderRatedResult](docs/OrderRatedResult.md)
 - [Zuora::OrderSubscriptions](docs/OrderSubscriptions.md)
 - [Zuora::OwnerTransfer](docs/OwnerTransfer.md)
 - [Zuora::POSTAccountResponseType](docs/POSTAccountResponseType.md)
 - [Zuora::POSTAccountType](docs/POSTAccountType.md)
 - [Zuora::POSTAccountTypeBillToContact](docs/POSTAccountTypeBillToContact.md)
 - [Zuora::POSTAccountTypeCreditCard](docs/POSTAccountTypeCreditCard.md)
 - [Zuora::POSTAccountTypeCreditCardCardHolderInfo](docs/POSTAccountTypeCreditCardCardHolderInfo.md)
 - [Zuora::POSTAccountTypeSoldToContact](docs/POSTAccountTypeSoldToContact.md)
 - [Zuora::POSTAccountTypeSubscription](docs/POSTAccountTypeSubscription.md)
 - [Zuora::POSTAccountTypeTaxInfo](docs/POSTAccountTypeTaxInfo.md)
 - [Zuora::POSTAccountingCodeResponseType](docs/POSTAccountingCodeResponseType.md)
 - [Zuora::POSTAccountingCodeType](docs/POSTAccountingCodeType.md)
 - [Zuora::POSTAccountingPeriodResponseType](docs/POSTAccountingPeriodResponseType.md)
 - [Zuora::POSTAccountingPeriodType](docs/POSTAccountingPeriodType.md)
 - [Zuora::POSTAttachmentResponseType](docs/POSTAttachmentResponseType.md)
 - [Zuora::POSTBillingPreviewCreditMemoItem](docs/POSTBillingPreviewCreditMemoItem.md)
 - [Zuora::POSTBillingPreviewInvoiceItem](docs/POSTBillingPreviewInvoiceItem.md)
 - [Zuora::POSTDecryptResponseType](docs/POSTDecryptResponseType.md)
 - [Zuora::POSTDecryptionType](docs/POSTDecryptionType.md)
 - [Zuora::POSTDistributionItemType](docs/POSTDistributionItemType.md)
 - [Zuora::POSTEmailBillingDocfromBillRunType](docs/POSTEmailBillingDocfromBillRunType.md)
 - [Zuora::POSTEntityConnectionsResponseType](docs/POSTEntityConnectionsResponseType.md)
 - [Zuora::POSTEntityConnectionsType](docs/POSTEntityConnectionsType.md)
 - [Zuora::POSTHMACSignatureResponseType](docs/POSTHMACSignatureResponseType.md)
 - [Zuora::POSTHMACSignatureType](docs/POSTHMACSignatureType.md)
 - [Zuora::POSTInvoiceCollectCreditMemosType](docs/POSTInvoiceCollectCreditMemosType.md)
 - [Zuora::POSTInvoiceCollectInvoicesType](docs/POSTInvoiceCollectInvoicesType.md)
 - [Zuora::POSTInvoiceCollectResponseType](docs/POSTInvoiceCollectResponseType.md)
 - [Zuora::POSTInvoiceCollectType](docs/POSTInvoiceCollectType.md)
 - [Zuora::POSTJournalEntryItemType](docs/POSTJournalEntryItemType.md)
 - [Zuora::POSTJournalEntryResponseType](docs/POSTJournalEntryResponseType.md)
 - [Zuora::POSTJournalEntrySegmentType](docs/POSTJournalEntrySegmentType.md)
 - [Zuora::POSTJournalEntryType](docs/POSTJournalEntryType.md)
 - [Zuora::POSTJournalRunResponseType](docs/POSTJournalRunResponseType.md)
 - [Zuora::POSTJournalRunTransactionType](docs/POSTJournalRunTransactionType.md)
 - [Zuora::POSTJournalRunType](docs/POSTJournalRunType.md)
 - [Zuora::POSTMassUpdateResponseType](docs/POSTMassUpdateResponseType.md)
 - [Zuora::POSTMemoPdfResponse](docs/POSTMemoPdfResponse.md)
 - [Zuora::POSTOrderPreviewRequestType](docs/POSTOrderPreviewRequestType.md)
 - [Zuora::POSTOrderPreviewRequestTypeSubscriptions](docs/POSTOrderPreviewRequestTypeSubscriptions.md)
 - [Zuora::POSTOrderRequestType](docs/POSTOrderRequestType.md)
 - [Zuora::POSTOrderRequestTypeSubscriptions](docs/POSTOrderRequestTypeSubscriptions.md)
 - [Zuora::POSTPaymentMethodDecryption](docs/POSTPaymentMethodDecryption.md)
 - [Zuora::POSTPaymentMethodDecryptionCardHolderInfo](docs/POSTPaymentMethodDecryptionCardHolderInfo.md)
 - [Zuora::POSTPaymentMethodResponseDecryption](docs/POSTPaymentMethodResponseDecryption.md)
 - [Zuora::POSTPaymentMethodResponseType](docs/POSTPaymentMethodResponseType.md)
 - [Zuora::POSTPaymentMethodType](docs/POSTPaymentMethodType.md)
 - [Zuora::POSTPaymentMethodTypeCardHolderInfo](docs/POSTPaymentMethodTypeCardHolderInfo.md)
 - [Zuora::POSTPaymentRunRequest](docs/POSTPaymentRunRequest.md)
 - [Zuora::POSTQuoteDocResponseType](docs/POSTQuoteDocResponseType.md)
 - [Zuora::POSTQuoteDocType](docs/POSTQuoteDocType.md)
 - [Zuora::POSTRSASignatureResponseType](docs/POSTRSASignatureResponseType.md)
 - [Zuora::POSTRSASignatureType](docs/POSTRSASignatureType.md)
 - [Zuora::POSTRevenueScheduleByChargeResponseType](docs/POSTRevenueScheduleByChargeResponseType.md)
 - [Zuora::POSTRevenueScheduleByChargeType](docs/POSTRevenueScheduleByChargeType.md)
 - [Zuora::POSTRevenueScheduleByChargeTypeRevenueEvent](docs/POSTRevenueScheduleByChargeTypeRevenueEvent.md)
 - [Zuora::POSTRevenueScheduleByDateRangeType](docs/POSTRevenueScheduleByDateRangeType.md)
 - [Zuora::POSTRevenueScheduleByDateRangeTypeRevenueEvent](docs/POSTRevenueScheduleByDateRangeTypeRevenueEvent.md)
 - [Zuora::POSTRevenueScheduleByTransactionRatablyType](docs/POSTRevenueScheduleByTransactionRatablyType.md)
 - [Zuora::POSTRevenueScheduleByTransactionRatablyTypeRevenueEvent](docs/POSTRevenueScheduleByTransactionRatablyTypeRevenueEvent.md)
 - [Zuora::POSTRevenueScheduleByTransactionResponseType](docs/POSTRevenueScheduleByTransactionResponseType.md)
 - [Zuora::POSTRevenueScheduleByTransactionType](docs/POSTRevenueScheduleByTransactionType.md)
 - [Zuora::POSTRevenueScheduleByTransactionTypeRevenueEvent](docs/POSTRevenueScheduleByTransactionTypeRevenueEvent.md)
 - [Zuora::POSTScCreateType](docs/POSTScCreateType.md)
 - [Zuora::POSTSrpCreateType](docs/POSTSrpCreateType.md)
 - [Zuora::POSTSubscriptionCancellationResponseType](docs/POSTSubscriptionCancellationResponseType.md)
 - [Zuora::POSTSubscriptionCancellationType](docs/POSTSubscriptionCancellationType.md)
 - [Zuora::POSTSubscriptionPreviewCreditMemoItemsType](docs/POSTSubscriptionPreviewCreditMemoItemsType.md)
 - [Zuora::POSTSubscriptionPreviewInvoiceItemsType](docs/POSTSubscriptionPreviewInvoiceItemsType.md)
 - [Zuora::POSTSubscriptionPreviewResponseType](docs/POSTSubscriptionPreviewResponseType.md)
 - [Zuora::POSTSubscriptionPreviewResponseTypeChargeMetrics](docs/POSTSubscriptionPreviewResponseTypeChargeMetrics.md)
 - [Zuora::POSTSubscriptionPreviewResponseTypeCreditMemo](docs/POSTSubscriptionPreviewResponseTypeCreditMemo.md)
 - [Zuora::POSTSubscriptionPreviewType](docs/POSTSubscriptionPreviewType.md)
 - [Zuora::POSTSubscriptionPreviewTypePreviewAccountInfo](docs/POSTSubscriptionPreviewTypePreviewAccountInfo.md)
 - [Zuora::POSTSubscriptionPreviewTypePreviewAccountInfoBillToContact](docs/POSTSubscriptionPreviewTypePreviewAccountInfoBillToContact.md)
 - [Zuora::POSTSubscriptionResponseType](docs/POSTSubscriptionResponseType.md)
 - [Zuora::POSTSubscriptionType](docs/POSTSubscriptionType.md)
 - [Zuora::POSTTaxationItemForCMType](docs/POSTTaxationItemForCMType.md)
 - [Zuora::POSTTaxationItemForCMTypeFinanceInformation](docs/POSTTaxationItemForCMTypeFinanceInformation.md)
 - [Zuora::POSTTaxationItemForDMType](docs/POSTTaxationItemForDMType.md)
 - [Zuora::POSTTaxationItemForDMTypeFinanceInformation](docs/POSTTaxationItemForDMTypeFinanceInformation.md)
 - [Zuora::POSTTaxationItemListForCMType](docs/POSTTaxationItemListForCMType.md)
 - [Zuora::POSTTaxationItemListForDMType](docs/POSTTaxationItemListForDMType.md)
 - [Zuora::POSTTierType](docs/POSTTierType.md)
 - [Zuora::POSTUsageImportResponseType](docs/POSTUsageImportResponseType.md)
 - [Zuora::POSTUsageRecordRequestType](docs/POSTUsageRecordRequestType.md)
 - [Zuora::POSTUsageRecordResponseType](docs/POSTUsageRecordResponseType.md)
 - [Zuora::POSTUsageResponseType](docs/POSTUsageResponseType.md)
 - [Zuora::POSTUsageType](docs/POSTUsageType.md)
 - [Zuora::PUTAcceptUserAccessResponseType](docs/PUTAcceptUserAccessResponseType.md)
 - [Zuora::PUTAccountType](docs/PUTAccountType.md)
 - [Zuora::PUTAccountTypeBillToContact](docs/PUTAccountTypeBillToContact.md)
 - [Zuora::PUTAccountTypeSoldToContact](docs/PUTAccountTypeSoldToContact.md)
 - [Zuora::PUTAccountingCodeType](docs/PUTAccountingCodeType.md)
 - [Zuora::PUTAccountingPeriodType](docs/PUTAccountingPeriodType.md)
 - [Zuora::PUTAllocateManuallyType](docs/PUTAllocateManuallyType.md)
 - [Zuora::PUTAttachmentType](docs/PUTAttachmentType.md)
 - [Zuora::PUTBasicSummaryJournalEntryType](docs/PUTBasicSummaryJournalEntryType.md)
 - [Zuora::PUTBatchDebitMemosRequest](docs/PUTBatchDebitMemosRequest.md)
 - [Zuora::PUTCatalogType](docs/PUTCatalogType.md)
 - [Zuora::PUTCreditMemoItemType](docs/PUTCreditMemoItemType.md)
 - [Zuora::PUTCreditMemoItemTypeFinanceInformation](docs/PUTCreditMemoItemTypeFinanceInformation.md)
 - [Zuora::PUTCreditMemoType](docs/PUTCreditMemoType.md)
 - [Zuora::PUTDebitMemoItemType](docs/PUTDebitMemoItemType.md)
 - [Zuora::PUTDebitMemoItemTypeFinanceInformation](docs/PUTDebitMemoItemTypeFinanceInformation.md)
 - [Zuora::PUTDebitMemoType](docs/PUTDebitMemoType.md)
 - [Zuora::PUTDenyUserAccessResponseType](docs/PUTDenyUserAccessResponseType.md)
 - [Zuora::PUTEntityConnectionsAcceptResponseType](docs/PUTEntityConnectionsAcceptResponseType.md)
 - [Zuora::PUTEntityConnectionsDenyResponseType](docs/PUTEntityConnectionsDenyResponseType.md)
 - [Zuora::PUTEntityConnectionsDisconnectResponseType](docs/PUTEntityConnectionsDisconnectResponseType.md)
 - [Zuora::PUTEventRIDetailType](docs/PUTEventRIDetailType.md)
 - [Zuora::PUTJournalEntryItemType](docs/PUTJournalEntryItemType.md)
 - [Zuora::PUTOrderPatchRequestType](docs/PUTOrderPatchRequestType.md)
 - [Zuora::PUTOrderPatchRequestTypeOrderActions](docs/PUTOrderPatchRequestTypeOrderActions.md)
 - [Zuora::PUTOrderPatchRequestTypeSubscriptions](docs/PUTOrderPatchRequestTypeSubscriptions.md)
 - [Zuora::PUTPaymentMethodResponseType](docs/PUTPaymentMethodResponseType.md)
 - [Zuora::PUTPaymentMethodType](docs/PUTPaymentMethodType.md)
 - [Zuora::PUTPaymentRunRequest](docs/PUTPaymentRunRequest.md)
 - [Zuora::PUTRSBasicInfoType](docs/PUTRSBasicInfoType.md)
 - [Zuora::PUTRSTermType](docs/PUTRSTermType.md)
 - [Zuora::PUTRefundType](docs/PUTRefundType.md)
 - [Zuora::PUTRefundTypeFinanceInformation](docs/PUTRefundTypeFinanceInformation.md)
 - [Zuora::PUTRenewSubscriptionResponseType](docs/PUTRenewSubscriptionResponseType.md)
 - [Zuora::PUTRenewSubscriptionType](docs/PUTRenewSubscriptionType.md)
 - [Zuora::PUTRevenueScheduleResponseType](docs/PUTRevenueScheduleResponseType.md)
 - [Zuora::PUTScAddType](docs/PUTScAddType.md)
 - [Zuora::PUTScUpdateType](docs/PUTScUpdateType.md)
 - [Zuora::PUTScheduleRIDetailType](docs/PUTScheduleRIDetailType.md)
 - [Zuora::PUTSendUserAccessRequestResponseType](docs/PUTSendUserAccessRequestResponseType.md)
 - [Zuora::PUTSendUserAccessRequestType](docs/PUTSendUserAccessRequestType.md)
 - [Zuora::PUTSpecificDateAllocationType](docs/PUTSpecificDateAllocationType.md)
 - [Zuora::PUTSrpAddType](docs/PUTSrpAddType.md)
 - [Zuora::PUTSrpRemoveType](docs/PUTSrpRemoveType.md)
 - [Zuora::PUTSrpUpdateType](docs/PUTSrpUpdateType.md)
 - [Zuora::PUTSubscriptionPatchRequestType](docs/PUTSubscriptionPatchRequestType.md)
 - [Zuora::PUTSubscriptionPatchRequestTypeCharges](docs/PUTSubscriptionPatchRequestTypeCharges.md)
 - [Zuora::PUTSubscriptionPatchRequestTypeRatePlans](docs/PUTSubscriptionPatchRequestTypeRatePlans.md)
 - [Zuora::PUTSubscriptionPreviewInvoiceItemsType](docs/PUTSubscriptionPreviewInvoiceItemsType.md)
 - [Zuora::PUTSubscriptionResponseType](docs/PUTSubscriptionResponseType.md)
 - [Zuora::PUTSubscriptionResponseTypeChargeMetrics](docs/PUTSubscriptionResponseTypeChargeMetrics.md)
 - [Zuora::PUTSubscriptionResponseTypeCreditMemo](docs/PUTSubscriptionResponseTypeCreditMemo.md)
 - [Zuora::PUTSubscriptionResumeResponseType](docs/PUTSubscriptionResumeResponseType.md)
 - [Zuora::PUTSubscriptionResumeType](docs/PUTSubscriptionResumeType.md)
 - [Zuora::PUTSubscriptionSuspendResponseType](docs/PUTSubscriptionSuspendResponseType.md)
 - [Zuora::PUTSubscriptionSuspendType](docs/PUTSubscriptionSuspendType.md)
 - [Zuora::PUTSubscriptionType](docs/PUTSubscriptionType.md)
 - [Zuora::PUTTaxationItemType](docs/PUTTaxationItemType.md)
 - [Zuora::PUTUpdateUsageResponseType](docs/PUTUpdateUsageResponseType.md)
 - [Zuora::PUTUsageType](docs/PUTUsageType.md)
 - [Zuora::PUTVerifyPaymentMethodResponseType](docs/PUTVerifyPaymentMethodResponseType.md)
 - [Zuora::PUTVerifyPaymentMethodType](docs/PUTVerifyPaymentMethodType.md)
 - [Zuora::PUTVerifyPaymentMethodTypeGatewayOptions](docs/PUTVerifyPaymentMethodTypeGatewayOptions.md)
 - [Zuora::PaymentCollectionResponseType](docs/PaymentCollectionResponseType.md)
 - [Zuora::PaymentDebitMemoApplicationApplyRequestType](docs/PaymentDebitMemoApplicationApplyRequestType.md)
 - [Zuora::PaymentDebitMemoApplicationCreateRequestType](docs/PaymentDebitMemoApplicationCreateRequestType.md)
 - [Zuora::PaymentDebitMemoApplicationItemApplyRequestType](docs/PaymentDebitMemoApplicationItemApplyRequestType.md)
 - [Zuora::PaymentDebitMemoApplicationItemCreateRequestType](docs/PaymentDebitMemoApplicationItemCreateRequestType.md)
 - [Zuora::PaymentDebitMemoApplicationItemUnapplyRequestType](docs/PaymentDebitMemoApplicationItemUnapplyRequestType.md)
 - [Zuora::PaymentDebitMemoApplicationUnapplyRequestType](docs/PaymentDebitMemoApplicationUnapplyRequestType.md)
 - [Zuora::PaymentInvoiceApplicationApplyRequestType](docs/PaymentInvoiceApplicationApplyRequestType.md)
 - [Zuora::PaymentInvoiceApplicationCreateRequestType](docs/PaymentInvoiceApplicationCreateRequestType.md)
 - [Zuora::PaymentInvoiceApplicationItemApplyRequestType](docs/PaymentInvoiceApplicationItemApplyRequestType.md)
 - [Zuora::PaymentInvoiceApplicationItemCreateRequestType](docs/PaymentInvoiceApplicationItemCreateRequestType.md)
 - [Zuora::PaymentInvoiceApplicationItemUnapplyRequestType](docs/PaymentInvoiceApplicationItemUnapplyRequestType.md)
 - [Zuora::PaymentInvoiceApplicationUnapplyRequestType](docs/PaymentInvoiceApplicationUnapplyRequestType.md)
 - [Zuora::PostBillingPreviewParam](docs/PostBillingPreviewParam.md)
 - [Zuora::PostBillingPreviewRunParam](docs/PostBillingPreviewRunParam.md)
 - [Zuora::PostCreditMemoEmailRequestType](docs/PostCreditMemoEmailRequestType.md)
 - [Zuora::PostDebitMemoEmailType](docs/PostDebitMemoEmailType.md)
 - [Zuora::PostGenerateBillingDocumentType](docs/PostGenerateBillingDocumentType.md)
 - [Zuora::PostInvoiceEmailRequestType](docs/PostInvoiceEmailRequestType.md)
 - [Zuora::PostNonRefRefundType](docs/PostNonRefRefundType.md)
 - [Zuora::PostNonRefRefundTypeFinanceInformation](docs/PostNonRefRefundTypeFinanceInformation.md)
 - [Zuora::PostRefundType](docs/PostRefundType.md)
 - [Zuora::PostRefundTypeFinanceInformation](docs/PostRefundTypeFinanceInformation.md)
 - [Zuora::PreviewAccountInfo](docs/PreviewAccountInfo.md)
 - [Zuora::PreviewContactInfo](docs/PreviewContactInfo.md)
 - [Zuora::PreviewOptions](docs/PreviewOptions.md)
 - [Zuora::PreviewResult](docs/PreviewResult.md)
 - [Zuora::PreviewResultChargeMetrics](docs/PreviewResultChargeMetrics.md)
 - [Zuora::PreviewResultCreditMemos](docs/PreviewResultCreditMemos.md)
 - [Zuora::PreviewResultInvoices](docs/PreviewResultInvoices.md)
 - [Zuora::PreviewResultOrderActions](docs/PreviewResultOrderActions.md)
 - [Zuora::PreviewResultOrderMetrics](docs/PreviewResultOrderMetrics.md)
 - [Zuora::PriceChangeParams](docs/PriceChangeParams.md)
 - [Zuora::PricingOverride](docs/PricingOverride.md)
 - [Zuora::PricingUpdate](docs/PricingUpdate.md)
 - [Zuora::ProcessingOptions](docs/ProcessingOptions.md)
 - [Zuora::ProvisionEntityResponseType](docs/ProvisionEntityResponseType.md)
 - [Zuora::ProxyActionamendRequest](docs/ProxyActionamendRequest.md)
 - [Zuora::ProxyActionamendResponse](docs/ProxyActionamendResponse.md)
 - [Zuora::ProxyActioncreateRequest](docs/ProxyActioncreateRequest.md)
 - [Zuora::ProxyActioncreateResponse](docs/ProxyActioncreateResponse.md)
 - [Zuora::ProxyActiondeleteRequest](docs/ProxyActiondeleteRequest.md)
 - [Zuora::ProxyActiondeleteResponse](docs/ProxyActiondeleteResponse.md)
 - [Zuora::ProxyActionexecuteRequest](docs/ProxyActionexecuteRequest.md)
 - [Zuora::ProxyActionexecuteResponse](docs/ProxyActionexecuteResponse.md)
 - [Zuora::ProxyActiongenerateRequest](docs/ProxyActiongenerateRequest.md)
 - [Zuora::ProxyActiongenerateResponse](docs/ProxyActiongenerateResponse.md)
 - [Zuora::ProxyActionqueryMoreRequest](docs/ProxyActionqueryMoreRequest.md)
 - [Zuora::ProxyActionqueryMoreResponse](docs/ProxyActionqueryMoreResponse.md)
 - [Zuora::ProxyActionqueryRequest](docs/ProxyActionqueryRequest.md)
 - [Zuora::ProxyActionqueryResponse](docs/ProxyActionqueryResponse.md)
 - [Zuora::ProxyActionsubscribeRequest](docs/ProxyActionsubscribeRequest.md)
 - [Zuora::ProxyActionsubscribeResponse](docs/ProxyActionsubscribeResponse.md)
 - [Zuora::ProxyActionupdateRequest](docs/ProxyActionupdateRequest.md)
 - [Zuora::ProxyActionupdateResponse](docs/ProxyActionupdateResponse.md)
 - [Zuora::ProxyBadRequestResponse](docs/ProxyBadRequestResponse.md)
 - [Zuora::ProxyBadRequestResponseErrors](docs/ProxyBadRequestResponseErrors.md)
 - [Zuora::ProxyCreateAccount](docs/ProxyCreateAccount.md)
 - [Zuora::ProxyCreateAmendment](docs/ProxyCreateAmendment.md)
 - [Zuora::ProxyCreateAmendmentRatePlanData](docs/ProxyCreateAmendmentRatePlanData.md)
 - [Zuora::ProxyCreateAmendmentRatePlanDataRatePlan](docs/ProxyCreateAmendmentRatePlanDataRatePlan.md)
 - [Zuora::ProxyCreateBillRun](docs/ProxyCreateBillRun.md)
 - [Zuora::ProxyCreateContact](docs/ProxyCreateContact.md)
 - [Zuora::ProxyCreateExport](docs/ProxyCreateExport.md)
 - [Zuora::ProxyCreateInvoiceAdjustment](docs/ProxyCreateInvoiceAdjustment.md)
 - [Zuora::ProxyCreateInvoicePayment](docs/ProxyCreateInvoicePayment.md)
 - [Zuora::ProxyCreateOrModifyResponse](docs/ProxyCreateOrModifyResponse.md)
 - [Zuora::ProxyCreatePayment](docs/ProxyCreatePayment.md)
 - [Zuora::ProxyCreatePaymentGatewayOptionData](docs/ProxyCreatePaymentGatewayOptionData.md)
 - [Zuora::ProxyCreatePaymentMethod](docs/ProxyCreatePaymentMethod.md)
 - [Zuora::ProxyCreateProduct](docs/ProxyCreateProduct.md)
 - [Zuora::ProxyCreateProductRatePlan](docs/ProxyCreateProductRatePlan.md)
 - [Zuora::ProxyCreateRefund](docs/ProxyCreateRefund.md)
 - [Zuora::ProxyCreateRefundRefundInvoicePaymentData](docs/ProxyCreateRefundRefundInvoicePaymentData.md)
 - [Zuora::ProxyCreateTaxationItem](docs/ProxyCreateTaxationItem.md)
 - [Zuora::ProxyCreateUnitOfMeasure](docs/ProxyCreateUnitOfMeasure.md)
 - [Zuora::ProxyCreateUsage](docs/ProxyCreateUsage.md)
 - [Zuora::ProxyDeleteResponse](docs/ProxyDeleteResponse.md)
 - [Zuora::ProxyGetAccount](docs/ProxyGetAccount.md)
 - [Zuora::ProxyGetAmendment](docs/ProxyGetAmendment.md)
 - [Zuora::ProxyGetBillRun](docs/ProxyGetBillRun.md)
 - [Zuora::ProxyGetCommunicationProfile](docs/ProxyGetCommunicationProfile.md)
 - [Zuora::ProxyGetContact](docs/ProxyGetContact.md)
 - [Zuora::ProxyGetCreditBalanceAdjustment](docs/ProxyGetCreditBalanceAdjustment.md)
 - [Zuora::ProxyGetExport](docs/ProxyGetExport.md)
 - [Zuora::ProxyGetFeature](docs/ProxyGetFeature.md)
 - [Zuora::ProxyGetImport](docs/ProxyGetImport.md)
 - [Zuora::ProxyGetInvoice](docs/ProxyGetInvoice.md)
 - [Zuora::ProxyGetInvoiceAdjustment](docs/ProxyGetInvoiceAdjustment.md)
 - [Zuora::ProxyGetInvoiceItem](docs/ProxyGetInvoiceItem.md)
 - [Zuora::ProxyGetInvoiceItemAdjustment](docs/ProxyGetInvoiceItemAdjustment.md)
 - [Zuora::ProxyGetInvoicePayment](docs/ProxyGetInvoicePayment.md)
 - [Zuora::ProxyGetInvoiceSplit](docs/ProxyGetInvoiceSplit.md)
 - [Zuora::ProxyGetInvoiceSplitItem](docs/ProxyGetInvoiceSplitItem.md)
 - [Zuora::ProxyGetPayment](docs/ProxyGetPayment.md)
 - [Zuora::ProxyGetPaymentMethod](docs/ProxyGetPaymentMethod.md)
 - [Zuora::ProxyGetPaymentMethodSnapshot](docs/ProxyGetPaymentMethodSnapshot.md)
 - [Zuora::ProxyGetPaymentMethodTransactionLog](docs/ProxyGetPaymentMethodTransactionLog.md)
 - [Zuora::ProxyGetPaymentTransactionLog](docs/ProxyGetPaymentTransactionLog.md)
 - [Zuora::ProxyGetProduct](docs/ProxyGetProduct.md)
 - [Zuora::ProxyGetProductFeature](docs/ProxyGetProductFeature.md)
 - [Zuora::ProxyGetProductRatePlan](docs/ProxyGetProductRatePlan.md)
 - [Zuora::ProxyGetProductRatePlanCharge](docs/ProxyGetProductRatePlanCharge.md)
 - [Zuora::ProxyGetProductRatePlanChargeTier](docs/ProxyGetProductRatePlanChargeTier.md)
 - [Zuora::ProxyGetRatePlan](docs/ProxyGetRatePlan.md)
 - [Zuora::ProxyGetRatePlanCharge](docs/ProxyGetRatePlanCharge.md)
 - [Zuora::ProxyGetRatePlanChargeTier](docs/ProxyGetRatePlanChargeTier.md)
 - [Zuora::ProxyGetRefund](docs/ProxyGetRefund.md)
 - [Zuora::ProxyGetRefundInvoicePayment](docs/ProxyGetRefundInvoicePayment.md)
 - [Zuora::ProxyGetRefundTransactionLog](docs/ProxyGetRefundTransactionLog.md)
 - [Zuora::ProxyGetSubscription](docs/ProxyGetSubscription.md)
 - [Zuora::ProxyGetSubscriptionProductFeature](docs/ProxyGetSubscriptionProductFeature.md)
 - [Zuora::ProxyGetTaxationItem](docs/ProxyGetTaxationItem.md)
 - [Zuora::ProxyGetUnitOfMeasure](docs/ProxyGetUnitOfMeasure.md)
 - [Zuora::ProxyGetUsage](docs/ProxyGetUsage.md)
 - [Zuora::ProxyModifyAccount](docs/ProxyModifyAccount.md)
 - [Zuora::ProxyModifyAmendment](docs/ProxyModifyAmendment.md)
 - [Zuora::ProxyModifyBillRun](docs/ProxyModifyBillRun.md)
 - [Zuora::ProxyModifyContact](docs/ProxyModifyContact.md)
 - [Zuora::ProxyModifyInvoice](docs/ProxyModifyInvoice.md)
 - [Zuora::ProxyModifyInvoiceAdjustment](docs/ProxyModifyInvoiceAdjustment.md)
 - [Zuora::ProxyModifyInvoicePayment](docs/ProxyModifyInvoicePayment.md)
 - [Zuora::ProxyModifyPayment](docs/ProxyModifyPayment.md)
 - [Zuora::ProxyModifyPaymentMethod](docs/ProxyModifyPaymentMethod.md)
 - [Zuora::ProxyModifyProduct](docs/ProxyModifyProduct.md)
 - [Zuora::ProxyModifyProductRatePlan](docs/ProxyModifyProductRatePlan.md)
 - [Zuora::ProxyModifyRefund](docs/ProxyModifyRefund.md)
 - [Zuora::ProxyModifySubscription](docs/ProxyModifySubscription.md)
 - [Zuora::ProxyModifyTaxationItem](docs/ProxyModifyTaxationItem.md)
 - [Zuora::ProxyModifyUnitOfMeasure](docs/ProxyModifyUnitOfMeasure.md)
 - [Zuora::ProxyModifyUsage](docs/ProxyModifyUsage.md)
 - [Zuora::ProxyNoDataResponse](docs/ProxyNoDataResponse.md)
 - [Zuora::ProxyPostImport](docs/ProxyPostImport.md)
 - [Zuora::ProxyUnauthorizedResponse](docs/ProxyUnauthorizedResponse.md)
 - [Zuora::PutBatchInvoiceType](docs/PutBatchInvoiceType.md)
 - [Zuora::PutCreditMemoTaxItemType](docs/PutCreditMemoTaxItemType.md)
 - [Zuora::PutCreditMemoTaxItemTypeFinanceInformation](docs/PutCreditMemoTaxItemTypeFinanceInformation.md)
 - [Zuora::PutDebitMemoTaxItemType](docs/PutDebitMemoTaxItemType.md)
 - [Zuora::PutDebitMemoTaxItemTypeFinanceInformation](docs/PutDebitMemoTaxItemTypeFinanceInformation.md)
 - [Zuora::PutInvoiceResponseType](docs/PutInvoiceResponseType.md)
 - [Zuora::PutInvoiceType](docs/PutInvoiceType.md)
 - [Zuora::PutReverseInvoiceResponseType](docs/PutReverseInvoiceResponseType.md)
 - [Zuora::PutReverseInvoiceResponseTypeCreditMemo](docs/PutReverseInvoiceResponseTypeCreditMemo.md)
 - [Zuora::PutReverseInvoiceType](docs/PutReverseInvoiceType.md)
 - [Zuora::QueryUsageResponseType](docs/QueryUsageResponseType.md)
 - [Zuora::RatePlan](docs/RatePlan.md)
 - [Zuora::RatePlanChargeData](docs/RatePlanChargeData.md)
 - [Zuora::RatePlanChargeDataInRatePlanData](docs/RatePlanChargeDataInRatePlanData.md)
 - [Zuora::RatePlanChargeDataInRatePlanDataRatePlanCharge](docs/RatePlanChargeDataInRatePlanDataRatePlanCharge.md)
 - [Zuora::RatePlanChargeDataRatePlanCharge](docs/RatePlanChargeDataRatePlanCharge.md)
 - [Zuora::RatePlanChargeTier](docs/RatePlanChargeTier.md)
 - [Zuora::RatePlanData](docs/RatePlanData.md)
 - [Zuora::RatePlanDataRatePlan](docs/RatePlanDataRatePlan.md)
 - [Zuora::RatePlanDataSubscriptionProductFeatureList](docs/RatePlanDataSubscriptionProductFeatureList.md)
 - [Zuora::RatePlanOverride](docs/RatePlanOverride.md)
 - [Zuora::RatePlanUpdate](docs/RatePlanUpdate.md)
 - [Zuora::RatedItem](docs/RatedItem.md)
 - [Zuora::RefundCreditMemoItemType](docs/RefundCreditMemoItemType.md)
 - [Zuora::RefundInvoicePayment](docs/RefundInvoicePayment.md)
 - [Zuora::RefundPartResponseType](docs/RefundPartResponseType.md)
 - [Zuora::RefundPartResponseTypewithSuccess](docs/RefundPartResponseTypewithSuccess.md)
 - [Zuora::RemoveProduct](docs/RemoveProduct.md)
 - [Zuora::RenewalTerm](docs/RenewalTerm.md)
 - [Zuora::RevenueScheduleItemType](docs/RevenueScheduleItemType.md)
 - [Zuora::SaveResult](docs/SaveResult.md)
 - [Zuora::SubscribeRequest](docs/SubscribeRequest.md)
 - [Zuora::SubscribeRequestAccount](docs/SubscribeRequestAccount.md)
 - [Zuora::SubscribeRequestBillToContact](docs/SubscribeRequestBillToContact.md)
 - [Zuora::SubscribeRequestPaymentMethod](docs/SubscribeRequestPaymentMethod.md)
 - [Zuora::SubscribeRequestPaymentMethodGatewayOptionData](docs/SubscribeRequestPaymentMethodGatewayOptionData.md)
 - [Zuora::SubscribeRequestPreviewOptions](docs/SubscribeRequestPreviewOptions.md)
 - [Zuora::SubscribeRequestSoldToContact](docs/SubscribeRequestSoldToContact.md)
 - [Zuora::SubscribeRequestSubscribeOptions](docs/SubscribeRequestSubscribeOptions.md)
 - [Zuora::SubscribeRequestSubscribeOptionsElectronicPaymentOptions](docs/SubscribeRequestSubscribeOptionsElectronicPaymentOptions.md)
 - [Zuora::SubscribeRequestSubscribeOptionsExternalPaymentOptions](docs/SubscribeRequestSubscribeOptionsExternalPaymentOptions.md)
 - [Zuora::SubscribeRequestSubscribeOptionsSubscribeInvoiceProcessingOptions](docs/SubscribeRequestSubscribeOptionsSubscribeInvoiceProcessingOptions.md)
 - [Zuora::SubscribeRequestSubscriptionData](docs/SubscribeRequestSubscriptionData.md)
 - [Zuora::SubscribeRequestSubscriptionDataSubscription](docs/SubscribeRequestSubscriptionDataSubscription.md)
 - [Zuora::SubscribeResult](docs/SubscribeResult.md)
 - [Zuora::SubscribeResultChargeMetricsData](docs/SubscribeResultChargeMetricsData.md)
 - [Zuora::SubscribeResultInvoiceResult](docs/SubscribeResultInvoiceResult.md)
 - [Zuora::SubscriptionProductFeature](docs/SubscriptionProductFeature.md)
 - [Zuora::SubscriptionProductFeatureList](docs/SubscriptionProductFeatureList.md)
 - [Zuora::SubscriptionRatedResult](docs/SubscriptionRatedResult.md)
 - [Zuora::TaxInfo](docs/TaxInfo.md)
 - [Zuora::Term](docs/Term.md)
 - [Zuora::Terms](docs/Terms.md)
 - [Zuora::TermsAndConditions](docs/TermsAndConditions.md)
 - [Zuora::TimeSlicedMetrics](docs/TimeSlicedMetrics.md)
 - [Zuora::TimeSlicedNetMetrics](docs/TimeSlicedNetMetrics.md)
 - [Zuora::TimeSlicedTcbNetMetrics](docs/TimeSlicedTcbNetMetrics.md)
 - [Zuora::TokenResponse](docs/TokenResponse.md)
 - [Zuora::TransferPaymentType](docs/TransferPaymentType.md)
 - [Zuora::TriggerDates](docs/TriggerDates.md)
 - [Zuora::TriggerDatesInner](docs/TriggerDatesInner.md)
 - [Zuora::TriggerParams](docs/TriggerParams.md)
 - [Zuora::UnapplyCreditMemoType](docs/UnapplyCreditMemoType.md)
 - [Zuora::UnapplyPaymentType](docs/UnapplyPaymentType.md)
 - [Zuora::UpdateCustomFieldsDefinitionRequest](docs/UpdateCustomFieldsDefinitionRequest.md)
 - [Zuora::UpdateCustomFieldsDefinitionRequestNoNamespace](docs/UpdateCustomFieldsDefinitionRequestNoNamespace.md)
 - [Zuora::UpdateEntityResponseType](docs/UpdateEntityResponseType.md)
 - [Zuora::UpdateEntityType](docs/UpdateEntityType.md)
 - [Zuora::UpdatePaymentType](docs/UpdatePaymentType.md)
 - [Zuora::UsageImport](docs/UsageImport.md)
 - [Zuora::UsageImports](docs/UsageImports.md)
 - [Zuora::ZObject](docs/ZObject.md)
 - [Zuora::ZObjectUpdate](docs/ZObjectUpdate.md)
 - [Zuora::GetCreditMemoAmountBreakdownByOrderResponse](docs/GetCreditMemoAmountBreakdownByOrderResponse.md)
 - [Zuora::GetInvoiceAmountBreakdownByOrderResponse](docs/GetInvoiceAmountBreakdownByOrderResponse.md)
 - [Zuora::GetOrderBillingInfoResponseType](docs/GetOrderBillingInfoResponseType.md)
 - [Zuora::GetOrderRatedResultResponseType](docs/GetOrderRatedResultResponseType.md)
 - [Zuora::GetOrderResponse](docs/GetOrderResponse.md)
 - [Zuora::GetOrdersResponse](docs/GetOrdersResponse.md)
 - [Zuora::GetSubscriptionTermInfoResponseType](docs/GetSubscriptionTermInfoResponseType.md)
 - [Zuora::PostOrderPreviewResponseType](docs/PostOrderPreviewResponseType.md)
 - [Zuora::PostOrderResponseType](docs/PostOrderResponseType.md)
 - [Zuora::RecurringFlatFeePricingOverride](docs/RecurringFlatFeePricingOverride.md)
 - [Zuora::RecurringFlatFeePricingUpdate](docs/RecurringFlatFeePricingUpdate.md)
 - [Zuora::RecurringPerUnitPricingOverride](docs/RecurringPerUnitPricingOverride.md)
 - [Zuora::RecurringPerUnitPricingUpdate](docs/RecurringPerUnitPricingUpdate.md)
 - [Zuora::RecurringTieredPricingOverride](docs/RecurringTieredPricingOverride.md)
 - [Zuora::RecurringTieredPricingUpdate](docs/RecurringTieredPricingUpdate.md)
 - [Zuora::RecurringVolumePricingOverride](docs/RecurringVolumePricingOverride.md)
 - [Zuora::RecurringVolumePricingUpdate](docs/RecurringVolumePricingUpdate.md)
 - [Zuora::UsageFlatFeePricingOverride](docs/UsageFlatFeePricingOverride.md)
 - [Zuora::UsageFlatFeePricingUpdate](docs/UsageFlatFeePricingUpdate.md)
 - [Zuora::UsageOveragePricingOverride](docs/UsageOveragePricingOverride.md)
 - [Zuora::UsageOveragePricingUpdate](docs/UsageOveragePricingUpdate.md)
 - [Zuora::UsagePerUnitPricingOverride](docs/UsagePerUnitPricingOverride.md)
 - [Zuora::UsagePerUnitPricingUpdate](docs/UsagePerUnitPricingUpdate.md)
 - [Zuora::UsageTieredPricingOverride](docs/UsageTieredPricingOverride.md)
 - [Zuora::UsageTieredPricingUpdate](docs/UsageTieredPricingUpdate.md)
 - [Zuora::UsageTieredWithOveragePricingOverride](docs/UsageTieredWithOveragePricingOverride.md)
 - [Zuora::UsageTieredWithOveragePricingUpdate](docs/UsageTieredWithOveragePricingUpdate.md)
 - [Zuora::UsageVolumePricingOverride](docs/UsageVolumePricingOverride.md)
 - [Zuora::UsageVolumePricingUpdate](docs/UsageVolumePricingUpdate.md)


## Documentation for Authorization

 All endpoints do not require authorization.

