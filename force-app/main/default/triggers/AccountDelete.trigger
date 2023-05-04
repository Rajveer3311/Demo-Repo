trigger AccountDelete on Contact (before insert) {
    switch on Trigger.operationType{
        When BEFORE_INSERT{
        }
    }
}