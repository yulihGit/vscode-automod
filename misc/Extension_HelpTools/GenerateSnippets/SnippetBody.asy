VERSION 12.6.1.19
SYSTYPE Process
UNITS Feet Seconds
SYSDEF UtilByAvail off RefCheck on debugger off warningMessages on report standard
FLAGS
	System Inherit
	Text Inherit
	Resources Inherit
	Resource Names Inherit
	Queues Inherit
	Queue Names Inherit
	Queue Amounts Inherit
	Blocks Inherit
	Block Names Inherit
	Labels Inherit
PROCDEF
TYPE name IntList TYPEtype list Integer
	CTYPE "AM_IntList*"
	TYPE2STRING "AM_IntListToStr"
PROC name P_Init 0 traf Infinite
PROC name P_Creation 0 traf Infinite
PROC name P_Read 0 traf Infinite
PROC name P_BreakDown 0 traf Infinite
PROC name P_Schedule 0 traf Infinite
PROC name P_Write 0 traf Infinite
LDTYPE name L_Init 0
picpos endx 1
 template Meters
700 17
2 2 0 1 1 none
1
310 0
1 1 1 1 1 0 0
end
		create con 0 Seconds stream stream_L_Init_1 First P_Init 0 Limit 1
LDTYPE name L_Read 0
picpos endx 1
 template Meters
700 17
2 2 0 1 1 none
1
310 0
1 1 1 1 1 0 0
end
LDTYPE name L_Creation 0
picpos endx 1
 template Meters
700 17
2 2 0 1 1 none
1
310 0
1 1 1 1 1 0 0
end
ATT name AI_Temp 1 10 type Integer
ATT name AR_Temp 1 10 type Real
ATT name AS_Temp 1 10 type String
ATT name ALPtr_Temp 1 10 type LoadPtr
ATT name AVehPtr_Temp 1 10 type VehiclePtr
ATT name ALoc_Temp 1 10 type Location
VAR name UI_VFileOffsetPtr 0 type FilePtr
VAR name UI_VI_Offset 0 type Integer
VAR name UI_i 0 type Integer
VAR name UI_Dummy 0 type Integer
VAR name UI_VFileRunedonePtr 0 type FilePtr
VAR name V_FilePtrIn 0 type FilePtr
VAR name VI_Row 0 type Integer
VAR name VI_Column 0 type Integer
VAR name VI_NumberOfColumns 0 type Integer
VAR name VI_Hour 0 type Integer
VAR name VI_Day 0 type Integer
VAR name VI_Week 0 type Integer
VAR name VI_Temp 1 10 type Integer
VAR name VR_Temp 1 10 type Real
VAR name VS_Temp 1 10 type String
VAR name VLPtr_Temp 1 10 type LoadPtr
VAR name VVehPtr_Temp 1 10 type VehiclePtr
VAR name VLoc_Temp 1 10 type Location
RNSTREAM stream0 0 type CMRG flags 1
	cmrgseed 1 12345 12345 12345 12345 12345 12345
RNSTREAM stream_L_Init_1 0 type CMRG flags 1
	title "Generated automatically for L_Init"
	cmrgseed 1 3692455944 1366884236 2968912127 335948734 4161675175 475798818
RNSTATE 1015873554 1310354410 2249465273 994084013 2912484720 3876682925
FUNC name pausecontinue type Integer
FUNC name F_Distribution type Real PARAM name Arg_Distrubution type String PARAM name Arg_Parameter1 type Real PARAM name Arg_Parameter2 type Real PARAM name Arg_Parameter3 type Real
FUNC name F_Time type Time PARAM name Arg_Time type String PARAM name Arg_Parameter type Real
SFileBegin	name Interface.m
begin model initialization function
//--------------User interface - Random seed manipulator---------------//
	open "offset.txt" for reading save result as UI_VFileOffsetPtr
	read UI_VI_Offset from UI_VFileOffsetPtr
	set UI_VI_Offset = UI_VI_Offset * 10000
	set UI_i=0
	while UI_i<UI_VI_Offset do begin
    	set UI_Dummy = normal 5, 1
    	inc UI_i by 1
	end 
	return 0
//---------------------------------------------------------------------//
end


#@!
SFileBegin	name Creation.m
// Creation.m 

// Retrive its load from P_Inint
// Create loads to the model.

begin P_Creation arriving procedure




end

#@!
SFileBegin	name Init.m
// Init.m //

// Declaring and seting init values and capacity on varibales, queues, resources, counter
// Init is the second procuedre in the model and is executed directly after P_Read
// The next procedure is P_Creation in Creation.m
begin P_Init arriving procedure

	/*Open links to output textfiles:*/
	//Example: open "Output/Output_Dummy.txt" for writing save result as VFPtr_OutputDummy
	
	/*Set init parameters for conveyors, pathmovers, AS/RS and Power & Free systems*/
	
	/*Set init value for varibles:*/
	set VI_Hour = 1
	set VI_Day = 1
	set VI_Week = 1
	
	/*Set init capacity for queues:*/

	/*Set init capacity or/and value for counters:*/
	
	/*set init states, capacity for resources:*/
	
	/*Set init text for labels:*/
	
	/*Set init value for attributes:*/
	
	// OBS! Cloning loads inheriting all attributes
	/*Clone loads to supervisors:*/
	
	//Clone main load to creation process
	clone 1 load to P_Creation new load type L_Creation
end

#@!
SFileBegin	name Read.m
// Read.m //

// Reading data from the User Interface located in the main model folder
// Read procedure is the first thing that happends in the model
// The next procedure is P_Init in Init.m
begin P_Read arriving 

	/*Read data from textfiles*/
	
	// Example 1:
	//1. Name your textfile
	open "Input/dummy.txt" for reading save result as V_FilePtrIn // V_FilePtrIn is a predefined varible for reading data from the UI
	
	// 2. Set size of the matrix
	//set VI_NumberOfColumns = ?? 
	
	// Reading a matix XRows*YColumn
	set VI_Row = 0
	while V_FilePtrIn eof = false do
	begin
		inc VI_Row by 1 //Point at next row
		set VI_Column = 0 // Variable that pointing at current column
		while VI_Column < VI_NumberOfColumns do
		begin
			inc VI_Column by 1 //Point at next column
			// 3. Read to your variable: read variable(VI_Row,VI_Column) from V_FilePtrIn
		end
	end
	//End of Example 1



	// Example 2:
	//1. Name your textfile
	open "Input/dummy.txt" for reading save result as V_FilePtrIn // V_FilePtrIn is a predefined varible for reading data from the UI
	
	// Reading a matix XRows*YColumn
	set VI_Row = 0
	while V_FilePtrIn eof = false do
	begin
		inc VI_Row by 1 //Point at next row
		//Read whole row
		// 2. Read to your variable: read variable1(VI_Row), variable2(VI_Row), variable3(VI_Row) ... number of column from V_FilePtrIn with delimiter "\t"
	end
	//End of Example 2
	
	
	/*Reading done*/
	close V_FilePtrIn
	set V_FilePtrIn to null
	create 1 load of load type L_Init to P_Init
end






#@!
SFileBegin	name Write.m
// Write.m //

// Writing outputs to .txtfiles

// P_Write - Writing for all finished products. OBS! Need to send loads that should be written to this process
// Snap function - Wrining to txt files every snap OBS! Need to set up a run control whith snap
// Finished function - Wrining to txt files when simulation terminates


// P_Write prints load attributes to a textfile
begin P_Write arriving

	//Example:
	//print Attribute1, "\t", Attribute2, "\t", Attribute3 to VFPtr_Dummy

end

// Snap function prints variables and states every snap
// OBS! This snap function is set to snap every hour!
begin model snap function
	
	/*Print Output*/
	
	// Example hour: 
	//print OutputType1 "\t" OutputType2 "\t" OutputType3 to VFPtr_OutputHour
	
	// Example day:
	if VI_Hour = 24 then begin
		//print OutputType1 "\t" OutputType2 "\t" OutputType3 to VFPtr_OutputDay
	end
	
	// Example week:
	if VI_Day = 7 then begin
		//print OutputType1 "\t" OutputType2 "\t" OutputType3 to VFPtr_OutputWeek
	end
	
	/*Print States*/
	
/*	Example two states:
	print Resource1 state S_Work relative average "\t" Resource1 state S_Idle relative average "\t" no line to VFPtr_Resources_Output
	print Resource2 state S_Work relative average "\t" Resource2 state S_Idle relative average to VFPtr_Resources_Output
*/	
/*	Example three states:
	print Resource1 state S_Work relative average "\t" Resource1 state S_Idle relative average "\t" Resource1 state S_Blocked relative average "\t" no line to VFPtr_Resources_Output
	print Resource2 state S_Work relative average "\t" Resource2 state S_Idle relative average "\t" Resource2 state S_Blocked relative average to VFPtr_Resources_Output
*/
/*	Example four states:
	print Resource1 state S_Work relative average "\t" Resource1 state S_Idle relative average "\t" Resource1 state S_Blocked relative average "\t" Resource1 state S_BreakDown relative average "\t" no line to VFPtr_Resources_Output
	print Resource2 state S_Work relative average "\t" Resource2 state S_Idle relative average "\t" Resource2 state S_Blocked relative average "\t" Resource2 state S_BreakDown relative average to VFPtr_Resources_Output
*/
/*	Example five states:
	print Resource1 state S_Work relative average "\t" Resource1 state S_Idle relative average "\t" Resource1 state S_Blocked relative average "\t" Resource1 state S_BreakDown relative average "\t" Resource1 state S_NotAvailable relative average "\t" no line to VFPtr_Resources_Output
	print Resource2 state S_Work relative average "\t" Resource2 state S_Idle relative average "\t" Resource2 state S_Blocked relative average "\t" Resource2 state S_BreakDown relative average "\t" Resource2 state S_NotAvailable relative average to VFPtr_Resources_Output
*/

	/*Uppdate time variables and reset variables*/
	
	// Variable pointing at the hour, day and week (1 as init value)
	// Used to snap at diffrent times
	inc VI_Hour by 1

	//Reset variables every day here
	
	if VI_Hour = 25 then
	begin
		inc VI_Day by 1
		set VI_Hour = 1 
		
		//Reset variables every day here
	end
	
	if VI_Day = 8 then 
	begin 
		inc VI_Week by 1
		set VI_Day = 1
		
		//Reset variables every week here
	end
	return 0
end


// Finished function prints variables and states when model terminates
begin model finished function

	/*Print Output */
	//Example: print VR_Total(1) "\t" VR_Total(2) "\t" VR_Total(1)+VR_Total(2) to VFPtr_Output
	
	/*Close all Output textfiles*/
	//Example: close VFPtr_Output
	
//---------------------UI Communication File-------------------//
	open "rundone.txt" for writing save result as UI_VFileRunedonePtr
//-------------------------------------------------------------//
	return 0
end


#@!
SFileBegin	name Functions.m
//F_Distribution
//Argumet1 Arg_Distrubution: Distribution type
//Argumet2 Arg_Parameter1: Parameter 1
//Argumet3 Arg_Parameter2: Parameter 2
//Argumet4 Arg_Parameter3: Parameter 3
//Function that returns a random time for the given Distribution and parameters
begin F_Distribution
	if Arg_Distrubution = "Triangular" or Arg_Distrubution = "triangular" then begin
		return	triangular Arg_Parameter1, Arg_Parameter2, Arg_Parameter3	
	end
	else if Arg_Distrubution = "Lognormal" or Arg_Distrubution = "lognormal" then begin
		return Arg_Parameter3 + lognormal Arg_Parameter1, Arg_Parameter2
	end
	else if Arg_Distrubution = "Normal" or Arg_Distrubution = "normal" then begin
		return Arg_Parameter3 + normal Arg_Parameter1, Arg_Parameter2 
	end
	else if Arg_Distrubution = "Weibull" or Arg_Distrubution = "weibull" then begin
		return Arg_Parameter3 + weibull Arg_Parameter1, Arg_Parameter2
	end
	else if Arg_Distrubution = "Uniform" or Arg_Distrubution = "uniform" then begin
		return uniform Arg_Parameter1,Arg_Parameter2
	end
	else if Arg_Distrubution = "Gamma" or Arg_Distrubution = "gamma" then begin
		return Arg_Parameter3 + gamma Arg_Parameter1, Arg_Parameter2 	
	end
	else if Arg_Distrubution = "Constant" or Arg_Distrubution = "constant" then begin
		return Arg_Parameter1	
	end
	else begin
		print "Function " Arg_Distrubution  " not found!" to message
		call pausecontinue()
		return 0
	end
end

/* Todo skapoa en funktion som retunerar tid baserat på ett värde(real) och enhet(string)
 if "minuter" 
 	then return realVariable min*/

//F_Time
//Argumet1 Arg_Time: Time unit (String)
//Argumet2 Arg_Parameter: Parameter (Real)
//Retuns Time
begin F_Time
	if Arg_Time = "s" or Arg_Time = "sec" then begin
		return Arg_Parameter sec	
	end
	else if Arg_Time = "min" then begin
		return Arg_Parameter min
	end
	else if Arg_Time = "h" or Arg_Time = "hr" then begin
		return Arg_Parameter hr
	end
	else if Arg_Time = "dag" or Arg_Time = "day" then begin
		return Arg_Parameter day
	end
	else begin
		print "Function " Arg_Time " not found!" to message
		call pausecontinue()
		return 0
	end
end

#@!
SFileBegin	name Schedule.m
begin P_Schedule arriving procedure


end

#@!
SFileBegin	name BreakDown.m
begin P_BreakDown arriving procedure


end

#@!
FUNC name Fi_CalcTime type Integer PARAM name ArgReal_Time type Real
/*****************************************************************************************************************
 * Descriptions: Excel format conversion 0.284(General) -> 650(Digital)
				 (06:50:00 AM is 0.2847222 in General format in Excel)
  * Private variables/attributes
	  - Vi_paramSec
	  - Vi_paramMin
	  - Vi_paramHour
  * Parameters: 
	  - ArgReal_Time: 0-1 (excel time in general format)

* Example:    Fi_CalcTime(0.2847222) = 650
			  1. 0.2847222 * 24*60*60 = 24600
			  2. check for integer division
			  3. 410 = 24600/60 (minutes)
			  4. 6 (6.8333) = 410 / 60 (hour)
			  5. 50 = 410 - 6 * 60 = 410 - 360
			  6. 650
 *****************************************************************************************************************/
begin Fi_CalcTime function 
  set Vi_paramSec = ArgReal_Time * 24*60*60
  if ((Vi_paramSec % 60) <> 0)
	then inc Vi_paramSec by (60 - (Vi_paramSec % 60.0))
  set Vi_paramMin = Vi_paramSec / 60
  set Vi_paramHour = Vi_paramMin / 60
  set Vi_paramMin = Vi_paramMin - Vi_paramHour * 60
  return Vi_paramHour*100 + Vi_paramMin
end