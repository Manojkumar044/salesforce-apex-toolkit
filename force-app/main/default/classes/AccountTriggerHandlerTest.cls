@IsTest
private class AccountTriggerHandlerTest {
    @IsTest
    static void copiesBillingAddressWhenShippingStreetIsBlank() {
        Account accountRecord = new Account(
            Name = 'Toolkit Test Account',
            BillingStreet = '1 Main Street',
            BillingCity = 'Hyderabad',
            BillingState = 'Telangana',
            BillingPostalCode = '500001',
            BillingCountry = 'India'
        );

        Test.startTest();
        insert accountRecord;
        Test.stopTest();

        Account insertedAccount = [
            SELECT ShippingStreet, ShippingCity, ShippingState,
                   ShippingPostalCode, ShippingCountry
            FROM Account WHERE Id = :accountRecord.Id
        ];
        System.assertEquals('1 Main Street', insertedAccount.ShippingStreet);
        System.assertEquals('Hyderabad', insertedAccount.ShippingCity);
        System.assertEquals('Telangana', insertedAccount.ShippingState);
        System.assertEquals('500001', insertedAccount.ShippingPostalCode);
        System.assertEquals('India', insertedAccount.ShippingCountry);
    }

    @IsTest
    static void doesNotOverwriteExistingShippingAddress() {
        Account accountRecord = new Account(
            Name = 'Toolkit Existing Shipping',
            BillingStreet = 'Billing Street',
            BillingCity = 'Billing City',
            ShippingStreet = 'Existing Shipping Street',
            ShippingCity = 'Existing Shipping City'
        );
        insert accountRecord;

        Account insertedAccount = [
            SELECT ShippingStreet, ShippingCity
            FROM Account WHERE Id = :accountRecord.Id
        ];
        System.assertEquals('Existing Shipping Street', insertedAccount.ShippingStreet);
        System.assertEquals('Existing Shipping City', insertedAccount.ShippingCity);
    }

    @IsTest
    static void handlesTwoHundredAccounts() {
        List<Account> accountsToInsert = new List<Account>();
        for (Integer indexValue = 0; indexValue < 200; indexValue++) {
            accountsToInsert.add(new Account(
                Name = 'Bulk Toolkit Account ' + indexValue,
                BillingStreet = 'Street ' + indexValue,
                BillingCity = 'Hyderabad'
            ));
        }

        Test.startTest();
        insert accountsToInsert;
        Test.stopTest();

        System.assertEquals(200, [
            SELECT COUNT() FROM Account WHERE Name LIKE 'Bulk Toolkit Account %'
        ]);
        for (Account insertedAccount : [
            SELECT BillingStreet, ShippingStreet
            FROM Account WHERE Name LIKE 'Bulk Toolkit Account %'
        ]) {
            System.assertEquals(insertedAccount.BillingStreet, insertedAccount.ShippingStreet);
        }
    }
}
