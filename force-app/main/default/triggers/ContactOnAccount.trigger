trigger ContactOnAccount on Contact (After Update,before Update,After Insert,After Delete,After Undelete,before Insert) {
    switch on Trigger.operationType {
        when AFTER_UPDATE {
            System.debug('After Update');
            ContactOnAccountController.calculateContact(Trigger.New,Trigger.OldMap);
        }
    }
}