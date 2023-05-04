trigger sendemailwithattachment on Contact (after insert,after update)
{
    
    
    for(Contact oppr : Trigger.new)
    {
        if(oppr.Email != null)
        {
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            String[] toAddresses = new String[]{oppr.Email};
                // String[] toAddresses = 'oppr.SMEs_Email__c';
                
            mail.setToAddresses(toAddresses);
            mail.setReplyTo('rajveer.rawat@fexle.com');
            mail.setSenderDisplayName('CRM Support');
            //mail.setSubject('Mail with Attachment');
            mail.setBccSender(false);
            mail.setUseSignature(false);
            //mail.setPlainTextBody('Your Email has been sent'); 
            mail.setTargetObjectId(oppr.OwnerId);
            //mail.setTemplateId('00XQ0000000QULj');
            mail.saveAsActivity = false;
            
            
            //Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
            
            
            
            //Set email file attachments
            List<Messaging.Emailfileattachment> fileAttachments = new List<Messaging.Emailfileattachment>();
            for (Attachment a : [select Name, Body, BodyLength from Attachment where ParentId = :oppr.Id])
            {
                // Add to attachment file list
                Messaging.Emailfileattachment efa = new Messaging.Emailfileattachment();
                efa.setFileName(a.Name);
                efa.setBody(a.Body);
                fileAttachments.add(efa);
            }
            mail.setFileAttachments(fileAttachments);
            System.debug('mail'+mail);
            System.debug('fileAttachments'+fileAttachments);
            //Send email
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
            
        }       
    }
}