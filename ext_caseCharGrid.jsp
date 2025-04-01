<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="spl.tld" prefix="spl" %>
<spl:initializeLocale/>

<!--
 ******************************************************************
 *                                                                *
 * Copyright (c) 2013, Accenture. All rights reserved.            *
 *                                                                *
 ******************************************************************
 *                                                                
 * PROGRAM DESCRIPTION:                                           
 *                                                                
 * Adjustment Characteristics Grid
 *                                                                
 *****************************************************************
 *                                                                
 * CHANGE HISTORY:                                                
 *                                                                
 * Date:    	by:       	Reason:                                     
 * YYYY-MM-DD   IN      	Reason text.                                                               
 * 
 * 2019-03-08 	Marte2J		            Initial Version.
 * 2019-10-21	Sarka4T		            Changes related to ACE-247
 * 2019-07-20	GHOS36A		            Changes related to ACE-797
 * 2020-08-21	JHA005R , KUMA20D		Changes related to ACE-2721
 * 2022-09-28   DOKE01A	                Change for Gas  - EBSG-970
 * 2022-09-28   JAMTA1N	                ECP-7273 changes
 *****************************************************************
-->

<script type="text/javascript">
 
var disableFlag = true; 

 function extPostAfterFieldUpdate(fieldName, fieldValue, data, pureListName, pureFieldName){
	 
	if(document.getElementById(pureListName + 'CHAR_TYPE_CD').value == 'CM-L1RUA'){
		alert('Please remove this characteristic. \n\"Reason for Case Note\" is an automatically added characteristic and cannot be added manually. It will automatically be populated once either a \"Reason for Settlement Imbalance\" or \"Root Cause for Unbilled\" characteristic has been added and the Internal Action Note has been saved. '); 
		protectField(pureListName + "ADHOC_CHAR_VAL");
		protectField(pureListName + "CHAR_VAL");
		protectField(pureListName + "CHAR_VAL_FK1"); 
		disableButton('IM_' + pureListName + 'LAUNCH_FILE');
		disableButton('IM_' + pureListName + 'CHAR_VAL');
		disableButton('IM_' + pureListName + 'CHAR_VAL_FK1');
	}
	
	if(document.getElementById(pureListName + 'CHAR_TYPE_CD').value == 'CMCOTIDG'){
		alert('Please remove this characteristic. \n\"COT Case Id for Gas Customer\" is an automatically added characteristic and cannot be added manually. It will automatically be populated for Gas Customer only. '); 
		protectField(pureListName + "ADHOC_CHAR_VAL");
		protectField(pureListName + "CHAR_VAL");
		protectField(pureListName + "CHAR_VAL_FK1"); 
		disableButton('IM_' + pureListName + 'LAUNCH_FILE');
		disableButton('IM_' + pureListName + 'CHAR_VAL');
		disableButton('IM_' + pureListName + 'CHAR_VAL_FK1');
	}
	
	if(document.getElementById(pureListName + 'CHAR_TYPE_CD').value == 'CMCOTGS'){
		alert('Please remove this characteristic. \n\"Gas COT Case Indicator\" is an automatically added characteristic and cannot be added manually. It will automatically be populated for Gas Customer only. '); 
		protectField(pureListName + "ADHOC_CHAR_VAL");
		protectField(pureListName + "CHAR_VAL");
		protectField(pureListName + "CHAR_VAL_FK1"); 
		disableButton('IM_' + pureListName + 'LAUNCH_FILE');
		disableButton('IM_' + pureListName + 'CHAR_VAL');
		disableButton('IM_' + pureListName + 'CHAR_VAL_FK1');
	}
	
	
 }  
   
function extPostOnWindowLoad(currentRowElement, pureListName, x){
	 
	if((document.getElementById(pureListName + 'CHAR_TYPE_CD').value == 'CM-L1RUA') && disableFlag  == true) {  
		var myList = trimString(document.getElementById("CASE_CHAR:"+x+"$CHAR_TYPE_CD")); 
		for(i=0;i< myList.options.length; i++){ 
			 
			if((myList[i].value == 'CM-L2RSI') || (myList[i].value == 'CM-RCUA')) { 
				protectField(pureListName + "CHAR_TYPE_CD");
				protectField(pureListName + "ADHOC_CHAR_VAL");
				protectField(pureListName + "CHAR_VAL");
				protectField(pureListName + "CHAR_VAL_FK1");
				disableButton('IM_' + pureListName + 'ADD_BTN');
				disableButton('IM_' + pureListName + 'DEL_BTN');
				disableButton('IM_' + pureListName + 'LAUNCH_FILE');
				disableButton('IM_' + pureListName + 'CHAR_VAL');
				disableButton('IM_' + pureListName + 'CHAR_VAL_FK1');
				disableFlag = false;
			} 
		} 
	}
	
	if((document.getElementById(pureListName + 'CHAR_VAL').value == '' && document.getElementById(pureListName + 'CHAR_TYPE_CD').value == 'CM-L1RUA')){
				unprotectField(pureListName + "CHAR_TYPE_CD");			
				protectField(pureListName + "ADHOC_CHAR_VAL");
				protectField(pureListName + "CHAR_VAL");
				protectField(pureListName + "CHAR_VAL_FK1")
				enableButton('IM_' + pureListName + 'ADD_BTN');
				enableButton('IM_' + pureListName + 'DEL_BTN');
				disableButton('IM_' + pureListName + 'LAUNCH_FILE');
				disableButton('IM_' + pureListName + 'CHAR_VAL');
				disableButton('IM_' + pureListName + 'CHAR_VAL_FK1');
	}
	
	if((document.getElementById(pureListName + 'CHAR_VAL').value == '' && document.getElementById(pureListName + 'CHAR_TYPE_CD').value == 'CMCOTIDG')){
				unprotectField(pureListName + "CHAR_TYPE_CD");			
				protectField(pureListName + "ADHOC_CHAR_VAL");
				protectField(pureListName + "CHAR_VAL");
				protectField(pureListName + "CHAR_VAL_FK1")
				enableButton('IM_' + pureListName + 'ADD_BTN');
				enableButton('IM_' + pureListName + 'DEL_BTN');
				disableButton('IM_' + pureListName + 'LAUNCH_FILE');
				disableButton('IM_' + pureListName + 'CHAR_VAL');
				disableButton('IM_' + pureListName + 'CHAR_VAL_FK1');
	}
	if((document.getElementById(pureListName + 'CHAR_VAL_FK1').value == '' && document.getElementById(pureListName + 'CHAR_TYPE_CD').value == 'CMCOTGS')){
				unprotectField(pureListName + "CHAR_TYPE_CD");			
				protectField(pureListName + "ADHOC_CHAR_VAL");
				protectField(pureListName + "CHAR_VAL");
				protectField(pureListName + "CHAR_VAL_FK1")
				enableButton('IM_' + pureListName + 'ADD_BTN');
				enableButton('IM_' + pureListName + 'DEL_BTN');
				disableButton('IM_' + pureListName + 'LAUNCH_FILE');
				disableButton('IM_' + pureListName + 'CHAR_VAL');
				disableButton('IM_' + pureListName + 'CHAR_VAL_FK1');
	}
	
	
	/* START : GHOS36A Changes according to ACE-797*/
		var cotGeneratorSw="false";
		var case_id = myData.getValue('CASE_ID');  // Get the associated CASE ID
		
		var xml = '<root><caseId>' + case_id  + '</caseId ><cotGenerator></cotGenerator></root>';
		
                var xmlDoc = createXMLDoc(xml,false);
                 try{ 
						//Call a Service Script	to check whether Next Action Date Characteristics is already present or not. Returns true/fasle based on check. 		
						var xmlDoc2 = main.invokeSS('CM-CHKNADCHA',xmlDoc.documentElement, null, true, null);
                        cotGeneratorSw = xmlDoc2.getElementsByTagName("cotGenerator")[0].childNodes[0].nodeValue;	
																
                    } catch (e) { 
										
                                if (e.type == "error") {
                                        main.showServerMessage(e.serverMessage);
                                        return;
                                    }
                        } 
			
			
			
			//Check on load of the grid, if Next Action Date Characteristics is already present, the field is greyed out and the Delete Button is greyed out.
			if((document.getElementById(pureListName + 'CHAR_TYPE_CD').value == 'CM-CTNAD') && cotGeneratorSw == "true")
			{			
				disableButton('IM_' + pureListName + 'DEL_BTN');
				
				protectField(pureListName + "CHAR_TYPE_CD");
				protectField(pureListName + "CHAR_VAL_DESCR");
			}
			
			/* END : GHOS36A added changes according to ACE-797*/
			
	/* START: KUMA20D & JHA005R Added logic to allow REVENUE MANAGEMENT users to 'PENDING/CANCEL' when case type: CM-PDV and status: Sent for Warrant according to ACE-2721*/		
			var caseType = myData.getValue("CASE_TYPE_CD");
			var caseStatus = myData.getValue("CASE_STATUS_CD");
			var user = top.getUser();
			
			if((caseType == "CM-PDV") && (caseStatus == "SENT FOR WRN")) {
			
			  var Pending_cancel_Button = "false";
		      var xml = '<root><userId>' + user  + '</userId ><userGroup></userGroup><Pending_cancel_Button></Pending_cancel_Button></root>';
              var xmlDoc = createXMLDoc(xml,false);
                  
					try{
						
						var xmlDoc2 = main.invokeSS('CM-CHKREVUSR',xmlDoc.documentElement, null, true, null);
                         Pending_cancel_Button = xmlDoc2.getElementsByTagName("Pending_cancel_Button")[0].childNodes[0].nodeValue;	
																
                        } 
			        catch (e) { 
											
                                if (e.type == "error") {
                                        main.showServerMessage(e.serverMessage);
                                        return;
                                    }
                              }
							  
					 		  
				    if(Pending_cancel_Button == "false")
						{							  
					
						  disableButton('IM_' + pureListName + 'ADD_BTN');
						  protectField(pureListName + "CHAR_TYPE_CD");
			             
						}
			
			
               
				
			}
   /* END: KUMA20D & JHA005R Added logic to allow REVENUE MANAGEMENT users to 'PENDING/CANCEL' when case type: CM-PDV and status: Sent for Warrant according to ACE-2721*/

			//Legal case ECP-7273 changes
			
			if((caseType == "CM-LEGLCASTY")) {
				
				//alert('legal case if');
				
				var disableCharButton = "false";
				var xmlScr = '<root><userId>' + user  + '</userId ><userGroup></userGroup><disableCharButton></disableCharButton></root>';
				var xmlDocScr = createXMLDoc(xmlScr,false);
                  
				try{
						
					var xmlDoc2Scr = main.invokeSS('CM-CHKLGLCAS',xmlDocScr.documentElement, null, true, null);
					disableCharButton = xmlDoc2Scr.getElementsByTagName("disableCharButton")[0].childNodes[0].nodeValue;	
					//alert('disableCharButton='+disableCharButton);											
				} 
				catch (e) { 
											
					if (e.type == "error") {
							main.showServerMessage(e.serverMessage);
							return;
					}
				}
							  
					 		  
				if(disableCharButton == "false")
				{
					//alert('inside if 1='+disableCharButton);	
					disableButton('IM_' + pureListName + 'ADD_BTN');
					disableButton('IM_' + pureListName + 'DEL_BTN');
					protectField(pureListName + "CHAR_TYPE_CD");
					protectField(pureListName + "ADHOC_CHAR_VAL");
					protectField(pureListName + "CHAR_VAL");
					protectField(pureListName + "CHAR_VAL_FK1");
			             
				}
				
				
				
			}
	
			//Legal case ECP-7273 changes end
	
	
} 

/* START : Sarka4T added changes according to ACE-247*/
function onWindowLoadNoListAfter(){
	
	var caseStatus = myData.getValue("CASE_STATUS_CD");
	//alert('caseStatus['+caseStatus+']');
	var caseType = myData.getValue("CASE_TYPE_CD");
	//alert('caseType['+caseType+']');
	if((caseType == "CM-CNCL-SA") && (caseStatus != "FOR REVIEW")) {
		//alert('Inside If');
		protectGrid();
	}
}
/* END : Sarka4T added changes according to ACE-247*/

</script>