trigger UpdateObjectives on Task(after update)
{
 for (Task c : Trigger.new)
  { 
      Task oldTasks = Trigger.oldMap.get(c.ID);
      if (c.Description != oldTasks.Description || c.Status != oldTasks.Status){
      string objectiveid=c.ObjectiveId__c;
      string description=c.Subject;
      string status;
      if(c.Status=='Closed By Manager')
      {
       status='412c69e9-fcd4-4680-9e1a-58ea8d32b3a0';
      }
      else if(c.Status=='Agreed on Action Step')
      {
       status='8741efe7-5349-4136-abc6-46bee0fbb0aa';
      }
      else if(c.Status=='Completed By Associate')
      {
       status='775f901d-0bc5-49a8-b060-6bd82966d46b';
      }
      else if(c.Status=='Completed')
      {
       status='ce8d1c61-8acd-4fe1-9ba1-f65ce4746ec9';
      }
      else if(c.Status=='In Progress')
      {
       status='ab4e72ab-756c-46fc-8bea-856a4b391df5';
      }
      //Date duedate=c.ActivityDate;
      string objectivecomment=c.Description;
   SpmUpdateClass.spmUpdateMethod(objectiveid,description,status,objectivecomment);
  }
  }
}