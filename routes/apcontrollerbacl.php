<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\blacklist;
use App\Helpers\telNet;
use Illuminate\Support\Facades\Validator;
class ApiController extends Controller
{

  //API for optindata....
     public function getOptindata(Request $request)
    { 
       $validation=Validator::make($request->all(),[
    'callingParty'=>'required',
    'sdate'=>'required',
    'edate'=>'required'
  ]);
  if ($validation->fails()) 
  {    
    return response()->json($validation->messages(), 422);
  }
       $sdatecreate = date_create($request->sdate);
       $sdate=date_format($sdatecreate, 'Y-m-d H:i:s'); 
        $edatecreate = date_create($request->edate);
        $edate=date_format($edatecreate, 'Y-m-d H:i:s'); 
         $month=date('m',strtotime('today'));
         $optindata['data']=DB::connection('mysql3')->select(DB::raw("SELECT C.`refId`,C.aParty,B.param1 AS transactionId,C.`param1` AS optIn,C.`created` AS created,C.`milli` AS milli FROM core_cdr_".$month." A, core_cdr_".$month." B, incoming_call_cdr_".$month." C WHERE (A.opcode ='CHARGE_REQ' AND B.opcode ='CHARGE_RES') AND C.`opcode`='DTMF_RECEIVED' AND C.`aParty`='$request->callingParty' AND A.refId=B.refId AND A.`refId`=C.`refId` AND DATE(C.created) BETWEEN DATE('$request->sdate') AND DATE('$request->edate')"));
         $Bparties=DB::connection('mysql3')->select(DB::raw("select refId,bParty from incoming_call_cdr_".$month." where opcode='INBOUND_CALL' AND DATE(created) BETWEEN DATE('$request->sdate') AND DATE('$request->edate')"));
    foreach ($optindata as $key => $value) {
      //$value->refId;
       foreach ($Bparties as $Bkey => $bvalue) {
       if($value->refId==$bvalue->refId)
       {
        $value->bParty=$bvalue->bParty;
        break;
       }
       }
    }
     return $optindata;
     
       } 
/*--Blacklist API
--------*/
   public function getBlackList(Request $request)
   {
    $validation=Validator::make($request->all(),[
    'blacklistingParty'=>'required'
  ]);
  if ($validation->fails()) 
  {    
    return response()->json($validation->messages(), 422);
  }
      $blacklist['data']=blacklist::where('aParty','=',$request->blacklistingParty)->select('blacklist.*')->distinct()->get(['aParty']);
      return $blacklist;
   }
    public function addBlacklist(Request $request)
    {
      $refID=createRefID();
    $validation=Validator::make($request->all(),[
    'blacklistingParty'=>'required',
    'blacklistedParty'=>'required'
  ]);
  if ($validation->fails()) 
  {    
    return response()->json($validation->messages(), 422);
  }
      $data='<methodCall><function>ServiceBlock</function><aParty>'.$request->blacklistingParty.'</aParty><bParty>'.$request->blacklistedParty.'</bParty><refId>CSR'.$refID.'</refId><option>addBlacklist</option></methodCall>';
      return response()->json([/*SendRequest('',$data)*/'message'=>'We are here'],200);
    }
    public function removeBlackList(Request $request)
  {
    $refID=createRefID();
     $data='<methodCall><function>ServiceBlock</function><aParty>'.$request->blacklistingParty.'</aParty><bParty>'.$request->blacklistedParty.'</bParty><refId>CSR'.$refID.'</refId><option>remBlacklist</option></methodCall>';
      return response()->json([/*SendRequest('',$data)*/'message'=>'We are here'],200);
  }
/*------
Calldetails
-------------*/
 public function getCalldetails(Request $request)
    {
       $month=date('m',strtotime('today'));
      if($request->type==0)
    $coreCDR=DB::connection('mysql3')->select(DB::raw("SELECT C.`refId`,C.aParty,B.param1 AS transactionId,C.`param1` AS optIn,C.`created` AS created,C.`milli` AS milli FROM core_cdr_".$month." A, core_cdr_".$month." B, incoming_call_cdr_".$month." C WHERE (A.opcode ='CHARGE_REQ' AND B.opcode ='CHARGE_RES') AND C.`opcode`='DTMF_RECEIVED' AND C.`aParty`='$request->inpt' AND A.refId=B.refId AND A.`refId`=C.`refId` AND DATE(C.created) BETWEEN DATE('$request->sdate') AND DATE('$request->edate')"));
       elseif ($request->type==1) 
        $coreCDR=DB::connection('mysql3')->select(DB::raw("SELECT C.`refId`,C.aParty,B.param1 AS transactionId,C.`param1` AS optIn,C.`created` AS created,C.`milli` AS milli FROM core_cdr_".$month." A, core_cdr_".$month." B, incoming_call_cdr_".$month." C WHERE (A.opcode ='CHARGE_REQ' AND B.opcode ='CHARGE_RES') AND C.`opcode`='DTMF_RECEIVED' AND C.`bParty`='$request->inpt' AND A.refId=B.refId AND A.`refId`=C.`refId` AND DATE(C.created) BETWEEN DATE('$request->sdate') AND DATE('$request->edate')"));
       else
         $coreCDR=DB::connection('mysql3')->select(DB::raw("SELECT C.`refId`,C.aParty,B.param1 AS transactionId,C.`param1` AS optIn,C.`created` AS created,C.`milli` AS milli FROM core_cdr_".$month." A, core_cdr_".$month." B, incoming_call_cdr_".$month." C WHERE (A.opcode ='CHARGE_REQ' AND B.opcode ='CHARGE_RES') AND C.`opcode`='DTMF_RECEIVED' AND C.`refId`='$request->inpt' AND A.refId=B.refId AND A.`refId`=C.`refId` AND DATE(C.created) BETWEEN DATE('$request->sdate') AND DATE('$request->edate')"));
     

     $notification=DB::connection('mysql3')->select(DB::raw("SELECT refId,param2 FROM core_cdr_".$month." WHERE opcode ='NOTIFICATION_REQ' AND DATE(created) BETWEEN DATE('$request->sdate') AND DATE('$request->edate')"));
  

    $Aparties=DB::connection('mysql3')->select(DB::raw("SELECT refId FROM outgoing_call_cdr_".$month." WHERE opcode ='APARTY_RINGING' AND DATE(created) BETWEEN DATE('$request->sdate') AND DATE('$request->edate')"));


      $Bparties=DB::connection('mysql3')->select(DB::raw("select refId,bParty from incoming_call_cdr_".$month." where opcode='INBOUND_CALL' AND DATE(created) BETWEEN DATE('$request->sdate') AND DATE('$request->edate')"));

     // Getting Bpartis Against
      foreach ($coreCDR as $key => $value) {
      //$value->refId;
       foreach ($Bparties as $Bkey => $bvalue) {
       if($value->refId==$bvalue->refId)
       {
        $value->bParty=$bvalue->bParty;
        break;
       }
       }
    }
    //geting notification Against Apart
  foreach ($coreCDR as $key => $value) {
      //$value->refId;
      // if optin type is NM OR 1
    if($value->optIn==1)
    {
       foreach ($notification as $nkey => $nvalue) {
         if($value->refId==$nvalue->refId)
         {
          $value->isNotificationSent='YES';
          $value->NotificationContent=$nvalue->param2;
          break;
         }
         else
         {
         $value->isNotificationSent=config('app.NotficationAwaitingPrompt');
          $value->NotificationContent=Config('app.EmptyNotificationString');
         }


       }
     }
      // if optin type is ACB or 2
     else
     {
      foreach ($Aparties as $Akey => $Avalue) {
         if($value->refId==$Avalue->refId)
         {
          $value->isNotificationSent='YES';
          $value->NotificationContent=Config('app.Calledbackgenerated');
          break;
         }
         else
         {
         $value->isNotificationSent=Config('app.BPartyAwaitingPrompt');
          $value->NotificationContent=Config('app.EmptyNotificationString');
         }


       }
     }
             
      
    }

return $coreCDR;
    }
/*-----------------------------
Deprovision
----------------------------*/
  public function addDeprov(Request $request)
  { $refID=createRefID();
    $validation=Validator::make($request->all(),[
    'calledParty'=>'required'
  ]);
    if ($validation->fails()) 
  {    
    return response()->json($validation->messages(), 422);
  }
    $data='<methodCall><function>Deprovision</function><bParty>'.$request->calledParty.'</bParty><refId>CSR'.$refID.'</refId><option>on</option></methodCall>';
    return response()->json([/*SendRequest('',$data)*/'message'=>'We are here'],200);

  }
  public function addprov(Request $request)
  { $refID=createRefID();
    $validation=Validator::make($request->all(),[
    'calledParty'=>'required'
  ]);
    if ($validation->fails()) 
  {    
    return response()->json($validation->messages(), 422);
  }
    $data='<methodCall><function>Provision</function><bParty>'.$request->calledParty.'</bParty><refId>CSR'.$refID.'</refId><option>on</option></methodCall>';
    return response()->json([/*SendRequest('',$data)*/'message'=>'We are here'],200);

  }

  /*----------
  
  */
public function getservicereport(Request $request)
  {


        $yesterday=$request->yesterday;
         $month=date('m',strtotime($yesterday));
            DB::connection('mysql3')->delete('delete from service_report where dt="'.$yesterday.'"');
$subscriberGenCalls=DB::connection('mysql3')->select(DB::raw("SELECT EXTRACT( HOUR
FROM created ) AS theHour, COUNT(DISTINCT (aParty)) AS numberOfItems
FROM incoming_call_cdr_$month where Date(created)='".$yesterday."' AND opcode='INBOUND_CALL'
GROUP BY EXTRACT( HOUR
FROM created )"));

$totalCallsAttempted=DB::connection('mysql3')->select(DB::raw("SELECT EXTRACT( HOUR
FROM created ) AS theHour, COUNT( * ) AS numberOfItems
FROM incoming_call_cdr_$month where Date(created)='".$yesterday."' AND opcode='INBOUND_CALL'
GROUP BY EXTRACT( HOUR
FROM created )"));

//NotifymeOptin

$NotifymeOptin=DB::connection('mysql3')->select(DB::raw("SELECT EXTRACT( HOUR
FROM created ) AS theHour, COUNT( * ) AS numberOfItems
FROM incoming_call_cdr_$month where Date(created)='".$yesterday."' AND opcode='DTMF_RECEIVED' AND param1=1
GROUP BY EXTRACT( HOUR
FROM created )"));

$NMchargedSuccess=DB::connection('mysql3')->select(DB::raw("SELECT EXTRACT( HOUR
FROM A.created ) AS theHour, COUNT( * ) AS numberOfItems
FROM core_cdr_$month A,core_cdr_$month B WHERE (A.opcode='CHARGE_REQ' AND B.opcode='CHARGE_RES' AND A.param1='NM' AND A.refId=B.refId) AND LENGTH(B.param1)=20 AND Date(A.created)='".$yesterday."' GROUP BY EXTRACT( HOUR
FROM A.created)"));

$totalAlertsGenerated=DB::connection('mysql3')->select(DB::raw("SELECT EXTRACT( HOUR
FROM created ) AS theHour, COUNT(DISTINCT (refID)) AS numberOfItems
FROM core_cdr_$month WHERE opcode='NOTIFICATION_REQ' AND Date(created)='".$yesterday."' GROUP BY EXTRACT( HOUR
FROM created )"));
//NMclose
//ACB Start

$ACBOptin=DB::connection('mysql3')->select(DB::raw("SELECT EXTRACT( HOUR
FROM created ) AS theHour, COUNT( * ) AS numberOfItems
FROM incoming_call_cdr_$month where Date(created)='".$yesterday."' AND opcode='DTMF_RECEIVED' AND param1=2
GROUP BY EXTRACT( HOUR
FROM created )"));

$ACBchargedSuccess=DB::connection('mysql3')->select(DB::raw("SELECT EXTRACT( HOUR
FROM B.created ) AS theHour, COUNT( * ) AS numberOfItems
FROM core_cdr_$month A,core_cdr_$month B WHERE (A.opcode='CHARGE_REQ' AND B.opcode='CHARGE_RES' AND A.param1='ACB' AND A.refId=B.refId) AND LENGTH(B.param1)=20 AND Date(B.created)='".$yesterday."' GROUP BY EXTRACT( HOUR
FROM B.created )"));

$ACBcallGenerated=DB::connection('mysql3')->select(DB::raw("SELECT EXTRACT( HOUR
FROM created ) AS theHour, COUNT( * ) AS numberOfItems
FROM core_cdr_$month WHERE opcode='INITIATE_CALL_REQ' AND Date(created)='".$yesterday."' GROUP BY EXTRACT( HOUR
FROM created )"));

$ACBcallConnected=DB::connection('mysql3')->select(DB::raw("SELECT EXTRACT( HOUR
FROM created ) AS theHour, COUNT( * ) AS numberOfItems
FROM outgoing_call_cdr_$month WHERE opcode='CALL_BRIDGED' AND Date(created)='".$yesterday."' GROUP BY EXTRACT( HOUR
FROM created )"));

//ACB end

$uniqueCalledPartybecomeAvailable=DB::connection('mysql3')->select(DB::raw("SELECT EXTRACT( HOUR
FROM created ) AS theHour, COUNT(*) AS numberOfItems
FROM core_cdr_$month WHERE (opcode='NOTIFICATION_REQ' OR opcode='INITIATE_CALL_REQ') AND Date(created)='".$yesterday."' GROUP BY EXTRACT( HOUR
FROM created )"));



$uniquecalledPartyCalled=DB::connection('mysql3')->select(DB::raw("SELECT EXTRACT( HOUR
FROM created ) AS theHour, COUNT(DISTINCT bParty) AS numberOfItems
FROM incoming_call_cdr_$month WHERE DATE(created)='".$yesterday."' GROUP BY EXTRACT( HOUR
FROM created )"));



$ACBcallMAU=DB::connection('mysql3')->select(DB::raw("SELECT EXTRACT( HOUR
FROM created ) AS theHour, SUM(param1) AS numberOfItems
FROM outgoing_call_cdr_$month WHERE opcode='CALL_HANGUP' AND Date(created)='".$yesterday."' GROUP BY EXTRACT( HOUR
FROM created )"));

$uniqueCallingParty=DB::connection('mysql3')->select(DB::raw("SELECT EXTRACT( HOUR
FROM created ) AS theHour, COUNT(DISTINCT (aParty)) AS numberOfItems
FROM incoming_call_cdr_$month WHERE Date(created)='".$yesterday."' GROUP BY EXTRACT( HOUR
FROM created )"));



        //0-23 hours
        // 0 contain array for every column.
       
      $subsArray=array(
        array(0,0,0,0,0,0,0,0,0,0,0,0,0),
        array(0,0,0,0,0,0,0,0,0,0,0,0,0),
        array(0,0,0,0,0,0,0,0,0,0,0,0,0),
        array(0,0,0,0,0,0,0,0,0,0,0,0,0),
        array(0,0,0,0,0,0,0,0,0,0,0,0,0),
        array(0,0,0,0,0,0,0,0,0,0,0,0,0),
        array(0,0,0,0,0,0,0,0,0,0,0,0,0),
        array(0,0,0,0,0,0,0,0,0,0,0,0,0),
        array(0,0,0,0,0,0,0,0,0,0,0,0,0),
        array(0,0,0,0,0,0,0,0,0,0,0,0,0),
        array(0,0,0,0,0,0,0,0,0,0,0,0,0),
        array(0,0,0,0,0,0,0,0,0,0,0,0,0),
        array(0,0,0,0,0,0,0,0,0,0,0,0,0),
        array(0,0,0,0,0,0,0,0,0,0,0,0,0),
        array(0,0,0,0,0,0,0,0,0,0,0,0,0),
        array(0,0,0,0,0,0,0,0,0,0,0,0,0),
        array(0,0,0,0,0,0,0,0,0,0,0,0,0),
        array(0,0,0,0,0,0,0,0,0,0,0,0,0),
        array(0,0,0,0,0,0,0,0,0,0,0,0,0),
        array(0,0,0,0,0,0,0,0,0,0,0,0,0),
        array(0,0,0,0,0,0,0,0,0,0,0,0,0),
        array(0,0,0,0,0,0,0,0,0,0,0,0,0),
        array(0,0,0,0,0,0,0,0,0,0,0,0,0),
        array(0,0,0,0,0,0,0,0,0,0,0,0,0));
             
          for($i=0;$i<24;$i++)
      {
          foreach ($subscriberGenCalls as $key => $value) 
          {
              if($value->theHour==$i)
              { 
             $subsArray[$i][0]=$value->numberOfItems;
              }
                  }

      //totalCallAttemted
        foreach ($totalCallsAttempted as $key => $value)
         {
        if($value->theHour==$i)
          { 
       $subsArray[$i][1]=$value->numberOfItems;
              }
          }

            //uniquecalledPartyCalled

            foreach ($uniquecalledPartyCalled as $key => $value)
         {
        if($value->theHour==$i)
          { 
       $subsArray[$i][2]=$value->numberOfItems;
              }
            }


            //NotifymeOptin
      foreach ($NotifymeOptin as $key => $value)
         {
        if($value->theHour==$i)
          { 
       $subsArray[$i][3]=$value->numberOfItems;
              }
            }
            //ACB OPtin
        foreach ($ACBOptin as $key => $value)
         {  
        if($value->theHour==$i)
          { 
       $subsArray[$i][4]=$value->numberOfItems;
              }
       }
        foreach ($NMchargedSuccess as $key => $value)
         {  
        if($value->theHour==$i)
          { 
       $subsArray[$i][5]=$value->numberOfItems;
              }
       }
     //ACBsuccesschargw
foreach ($ACBchargedSuccess as $key => $value)
         {  
        if($value->theHour==$i)
          { 
       $subsArray[$i][6]=$value->numberOfItems;
          }
       }
       //totalcallgenerated

       foreach ($ACBcallGenerated as $key => $value)
         {  
        if($value->theHour==$i)
          { 
       $subsArray[$i][7]=$value->numberOfItems;
          }
       }
//total callconnected
        foreach ($ACBcallConnected as $key => $value)
         {  
        if($value->theHour==$i)
          { 
       $subsArray[$i][8]=$value->numberOfItems;
          }
       }
       //ACB MUS
        foreach ($ACBcallMAU as $key => $value)
         {  
        if($value->theHour==$i)
          { 
       $subsArray[$i][9]=$value->numberOfItems;
          }
       }
//totalAlerts Generated
       foreach ($totalAlertsGenerated as $key => $value)
         {  
        if($value->theHour==$i)
          { 
       $subsArray[$i][10]=$value->numberOfItems;
          }
       }
       //uniqueCalledPartybecomeAvailable 
       foreach ($uniqueCalledPartybecomeAvailable as $key => $value)
         {  
        if($value->theHour==$i)
          { 
       $subsArray[$i][11]=$value->numberOfItems;
          }
        }
     //uniqueCallingParty
        foreach ($uniqueCallingParty as $key => $value)
         {  
        if($value->theHour==$i)
          { 
       $subsArray[$i][12]=$value->numberOfItems;
          }
       }

      }

    
//  DB::connection('mysql3')->table('service_report')->insert($subsArray);
for($i=0;$i<24;$i++){

  if($i==0)
  {
$query="INSERT INTO service_report (dt, HOUR, serverId, totalSubscriberGeneratingCall, totalCallsAttempted, totalUniqueBpartyCalled, totalNmOptin, totalAcbOptin, totalNmChargedSuccess, totalAcbChargedSuccess, totalCallsGenerated, totalCallsConnected, totalAcbMinutesOfUse, totalNotificationAlertsGenerated, totalUniqueBpartyBecameAvailable, totalUniqueApartyBeingNotified) VALUES ";
}
if($i==23){
$query=$query."('$yesterday','$i','1','".$subsArray[$i][0]."','".$subsArray[$i][1]."','".$subsArray[$i][2]."','".$subsArray[$i][3]."','".$subsArray[$i][4]."','".$subsArray[$i][5]."','".$subsArray[$i][6]."','".$subsArray[$i][7]."','".$subsArray[$i][8]."','".$subsArray[$i][9]."','".$subsArray[$i][10]."','".$subsArray[$i][11]."','".$subsArray[$i][12]."')";
}
else
{
  $query=$query."('$yesterday','$i','1','".$subsArray[$i][0]."','".$subsArray[$i][1]."','".$subsArray[$i][2]."','".$subsArray[$i][3]."','".$subsArray[$i][4]."','".$subsArray[$i][5]."','".$subsArray[$i][6]."','".$subsArray[$i][7]."','".$subsArray[$i][8]."','".$subsArray[$i][9]."','".$subsArray[$i][10]."','".$subsArray[$i][11]."','".$subsArray[$i][12]."'),";
}
}
  
if(DB::connection('mysql3')->insert($query))
  return response()->json([
    'Resuly' => $query
]);

  }
}
