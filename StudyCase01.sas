/*  prepare and analyze claims data from the Transportation Security Administration (TSA)*/

/* Define the TSA library */
Libname TSA "/home/u64032908/CourseraSAS/ECRB94(2)/data";
Run;

/* Set an option to enforce SAS naming conventions for column names */
options validvarname=v7;
/* Creation of a Macro Variable  */
%let Outpath= /home/u64032908/CourseraSAS/ECRB94(2)/data;
%let statename=Hawaii;

/* Use PROC IMPORT to create a SAS table */
Proc Import Datafile="&Outpath/TSAClaims2002_2017.csv" 
         out=TSA.Claims REPLACE
         DBMS=csv Replace ;
         GUESSINGROWS=MAX ;
Run;     
ods pdf file="&Outpath/TSAClaims2002_2017.pdf" style=meadow;
ODS PROCLABEL "prepare and analyze claims data from the Transportation Security Administration (TSA)" ;
/*  It is require to use PROC PRINT To view Your DATA 
in this Case we have about 20,000 observation Proc print Procesures will take 
much time to process   
 I used a Sample of 100 OBS */

Proc print Data = TSA.Claims (obs=10);
Run;
/* Have A view To my Data To know what To Clean */
Proc Contents Data = TSA.Claims;
Run;

Proc Freq Data=TSA.Claims;
Run;

/* i Want to delete the Duplicates */

proc sort data=TSA.Claims out=TSA.ClaimsNodups nodupkey;
     by _all_;
run;
/*    Sort the data by ascending Incident_Date */

proc sort data=TSA.ClaimsNodups out=SortedIncidentDate;
     by Incident_Date;
run;

Data CleanClaims;
     *Format ;
     Set TSA.ClaimsNodups;
     State=Upcase(State);
     StateName=PropCase(StateName);
     *Date_Issues = ;
     Drop County City ;
/*Claim_Site column has invalid characters and conditionally set the value of the column to the required value*/
     If Claim_Site in ("","-") then Claim_Site="Unknown";
/*Disposition column has invalid characters and conditionally set the value of the column to the required value*/    
     If Disposition in ("","-")  then Disposition= "Unknown";
      else if Disposition = "losed: Contractor Claim" then Disposition = "Closed:Contractor Claim";
       else if Disposition = "Closed: Canceled" then Disposition = "Closed:Canceled";
/*Claim_Type column has invalid characters and conditionally set the value of the column to the required value*/
    if Claim_Type in ("","-") then Claim_Type = "Unknown";
       else if Claim_Type = "Passenger Property Loss/Personal Injur" then Claim_Type = "Passenger Property Loss";
       else if Claim_Type = "Passenger Property Loss/Personal Injury" then Claim_Type = "Passenger Property Loss";
       else if Claim_Type = "Property Damage/Personal Injury" then Claim_Type = "Property Damage";
Run;     
     
    
Data CleanClaims;
      Set  CleanClaims;
/*   IF Statement To Create a New Variable Date_Issues */
        if ( Incident_Date > Date_Received or
    Incident_Date= . or
    Date_Received= . or
    year(Incident_Date) < 2002 or 
    year(Incident_Date) > 2017 or
    year(Date_Received) < 2002 or
    year(Date_Received) > 2017 ) then 
                      Date_Issues='Needs Review';
    format Date_Received Incident_Date date9. ;
    Format Close_Amount dollar20.2;
Run;
/* Cheking if our Data is Cleanes After Our Instructions*/

proc contents data=CleanClaims;
run;

proc freq data=CleanClaims order=freq;
     tables Claim_Site Disposition Claim_Type Date_Issues / nocum nopercent;
run; 
/*  Use PROC FREQ to analyze the number of claims per year of Incident_Date */
proc freq data=CleanClaims order=freq ;
     tables Claim_Type / nocum nopercent;
     where StateName = "Hawaii" and Date_Issues is null;
run; 

proc freq data=CleanClaims order=freq ;
     tables Claim_Site/ nocum nopercent;
     where StateName = "Hawaii" and Date_Issues is null;
run; 
proc freq data=CleanClaims order=freq ;
     tables Disposition/ nocum nopercent;
     where StateName = "Hawaii" and Date_Issues is null;
run; 

/* dynamic programme analysis */

proc freq data=DateIssue order=freq;
     tables Claim_Type Claim_Site Disposition / nocum nopercent;
     *where StateName = upcase("&STATENAME") and Date_issue is null;
run;


proc means data=nodateissues mean min max sum maxdec=0;
     var Close_Amount;
     where StateName = upcase("&STATENAME");
run;

proc means data=CleanClaims mean ;
     var Close_Amount;
     where StateName = "Hawaii" and Date_Issues is null;
run;
ODS PDF CLOSE;


















