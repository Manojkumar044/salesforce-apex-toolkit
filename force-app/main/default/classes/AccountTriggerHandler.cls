/**
 * Example Account trigger handler. Copies Billing Address fields to
 * Shipping Address when Shipping Street is blank. Adapt to your org.
 */
public with sharing class AccountTriggerHandler {
    public static void beforeInsert(List<Account> newAccounts) {
        if (newAccounts == null || newAccounts.isEmpty()) {
            return;
        }

        for (Account accountRecord : newAccounts) {
            if (accountRecord == null || !String.isBlank(accountRecord.ShippingStreet)) {
                continue;
            }
            accountRecord.ShippingStreet = accountRecord.BillingStreet;
            accountRecord.ShippingCity = accountRecord.BillingCity;
            accountRecord.ShippingState = accountRecord.BillingState;
            accountRecord.ShippingPostalCode = accountRecord.BillingPostalCode;
            accountRecord.ShippingCountry = accountRecord.BillingCountry;
        }
    }
}
