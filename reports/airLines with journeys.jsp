<%@ taglib uri="/WEB-INF/lib/reports_tld.jar" prefix="rw" %>
<%@ page language="java" import="java.io.*" errorPage="/rwerror.jsp" session="false" %>
<!--
<rw:report id="report">
<rw:objects id="objects">
<?xml version="1.0" encoding="WINDOWS-1252" ?>
<report name="airLines with journeys" DTDVersion="9.0.2.0.10">
  <xmlSettings xmlTag="MODULE1" xmlPrologType="text">
  <![CDATA[<?xml version="1.0" encoding="&Encoding"?>]]>
  </xmlSettings>
  <reportHtmlEscapes>
    <beforeReportHtmlEscape>
    <![CDATA[<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html dir=&Direction>
<head>
<meta http-equiv="Content-Type"  content="text/html; charset=&Encoding">
</head>
<body bgcolor="#ffffff">

]]>
    </beforeReportHtmlEscape>
    <afterPageHtmlEscape>
    <![CDATA[<hr size=5 noshade>
]]>
    </afterPageHtmlEscape>
    <beforeFormHtmlEscape>
    <![CDATA[<html dir=&Direction>
<body bgcolor="#ffffff">
<form method=post action="_action_">
<input name="hidden_run_parameters" type=hidden value="_hidden_">
<font color=red><!--error--></font>
<center>
<p><table border=0 cellspacing=0 cellpadding=0>
<tr>
<td><input type=submit></td>
<td width=15>
<td><input type=reset></td>
</tr>
</table>
<p><hr><p>
]]>
    </beforeFormHtmlEscape>
    <pageNavigationHtmlEscape>
    <![CDATA[<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html dir=&Direction>
<head>
<meta http-equiv="Content-Type"  content="text/html; charset=&Encoding">
<TITLE>Oracle HTML Navigator</TITLE>
<SCRIPT type="text/javascript" LANGUAGE = "JavaScript">

var jump_index = 1			// Jump to this page
var num_pages = &TotalPages			// Total number of pages
var basefilename = "&file_name"		// Base file name
var fileext = "&file_ext"		//File extension

/* jumps to "new_page" */
function new_page(form, new_page)
{
	form.reqpage.value = new_page;
	parent.frames[0].location = basefilename + "_" + new_page + "."+fileext;
}

/* go back one page */
function back(form)
{
	/* if we are not in first page */
	if (jump_index > 1)
	{
		jump_index--;
		new_page(form, jump_index);
	}
}

/* go forward one page */
function forward(form)
{
	/* if we are not in last page */
	if (jump_index < num_pages)
	{
		jump_index++;
		new_page(form, jump_index);
	}
}

/* go to first page */
function first(form)
{
	if(jump_index != 1)
	{
		jump_index = 1;
		new_page(form, jump_index);
	}
}

/* go to last page */
function last(form)
{
	if(jump_index != num_pages)
	{
		jump_index = num_pages;
		new_page(form, jump_index);
	}
}

/* go to the user specified page number */
function pagenum(form)
{
	/* sanity check */
	if (form.reqpage.value < 1)
	{
		form.reqpage.value = 1;
	}
	if (form.reqpage.value > num_pages)
	{
		form.reqpage.value = num_pages;
	}
	jump_index = form.reqpage.value;
	new_page(form, jump_index);
}
</SCRIPT>
</HEAD>

<BODY>
<FORM NAME="ThisForm" action="" onSubmit="pagenum(this); return false;">
<center><table><tr>
<td> <INPUT TYPE="button"  VALUE="<< " onClick="first(this.form)">
<td> <INPUT TYPE="button"  VALUE=" < " onClick="back(this.form)">
<td> <INPUT TYPE="button"  VALUE="Page:" onClick="pagenum(this.form)">
<td> <INPUT NAME="reqpage" VALUE="1" SIZE=2>
<td> <INPUT TYPE="button"  VALUE=" > " onClick="forward(this.form)">
<td> <INPUT TYPE="button"  VALUE=" >>" onClick="last(this.form)">
</table></center>
</FORM>
</body></html>]]>
    </pageNavigationHtmlEscape>
  </reportHtmlEscapes>
  <data>
    <dataSource name="Q_1">
      <select>
      <![CDATA[SELECT ALL AIRLINES.NAME, AIRLINES.AIRLINE_CODE, 
AIRLINES.FIRST_CLASS_COST, AIRLINES.BUSINESS_CLASS_COST, AIRLINES.ECONOMY_CLASS_COST, 
AIRPORT_LINES.FLIGHT_NUMBER, AIRPORT_LINES.FIRST_CLASS, AIRPORT_LINES.BUSINESS_CLASS, AIRPORT_LINES.ECONOMY_CLASS, AIRPORT_LINES.DISTANCE, 
AIRPORT_LINES.ARRIVED_TIME, AIRPORT_LINES.FLY_TIME, AIRPORT_LINES.STATUS_CODE, AIRPORT_LINES.PLANE_CODE, AIRPORT_LINES.FROM_AIRPORT_ID, 
AIRPORT_LINES.TO_AIRPORT_ID, AIRPLANES.PLANE_CODE, AIRPLANES.MODEL
FROM AIRLINES, AIRPORT_LINES, AIRPLANES
WHERE ((AIRPORT_LINES.PLANE_CODE = AIRPLANES.PLANE_CODE)
 AND (AIRPLANES.AIRLINE_CODE = AIRLINES.AIRLINE_CODE)) ]]>
      </select>
      <displayInfo x="1.65002" y="1.00000" width="0.69995" height="0.19995"/>
      <group name="G_FLIGHT_NUMBER">
        <displayInfo x="1.32800" y="1.94995" width="1.34412" height="0.43066"
        />
        <dataItem name="FLIGHT_NUMBER" oracleDatatype="number"
         columnOrder="16" width="22" defaultWidth="120000"
         defaultHeight="10000" columnFlags="33" defaultLabel="Flight Number">
          <dataDescriptor expression="AIRPORT_LINES.FLIGHT_NUMBER"
           descriptiveExpression="FLIGHT_NUMBER" order="6" width="22"
           precision="10"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
      </group>
      <group name="G_AIRLINE_CODE">
        <displayInfo x="1.38525" y="2.95972" width="1.22961" height="0.60156"
        />
        <dataItem name="AIRLINE_CODE" datatype="vchar2" columnOrder="12"
         width="5" defaultWidth="50000" defaultHeight="10000" columnFlags="33"
         defaultLabel="Airline Code">
          <dataDescriptor expression="AIRLINES.AIRLINE_CODE"
           descriptiveExpression="AIRLINE_CODE" order="2" width="5"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="NAME" datatype="vchar2" columnOrder="11" width="255"
         defaultWidth="100000" defaultHeight="10000" columnFlags="33"
         defaultLabel="Name">
          <dataDescriptor expression="AIRLINES.NAME"
           descriptiveExpression="NAME" order="1" width="255"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
      </group>
      <group name="G_FIRST_CLASS_COST">
        <displayInfo x="1.09875" y="3.96948" width="1.80249" height="0.77246"
        />
        <dataItem name="FIRST_CLASS_COST" oracleDatatype="number"
         columnOrder="13" width="22" defaultWidth="70000"
         defaultHeight="10000" columnFlags="33"
         defaultLabel="First Class Cost">
          <dataDescriptor expression="AIRLINES.FIRST_CLASS_COST"
           descriptiveExpression="FIRST_CLASS_COST" order="3" width="22"
           precision="5"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="BUSINESS_CLASS_COST" oracleDatatype="number"
         columnOrder="14" width="22" defaultWidth="70000"
         defaultHeight="10000" columnFlags="33"
         defaultLabel="Business Class Cost">
          <dataDescriptor expression="AIRLINES.BUSINESS_CLASS_COST"
           descriptiveExpression="BUSINESS_CLASS_COST" order="4" width="22"
           precision="5"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="ECONOMY_CLASS_COST" oracleDatatype="number"
         columnOrder="15" width="22" defaultWidth="70000"
         defaultHeight="10000" columnFlags="33"
         defaultLabel="Economy Class Cost">
          <dataDescriptor expression="AIRLINES.ECONOMY_CLASS_COST"
           descriptiveExpression="ECONOMY_CLASS_COST" order="5" width="22"
           precision="5"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="FIRST_CLASS" oracleDatatype="number" columnOrder="17"
         width="22" defaultWidth="40000" defaultHeight="10000"
         columnFlags="33" defaultLabel="First Class">
          <dataDescriptor expression="AIRPORT_LINES.FIRST_CLASS"
           descriptiveExpression="FIRST_CLASS" order="7" width="22"
           precision="2"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="BUSINESS_CLASS" oracleDatatype="number"
         columnOrder="18" width="22" defaultWidth="40000"
         defaultHeight="10000" columnFlags="33" defaultLabel="Business Class">
          <dataDescriptor expression="AIRPORT_LINES.BUSINESS_CLASS"
           descriptiveExpression="BUSINESS_CLASS" order="8" width="22"
           precision="2"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="ECONOMY_CLASS" oracleDatatype="number"
         columnOrder="19" width="22" defaultWidth="50000"
         defaultHeight="10000" columnFlags="33" defaultLabel="Economy Class">
          <dataDescriptor expression="AIRPORT_LINES.ECONOMY_CLASS"
           descriptiveExpression="ECONOMY_CLASS" order="9" width="22"
           precision="3"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="DISTANCE" datatype="vchar2" columnOrder="20"
         width="50" defaultWidth="100000" defaultHeight="10000"
         columnFlags="33" defaultLabel="Distance">
          <dataDescriptor expression="AIRPORT_LINES.DISTANCE"
           descriptiveExpression="DISTANCE" order="10" width="50"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="ARRIVED_TIME" datatype="date" oracleDatatype="date"
         columnOrder="21" width="9" defaultWidth="90000" defaultHeight="10000"
         columnFlags="33" defaultLabel="Arrived Time">
          <dataDescriptor expression="AIRPORT_LINES.ARRIVED_TIME"
           descriptiveExpression="ARRIVED_TIME" order="11" width="9"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="FLY_TIME" datatype="date" oracleDatatype="date"
         columnOrder="22" width="9" defaultWidth="90000" defaultHeight="10000"
         columnFlags="33" defaultLabel="Fly Time">
          <dataDescriptor expression="AIRPORT_LINES.FLY_TIME"
           descriptiveExpression="FLY_TIME" order="12" width="9"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="STATUS_CODE" oracleDatatype="number" columnOrder="23"
         width="22" defaultWidth="40000" defaultHeight="10000"
         columnFlags="33" defaultLabel="Status Code">
          <dataDescriptor expression="AIRPORT_LINES.STATUS_CODE"
           descriptiveExpression="STATUS_CODE" order="13" width="22"
           precision="2"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="PLANE_CODE" datatype="vchar2" columnOrder="24"
         width="7" defaultWidth="70000" defaultHeight="10000" columnFlags="33"
         defaultLabel="Plane Code">
          <dataDescriptor expression="AIRPORT_LINES.PLANE_CODE"
           descriptiveExpression="PLANE_CODE" order="14" width="7"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="FROM_AIRPORT_ID" datatype="vchar2" columnOrder="25"
         width="3" defaultWidth="30000" defaultHeight="10000" columnFlags="33"
         defaultLabel="From Airport Id">
          <dataDescriptor expression="AIRPORT_LINES.FROM_AIRPORT_ID"
           descriptiveExpression="FROM_AIRPORT_ID" order="15" width="3"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="TO_AIRPORT_ID" datatype="vchar2" columnOrder="26"
         width="3" defaultWidth="30000" defaultHeight="10000" columnFlags="33"
         defaultLabel="To Airport Id">
          <dataDescriptor expression="AIRPORT_LINES.TO_AIRPORT_ID"
           descriptiveExpression="TO_AIRPORT_ID" order="16" width="3"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="PLANE_CODE1" datatype="vchar2" columnOrder="27"
         width="5" defaultWidth="50000" defaultHeight="10000" columnFlags="33"
         defaultLabel="Plane Code1">
          <dataDescriptor expression="AIRPLANES.PLANE_CODE"
           descriptiveExpression="PLANE_CODE" order="17" width="5"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="MODEL" datatype="vchar2" columnOrder="28" width="50"
         defaultWidth="100000" defaultHeight="10000" columnFlags="33"
         defaultLabel="Model">
          <dataDescriptor expression="AIRPLANES.MODEL"
           descriptiveExpression="MODEL" order="18" width="50"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
      </group>
    </dataSource>
  </data>
  <layout>
  <section name="main">
    <body>
      <frame name="M_G_FLIGHT_NUMBER_GRPFR">
        <geometryInfo x="0.00000" y="0.00000" width="7.43750" height="0.75000"
        />
        <generalLayout verticalElasticity="variable"/>
        <visualSettings fillPattern="transparent"
         fillBackgroundColor="r100g100b100"/>
        <repeatingFrame name="R_G_FLIGHT_NUMBER" source="G_FLIGHT_NUMBER"
         printDirection="down" minWidowRecords="1" columnMode="no">
          <geometryInfo x="0.00000" y="0.00000" width="7.43750"
           height="0.75000"/>
          <generalLayout verticalElasticity="variable"/>
          <visualSettings fillPattern="transparent"
           fillBackgroundColor="TableCell"/>
          <field name="F_FLIGHT_NUMBER" source="FLIGHT_NUMBER"
           minWidowLines="1" spacing="0" alignment="start">
            <font face="helvetica" size="10" bold="yes"/>
            <geometryInfo x="1.00000" y="0.00000" width="1.81250"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
          </field>
          <frame name="M_G_AIRLINE_CODE_GRPFR">
            <geometryInfo x="0.00000" y="0.18750" width="7.43750"
             height="0.56250"/>
            <generalLayout verticalElasticity="variable"/>
            <visualSettings fillPattern="transparent"
             fillBackgroundColor="r100g100b100"/>
            <repeatingFrame name="R_G_AIRLINE_CODE" source="G_AIRLINE_CODE"
             printDirection="down" minWidowRecords="1" columnMode="no">
              <geometryInfo x="0.00000" y="0.18750" width="7.43750"
               height="0.56250"/>
              <generalLayout verticalElasticity="variable"/>
              <visualSettings fillPattern="transparent"
               fillBackgroundColor="TableCell"/>
              <field name="F_AIRLINE_CODE" source="AIRLINE_CODE"
               minWidowLines="1" spacing="0" alignment="start">
                <font face="helvetica" size="10" bold="yes"/>
                <geometryInfo x="0.87500" y="0.18750" width="0.75000"
                 height="0.18750"/>
                <generalLayout verticalElasticity="expand"/>
                <advancedLayout printObjectOnPage="allPage"
                 basePrintingOn="enclosingObject"/>
              </field>
              <frame name="M_G_FIRST_CLASS_COST_GRPFR">
                <geometryInfo x="0.00000" y="0.37500" width="7.43750"
                 height="0.37500"/>
                <generalLayout verticalElasticity="variable"/>
                <visualSettings fillPattern="transparent"
                 fillBackgroundColor="r100g100b100"/>
                <repeatingFrame name="R_G_FIRST_CLASS_COST"
                 source="G_FIRST_CLASS_COST" printDirection="down"
                 minWidowRecords="1" columnMode="no">
                  <geometryInfo x="0.00000" y="0.62500" width="7.43750"
                   height="0.12500"/>
                  <generalLayout verticalElasticity="expand"/>
                  <visualSettings fillPattern="transparent"
                   fillBackgroundColor="TableCell"/>
                  <field name="F_FIRST_CLASS_COST" source="FIRST_CLASS_COST"
                   minWidowLines="1" spacing="0" alignment="start">
                    <font face="helvetica" size="6"/>
                    <geometryInfo x="0.00000" y="0.62500" width="0.68750"
                     height="0.12500"/>
                    <generalLayout verticalElasticity="expand"/>
                  </field>
                  <field name="F_BUSINESS_CLASS_COST"
                   source="BUSINESS_CLASS_COST" minWidowLines="1" spacing="0"
                   alignment="start">
                    <font face="helvetica" size="6"/>
                    <geometryInfo x="0.68750" y="0.62500" width="0.62500"
                     height="0.12500"/>
                    <generalLayout verticalElasticity="expand"/>
                  </field>
                  <field name="F_ECONOMY_CLASS_COST"
                   source="ECONOMY_CLASS_COST" minWidowLines="1" spacing="0"
                   alignment="start">
                    <font face="helvetica" size="6"/>
                    <geometryInfo x="1.31250" y="0.62500" width="0.62500"
                     height="0.12500"/>
                    <generalLayout verticalElasticity="expand"/>
                  </field>
                  <field name="F_FIRST_CLASS" source="FIRST_CLASS"
                   minWidowLines="1" spacing="0" alignment="start">
                    <font face="helvetica" size="6"/>
                    <geometryInfo x="1.93750" y="0.62500" width="0.43750"
                     height="0.12500"/>
                    <generalLayout verticalElasticity="expand"/>
                  </field>
                  <field name="F_BUSINESS_CLASS" source="BUSINESS_CLASS"
                   minWidowLines="1" spacing="0" alignment="start">
                    <font face="helvetica" size="6"/>
                    <geometryInfo x="2.37500" y="0.62500" width="0.37500"
                     height="0.12500"/>
                    <generalLayout verticalElasticity="expand"/>
                  </field>
                  <field name="F_ECONOMY_CLASS" source="ECONOMY_CLASS"
                   minWidowLines="1" spacing="0" alignment="start">
                    <font face="helvetica" size="6"/>
                    <geometryInfo x="2.75000" y="0.62500" width="0.43750"
                     height="0.12500"/>
                    <generalLayout verticalElasticity="expand"/>
                  </field>
                  <field name="F_DISTANCE" source="DISTANCE" minWidowLines="1"
                   spacing="0" alignment="start">
                    <font face="helvetica" size="6"/>
                    <geometryInfo x="3.18750" y="0.62500" width="0.43750"
                     height="0.12500"/>
                    <generalLayout verticalElasticity="expand"/>
                  </field>
                  <field name="F_ARRIVED_TIME" source="ARRIVED_TIME"
                   minWidowLines="1" spacing="0" alignment="start">
                    <font face="helvetica" size="6"/>
                    <geometryInfo x="3.62500" y="0.62500" width="0.81250"
                     height="0.12500"/>
                    <generalLayout verticalElasticity="expand"/>
                  </field>
                  <field name="F_FLY_TIME" source="FLY_TIME" minWidowLines="1"
                   spacing="0" alignment="start">
                    <font face="helvetica" size="6"/>
                    <geometryInfo x="4.43750" y="0.62500" width="0.81250"
                     height="0.12500"/>
                    <generalLayout verticalElasticity="expand"/>
                  </field>
                  <field name="F_STATUS_CODE" source="STATUS_CODE"
                   minWidowLines="1" spacing="0" alignment="start">
                    <font face="helvetica" size="6"/>
                    <geometryInfo x="5.25000" y="0.62500" width="0.37500"
                     height="0.12500"/>
                    <generalLayout verticalElasticity="expand"/>
                  </field>
                  <field name="F_PLANE_CODE" source="PLANE_CODE"
                   minWidowLines="1" spacing="0" alignment="start">
                    <font face="helvetica" size="6"/>
                    <geometryInfo x="5.62500" y="0.62500" width="0.31250"
                     height="0.12500"/>
                    <generalLayout verticalElasticity="expand"/>
                  </field>
                  <field name="F_FROM_AIRPORT_ID" source="FROM_AIRPORT_ID"
                   minWidowLines="1" spacing="0" alignment="start">
                    <font face="helvetica" size="6"/>
                    <geometryInfo x="5.93750" y="0.62500" width="0.37500"
                     height="0.12500"/>
                    <generalLayout verticalElasticity="expand"/>
                  </field>
                  <field name="F_TO_AIRPORT_ID" source="TO_AIRPORT_ID"
                   minWidowLines="1" spacing="0" alignment="start">
                    <font face="helvetica" size="6"/>
                    <geometryInfo x="6.31250" y="0.62500" width="0.37500"
                     height="0.12500"/>
                    <generalLayout verticalElasticity="expand"/>
                  </field>
                  <field name="F_PLANE_CODE1" source="PLANE_CODE1"
                   minWidowLines="1" spacing="0" alignment="start">
                    <font face="helvetica" size="6"/>
                    <geometryInfo x="6.68750" y="0.62500" width="0.31250"
                     height="0.12500"/>
                    <generalLayout verticalElasticity="expand"/>
                  </field>
                  <field name="F_MODEL" source="MODEL" minWidowLines="1"
                   spacing="0" alignment="start">
                    <font face="helvetica" size="6"/>
                    <geometryInfo x="7.00000" y="0.62500" width="0.43750"
                     height="0.12500"/>
                    <generalLayout verticalElasticity="expand"/>
                  </field>
                </repeatingFrame>
                <frame name="M_G_FIRST_CLASS_COST_HDR">
                  <geometryInfo x="0.00000" y="0.37500" width="7.43750"
                   height="0.25000"/>
                  <advancedLayout printObjectOnPage="allPage"
                   basePrintingOn="enclosingObject"/>
                  <visualSettings fillPattern="transparent"
                   fillBackgroundColor="TableHeading"/>
                  <text name="B_FIRST_CLASS_COST" minWidowLines="1">
                    <textSettings spacing="0"/>
                    <geometryInfo x="0.00000" y="0.37500" width="0.68750"
                     height="0.12500"/>
                    <visualSettings fillBackgroundColor="TableHeading"/>
                    <textSegment>
                      <font face="helvetica" size="6" bold="yes"
                       textColor="white"/>
                      <string>
                      <![CDATA[First Class Cost]]>
                      </string>
                    </textSegment>
                  </text>
                  <text name="B_BUSINESS_CLASS_COST" minWidowLines="1">
                    <textSettings spacing="0"/>
                    <geometryInfo x="0.68750" y="0.37500" width="0.62500"
                     height="0.25000"/>
                    <visualSettings fillBackgroundColor="TableHeading"/>
                    <textSegment>
                      <font face="helvetica" size="6" bold="yes"
                       textColor="white"/>
                      <string>
                      <![CDATA[Business
]]>
                      </string>
                    </textSegment>
                    <textSegment>
                      <font face="helvetica" size="6" bold="yes"
                       textColor="white"/>
                      <string>
                      <![CDATA[Class Cost]]>
                      </string>
                    </textSegment>
                  </text>
                  <text name="B_ECONOMY_CLASS_COST" minWidowLines="1">
                    <textSettings spacing="0"/>
                    <geometryInfo x="1.31250" y="0.37500" width="0.62500"
                     height="0.25000"/>
                    <visualSettings fillBackgroundColor="TableHeading"/>
                    <textSegment>
                      <font face="helvetica" size="6" bold="yes"
                       textColor="white"/>
                      <string>
                      <![CDATA[Economy
]]>
                      </string>
                    </textSegment>
                    <textSegment>
                      <font face="helvetica" size="6" bold="yes"
                       textColor="white"/>
                      <string>
                      <![CDATA[Class Cost]]>
                      </string>
                    </textSegment>
                  </text>
                  <text name="B_FIRST_CLASS" minWidowLines="1">
                    <textSettings spacing="0"/>
                    <geometryInfo x="1.93750" y="0.37500" width="0.43750"
                     height="0.12500"/>
                    <visualSettings fillBackgroundColor="TableHeading"/>
                    <textSegment>
                      <font face="helvetica" size="6" bold="yes"
                       textColor="white"/>
                      <string>
                      <![CDATA[First Class]]>
                      </string>
                    </textSegment>
                  </text>
                  <text name="B_BUSINESS_CLASS" minWidowLines="1">
                    <textSettings spacing="0"/>
                    <geometryInfo x="2.37500" y="0.37500" width="0.37500"
                     height="0.25000"/>
                    <visualSettings fillBackgroundColor="TableHeading"/>
                    <textSegment>
                      <font face="helvetica" size="6" bold="yes"
                       textColor="white"/>
                      <string>
                      <![CDATA[Business
]]>
                      </string>
                    </textSegment>
                    <textSegment>
                      <font face="helvetica" size="6" bold="yes"
                       textColor="white"/>
                      <string>
                      <![CDATA[Class]]>
                      </string>
                    </textSegment>
                  </text>
                  <text name="B_ECONOMY_CLASS" minWidowLines="1">
                    <textSettings spacing="0"/>
                    <geometryInfo x="2.75000" y="0.37500" width="0.43750"
                     height="0.25000"/>
                    <visualSettings fillBackgroundColor="TableHeading"/>
                    <textSegment>
                      <font face="helvetica" size="6" bold="yes"
                       textColor="white"/>
                      <string>
                      <![CDATA[Economy
]]>
                      </string>
                    </textSegment>
                    <textSegment>
                      <font face="helvetica" size="6" bold="yes"
                       textColor="white"/>
                      <string>
                      <![CDATA[Class]]>
                      </string>
                    </textSegment>
                  </text>
                  <text name="B_DISTANCE" minWidowLines="1">
                    <textSettings spacing="0"/>
                    <geometryInfo x="3.18750" y="0.37500" width="0.43750"
                     height="0.12500"/>
                    <visualSettings fillBackgroundColor="r25g50b75"/>
                    <textSegment>
                      <font face="helvetica" size="6" bold="yes"
                       textColor="white"/>
                      <string>
                      <![CDATA[Distance]]>
                      </string>
                    </textSegment>
                  </text>
                  <text name="B_ARRIVED_TIME" minWidowLines="1">
                    <textSettings spacing="0"/>
                    <geometryInfo x="3.62500" y="0.37500" width="0.81250"
                     height="0.12500"/>
                    <visualSettings fillBackgroundColor="TableHeading"/>
                    <textSegment>
                      <font face="helvetica" size="6" bold="yes"
                       textColor="white"/>
                      <string>
                      <![CDATA[Arrived Time]]>
                      </string>
                    </textSegment>
                  </text>
                  <text name="B_FLY_TIME" minWidowLines="1">
                    <textSettings spacing="0"/>
                    <geometryInfo x="4.43750" y="0.37500" width="0.81250"
                     height="0.12500"/>
                    <visualSettings fillBackgroundColor="TableHeading"/>
                    <textSegment>
                      <font face="helvetica" size="6" bold="yes"
                       textColor="white"/>
                      <string>
                      <![CDATA[Fly Time]]>
                      </string>
                    </textSegment>
                  </text>
                  <text name="B_STATUS_CODE" minWidowLines="1">
                    <textSettings spacing="0"/>
                    <geometryInfo x="5.25000" y="0.37500" width="0.37500"
                     height="0.25000"/>
                    <visualSettings fillBackgroundColor="TableHeading"/>
                    <textSegment>
                      <font face="helvetica" size="6" bold="yes"
                       textColor="white"/>
                      <string>
                      <![CDATA[Status
]]>
                      </string>
                    </textSegment>
                    <textSegment>
                      <font face="helvetica" size="6" bold="yes"
                       textColor="white"/>
                      <string>
                      <![CDATA[Code]]>
                      </string>
                    </textSegment>
                  </text>
                  <text name="B_PLANE_CODE" minWidowLines="1">
                    <textSettings spacing="0"/>
                    <geometryInfo x="5.62500" y="0.37500" width="0.31250"
                     height="0.25000"/>
                    <visualSettings fillBackgroundColor="r25g50b75"/>
                    <textSegment>
                      <font face="helvetica" size="6" bold="yes"
                       textColor="white"/>
                      <string>
                      <![CDATA[Plane
]]>
                      </string>
                    </textSegment>
                    <textSegment>
                      <font face="helvetica" size="6" bold="yes"
                       textColor="white"/>
                      <string>
                      <![CDATA[Code]]>
                      </string>
                    </textSegment>
                  </text>
                  <text name="B_FROM_AIRPORT_ID" minWidowLines="1">
                    <textSettings spacing="0"/>
                    <geometryInfo x="5.93750" y="0.37500" width="0.37500"
                     height="0.25000"/>
                    <visualSettings fillBackgroundColor="r25g50b75"/>
                    <textSegment>
                      <font face="helvetica" size="6" bold="yes"
                       textColor="white"/>
                      <string>
                      <![CDATA[From
]]>
                      </string>
                    </textSegment>
                    <textSegment>
                      <font face="helvetica" size="6" bold="yes"
                       textColor="white"/>
                      <string>
                      <![CDATA[Airport Id]]>
                      </string>
                    </textSegment>
                  </text>
                  <text name="B_TO_AIRPORT_ID" minWidowLines="1">
                    <textSettings spacing="0"/>
                    <geometryInfo x="6.31250" y="0.37500" width="0.37500"
                     height="0.25000"/>
                    <visualSettings fillBackgroundColor="r25g50b75"/>
                    <textSegment>
                      <font face="helvetica" size="6" bold="yes"
                       textColor="white"/>
                      <string>
                      <![CDATA[To
]]>
                      </string>
                    </textSegment>
                    <textSegment>
                      <font face="helvetica" size="6" bold="yes"
                       textColor="white"/>
                      <string>
                      <![CDATA[Airport Id]]>
                      </string>
                    </textSegment>
                  </text>
                  <text name="B_PLANE_CODE1" minWidowLines="1">
                    <textSettings spacing="0"/>
                    <geometryInfo x="6.68750" y="0.37500" width="0.31250"
                     height="0.25000"/>
                    <visualSettings fillBackgroundColor="r25g50b75"/>
                    <textSegment>
                      <font face="helvetica" size="6" bold="yes"
                       textColor="white"/>
                      <string>
                      <![CDATA[Plane
]]>
                      </string>
                    </textSegment>
                    <textSegment>
                      <font face="helvetica" size="6" bold="yes"
                       textColor="white"/>
                      <string>
                      <![CDATA[Code1]]>
                      </string>
                    </textSegment>
                  </text>
                  <text name="B_MODEL" minWidowLines="1">
                    <textSettings spacing="0"/>
                    <geometryInfo x="7.00000" y="0.37500" width="0.43750"
                     height="0.12500"/>
                    <visualSettings fillBackgroundColor="r25g50b75"/>
                    <textSegment>
                      <font face="helvetica" size="6" bold="yes"
                       textColor="white"/>
                      <string>
                      <![CDATA[Model]]>
                      </string>
                    </textSegment>
                  </text>
                </frame>
              </frame>
              <text name="B_AIRLINE_CODE" minWidowLines="1">
                <textSettings spacing="0"/>
                <geometryInfo x="0.00000" y="0.18750" width="0.87500"
                 height="0.18750"/>
                <advancedLayout printObjectOnPage="allPage"
                 basePrintingOn="enclosingObject"/>
                <visualSettings fillBackgroundColor="r25g50b75"/>
                <textSegment>
                  <font face="helvetica" size="10" bold="yes"/>
                  <string>
                  <![CDATA[Airline Code]]>
                  </string>
                </textSegment>
              </text>
              <field name="F_NAME" source="NAME" minWidowLines="1" spacing="0"
               alignment="start">
                <font face="helvetica" size="10" bold="yes"/>
                <geometryInfo x="2.06250" y="0.18750" width="1.50000"
                 height="0.18750"/>
                <generalLayout verticalElasticity="expand"/>
                <advancedLayout printObjectOnPage="allPage"
                 basePrintingOn="enclosingObject"/>
              </field>
              <text name="B_NAME" minWidowLines="1">
                <textSettings spacing="0"/>
                <geometryInfo x="1.62500" y="0.18750" width="0.43750"
                 height="0.18750"/>
                <advancedLayout printObjectOnPage="allPage"
                 basePrintingOn="enclosingObject"/>
                <visualSettings fillBackgroundColor="r25g50b75"/>
                <textSegment>
                  <font face="helvetica" size="10" bold="yes"/>
                  <string>
                  <![CDATA[Name]]>
                  </string>
                </textSegment>
              </text>
            </repeatingFrame>
          </frame>
          <text name="B_FLIGHT_NUMBER" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="0.00000" y="0.00000" width="1.00000"
             height="0.18750"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
            <visualSettings fillBackgroundColor="TableHeading"/>
            <textSegment>
              <font face="helvetica" size="10" bold="yes"/>
              <string>
              <![CDATA[Flight Number]]>
              </string>
            </textSegment>
          </text>
        </repeatingFrame>
      </frame>
    </body>
    <margin>
      <image name="B_1_SEC2" templateSection="main">
        <geometryInfo x="0.50000" y="0.31250" width="1.40625" height="0.37500"
        />
        <visualSettings fillPattern="transparent" fillBackgroundColor="black"
         linePattern="transparent" lineBackgroundColor="black"/>
        <points>
          <point x="0.00000" y="0.00000"/>
          <point x="1.40625" y="0.37500"/>
          <point x="0.50000" y="0.31250"/>
          <point x="1.40625" y="0.37500"/>
        </points>
        <binaryData encoding="hexidecimal" dataId="image.B_1_SEC2">
          
74946483 93167800 42007F00 00FFFFFF 898989FF 00005E5E 5ECCCCCC 2B2B2BE9
E9E99F9F 9FFBFBFB 2F2F2F8B 8B8B2D2D 2DCECECE BABABA5A 5A5AFDFD FD5C5C5C
8D8D8DFF 0101FFFB FBFFFEFE FFF9F9FF 0505FFFD FDFF0707 FF0606FF 0808FF03
03FFFAFA FF0404FF FCFCFF02 02FFF8F8 E9F8F82B 27272D34 349FA0A0 5E62628B
87875E5D 5DFBF5F5 CCC4C49F 9B9B0000 00000000 00000000 00000000 00000000
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000 00129F40 00000000 00C20000 00007800 42000080
FF003080 C1840B0A 1C388031 A2C58C01 16884152 40844104 2640A868 8133E043
07000874 0030A061 8F830A0C 143040A3 E7400408 0E8C5912 90E7C69B 01142859
83172589 820624EC F90438A0 51801A02 2859E080 A18B9C27 1A3060B2 96A0C794
2B0ECC68 C158E7CB 0317386D FA0617A0 C10A0A0E 00F82550 E20F8B00 BAAC6A30
9AA7C893 0FA63C3A F514C44C 016BFE7D 1B70C001 C6000218 0E8BE131 81450400
24252887 1EE45C94 750AD518 D06086E8 0F850A10 0B6162AF 4FB4AF7E 8500F0A0
21039B19 92205A05 F3EB628C 43DAC509 651DABC5 99A56E75 90215240 D9041E32
17DA3164 B6D3D00A CE6C28B6 D3E16184 00760628 1DD635EC D29308CD 80A4FBE4
FF898616 5250C0D1 E3808F0E 1B200FF0 5C37E40B 0D183070 90516970 83B00E04
7E28A0C7 49040040 2181BDA4 A0418100 E5408287 BD00A060 0F153850 63030C58
40810A06 46141602 0C789FDA 441C70F1 66000878 F1A00ACD 74E1A980 08602080
724118CF 10001648 10810F6D D850EF44 1218F2DF 810C3811 E4883E19 6003524D
6092E509 3940F127 05185002 4A8E10E4 91800D18 74E1C78C EDC8104D 80004083
E30B21F8 40AF8E0A 7424219A 0A1974A3 87060571 4A8E51E4 D5E78318 9851C782
3E7403AA 8E1150C4 688141D8 B2D10E08 2810E995 46E4D62B 9B6A3AF6 A4A176E8
1DD75D7E 78C71E41 8A509141 761498B2 5D920CD9 E712AB25 10A06579 864826A7
FF4CA618 0185A042 E486A486 BE0900C2 0116DAF5 D8AA76E4 C46C8752 0092A1A0
04692086 05A9AAF1 DCA40ABA B2D2A502 7800C08A 0640E1D3 0A0E76B2 9FA50A30
07EDA366 4866A650 56C89399 ADCA74C1 4A81F974 BE270FC6 898394B1 005B5E21
899620D0 448A296B 7DE74C08 6850FEAF 2D108031 8E0CB5F3 D4092697 83D6A214
C7822AA0 04E92860 531CCBF1 14B2B6BA 9313C11A 105040C1 12FBAF6E 8923E853
64AE1540 B2B0582A 00024E42 C67A0009 8FEA3900 84C152E4 1F11A6C2 E422300A
F2FBF15E A1763001 33079E68 B29CCE19 AC406291 451B2000 DB25A86F 200EEE40
A100D414 A8B520A1 2659F125 C123EBBA 29CF3D30 D0F19A00 4C337DD8 361001B5
FFD63648 8DE7424F 78023001 F2BBE1D0 E9182BD1 0ADA1060 2181AC6B 00E6B749
4F2D14D1 04085BC8 6CAB2520 808ED104 30CD2E4E 730090A2 81B65009 7A8A5A60
3F23BE6F 500564E4 433B52A7 D0081D21 C1BF6718 A082983D 202AFEBD 1D5830C1
83006D3D 2EA46618 9969BF59 8BA06ABB 2D3FF8E7 4F048022 480DCF48 12890A2C
7ED0B807 20E49A31 8183E425 F7BE97E4 808CDB25 BF6024AD 3E4FFDEF 44F75A80
ACF00058 0CAF8010 20040CBD C3080850 40BC0011 85ABFA43 0018C43F 88108080
E2C9C205 75F51700 20308831 D0220908 93930C40 908CFAB0 6CAC382C 311E7058
70085041 04101BA1 1ED62100 1871630D 3230080E F401040C 64950118 83920010
FF938000 E12107E4 B2950C70 14893930 29075271 47004C27 8C4350C7 0903B213
2E11F329 00B2600C A700840C 80788839 706008A5 70A80010 33570AB0 60111837
A5029BE3 2F087B42 0698814C 9871B48F 142223DC 98A3CF80 30698508 50020C38
C4CF8861 1182CB50 25B600CF 9B360026 3C08A19B 17522442 0632F98F 1180081D
C804CF98 A09F8F1C 7F974458 F1403A21 1F8B44C2 E74019C0 C59831F1 94D27045
090069C0 5672F580 64004625 87E00E09 A1F38149 30292118 600CBD74 2395A482
2B290983 1652FB27 876CF8C0 08A28088 C4102799 841A842D 5916C00C C1F49B44
C9889410 7C440AF0 398CA413 D50F9910 8BD84375 24DC7426 0320D0C0 00733F80
FF493089 13A7BAC9 3971BB90 0092E74E 001DB772 20B7926C 67A33798 0BC872E4
6C880C8E 5D3DA9AF 4F842089 293CD7A6 5E100A41 E5629F53 C4286006 D9F34C36
50D3230D 52E43B59 000608B0 579C25C3 6C193900 0A26E460 8E1D594D 0B005000
56F0DC90 9442E813 A9F540A8 2496AEBC 762A4169 73C16EC9 8A980CBD CE113A7B
96A6F479 90FCB1A0 54B884D4 6EF469A4 05662E15 87C0012A 10AA8404 C6184300
6004004C E0018CC9 21410040 CDAA74CC AB445620 500984D3 9E85F99F 647A2854
29B540B8 61DE9915 C8636100 794EA2B2 7D7141F0 60639A92 5C3616F9 9E5D01A0
5D0AA592 96531784 64106E5D 4B56D762 81709F1C 59200020 625462ED 8CACF4EB
D62E13A7 831F72E1 D106A400 C1006BF1 46C28333 9A7D6AAA 41720CD4 5EA485B7
951CE345 3B894872 20D10B08 A1D10600 010A8212 3206D5CE A6730080 084E0065
9AF41F65 45CBA541 F24258A5 555FE008 DB0E57FE 40DDB7B5 5FE22B49 AE58FA47
7FBCFDEF AF7FFB00 E00B085A B10100B3 DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC
DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC
DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC
DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC
DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC
DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC
DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC
DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC
DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC
DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC
DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC
DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC
DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC
DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC
DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC
DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC
DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC
DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC
DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC
DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC
DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC
DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC
DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC
DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC
DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC
DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC
DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC DCDCDCDC
DCDCDCDC DCDCDCDC DCDCDCDC DCDCDFDF
        </binaryData>
      </image>
    </margin>
  </section>
  </layout>
  <colorPalette>
    <color index="190" displayName="TextColor" value="#ff0000"/>
    <color index="191" displayName="TableHeading" value="#999999"/>
    <color index="192" displayName="TableCell" value="#eaeaea"/>
    <color index="193" displayName="Totals" value="#d6d6d6"/>
  </colorPalette>
  <reportPrivate defaultReportType="masterDetail" versionFlags2="0"
   templateName="rwgray"/>
  <reportWebSettings>
  <![CDATA[]]>
  </reportWebSettings>
</report>
</rw:objects>
-->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<HTML>

<HEAD>
  <TITLE> Your Title </TITLE>
  <rw:style id="rwgray170">
<link rel="StyleSheet" type="text/css" href="css/rwgray.css">
</rw:style>

  <META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</HEAD>

<BODY bgColor="#ffffff" link="#000000" vLink="#000000">

<TABLE border=0 cellPadding=0 cellSpacing=0 width="100%">
  <TBODY>
  <TR>
    <TD bgColor="#ffffff" rowSpan=2 vAlign=middle width=188><IMG alt="" src="images/rwgray_logo.gif" width="135" height="36"></TD>
    <TD bgColor="#ffffff" height=40 vAlign=top><IMG alt="" height=1 src="images/stretch.gif" width=5></TD>
    <TD align=right bgColor="#ffffff" vAlign=bottom>&nbsp;</TD>
  </TR>
  </TBODY>
</TABLE>

<TABLE bgColor="#ff0000" border=0 cellPadding=0 cellSpacing=0 width="100%">
  <TBODY>
  <TR>
    <TD bgColor="#ff0000" class="OraColumnHeader">&nbsp;</TD>
  </TR>
  </TBODY>
</TABLE>

<TABLE border=0 cellPadding=0 cellSpacing=0 width="100%">
  <TBODY>
  <TR>
    <TD bgColor="#ff0000" vAlign=top class="OraColumnHeader"><IMG alt="" border=0 height=17 src="images/topcurl.gif" width=30></TD>
    <TD vAlign=top width="100%">
      <TABLE border=0 cellPadding=0 cellSpacing=0 width="100%">
        <TBODY>
        <TR>
          <TD bgColor="#000000" height=1><IMG alt="" border=0 height=1 src="images/stretch.gif" width=1></TD>
        </TR>
        <TR>
          <TD bgColor="#9a9c9a" height=1><IMG alt="" border=0 height=1 src="images/stretch.gif" width=1></TD>
        </TR>
        <TR>
          <TD bgColor="#b3b4b3" height=1><IMG alt="" border=0 height=1 src="images/stretch.gif" width=1></TD>
        </TR>
        </TBODY>
      </TABLE>
    </TD>
  </TR>
  </TBODY>
</TABLE>

<TABLE width="100%" border="0" cellspacing="0" cellpadding="0">
  <TR>
    <TD width="29%" valign="top">
      <TABLE width="77%" border="0" cellspacing="0" cellpadding="0">
        <TR>
          <TD width="10%" class="OraCellText"><IMG alt="" src="images/red_d_arrow.gif" width="10" height="10"></TD>
          <TD width="90%" class="OraCellText">Navigation goes here </TD>
        </TR>
        <TR>
          <TD width="10%" class="OraCellText"><IMG alt="" src="images/red_r_arrow.gif" width="10" height="10"></TD>
          <TD width="90%" class="OraCellText">Navigation Item</TD>
        </TR>
      </TABLE>
    </TD>
    <TD width="71%">
      <DIV align="center">
      <!-- Data Area Generated by Reports Developer -->
<rw:dataArea id="MGFLIGHTNUMBERGRPFR41">
<rw:foreach id="RGFLIGHTNUMBER411" src="G_FLIGHT_NUMBER">
<!-- Start GetGroupHeader/n --> <table class="OraTable">
 <caption class="OraHeader">  <br>Flight Number <rw:field id="F_FLIGHT_NUMBER" src="FLIGHT_NUMBER" breakLevel="RGFLIGHTNUMBER411" breakValue="&nbsp;"> F_FLIGHT_NUMBER </rw:field><br>
 </caption>
<!-- End GetGroupHeader/n -->   <tr>
    <td valign="top">
    <rw:foreach id="RGAIRLINECODE411" src="G_AIRLINE_CODE">
<!-- Start GetGroupHeader/n -->     <table class="OraTable">
     <tr>
      <th class="OraHeader"> Airline Code <rw:field id="F_AIRLINE_CODE" src="AIRLINE_CODE" breakLevel="RGAIRLINECODE411" breakValue="&nbsp;"> F_AIRLINE_CODE </rw:field></th>
      <th class="OraHeader"> Name <rw:field id="F_NAME" src="NAME" breakLevel="RGAIRLINECODE411" breakValue="&nbsp;"> F_NAME </rw:field></th>
     </tr>
<!-- End GetGroupHeader/n -->       <tr>
        <td valign="top" colspan="2">
        <table class="OraTable" summary="">
         <!-- Header -->
         <thead>
          <tr>
           <th <rw:id id="HBFIRSTCLASSCOST41" asArray="no"/> class="OraColumnHeader"> First Class Cost </th>
           <th <rw:id id="HBBUSINESSCLASSCOST41" asArray="no"/> class="OraColumnHeader"> Business
Class Cost </th>
           <th <rw:id id="HBECONOMYCLASSCOST41" asArray="no"/> class="OraColumnHeader"> Economy
Class Cost </th>
           <th <rw:id id="HBFIRSTCLASS41" asArray="no"/> class="OraColumnHeader"> First Class </th>
           <th <rw:id id="HBBUSINESSCLASS41" asArray="no"/> class="OraColumnHeader"> Business
Class </th>
           <th <rw:id id="HBECONOMYCLASS41" asArray="no"/> class="OraColumnHeader"> Economy
Class </th>
           <th <rw:id id="HBDISTANCE41" asArray="no"/> class="OraColumnHeader"> Distance </th>
           <th <rw:id id="HBARRIVEDTIME41" asArray="no"/> class="OraColumnHeader"> Arrived Time </th>
           <th <rw:id id="HBFLYTIME41" asArray="no"/> class="OraColumnHeader"> Fly Time </th>
           <th <rw:id id="HBSTATUSCODE41" asArray="no"/> class="OraColumnHeader"> Status
Code </th>
           <th <rw:id id="HBPLANECODE41" asArray="no"/> class="OraColumnHeader"> Plane
Code </th>
           <th <rw:id id="HBFROMAIRPORTID41" asArray="no"/> class="OraColumnHeader"> From
Airport Id </th>
           <th <rw:id id="HBTOAIRPORTID41" asArray="no"/> class="OraColumnHeader"> To
Airport Id </th>
           <th <rw:id id="HBPLANECODE141" asArray="no"/> class="OraColumnHeader"> Plane
Code1 </th>
           <th <rw:id id="HBMODEL41" asArray="no"/> class="OraColumnHeader"> Model </th>
          </tr>
         </thead>
         <!-- Body -->
         <tbody>
          <rw:foreach id="RGFIRSTCLASSCOST411" src="G_FIRST_CLASS_COST">
           <tr>
            <td <rw:headers id="HFFIRSTCLASSCOST41" src="HBFIRSTCLASSCOST41"/> class="OraCellNumber"><rw:field id="FFIRSTCLASSCOST41" src="FIRST_CLASS_COST" nullValue="&nbsp;"> F_FIRST_CLASS_COST </rw:field></td>
            <td <rw:headers id="HFBUSINESSCLASSCOST41" src="HBBUSINESSCLASSCOST41"/> class="OraCellNumber"><rw:field id="FBUSINESSCLASSCOST41" src="BUSINESS_CLASS_COST" nullValue="&nbsp;"> F_BUSINESS_CLASS_COST </rw:field></td>
            <td <rw:headers id="HFECONOMYCLASSCOST41" src="HBECONOMYCLASSCOST41"/> class="OraCellNumber"><rw:field id="FECONOMYCLASSCOST41" src="ECONOMY_CLASS_COST" nullValue="&nbsp;"> F_ECONOMY_CLASS_COST </rw:field></td>
            <td <rw:headers id="HFFIRSTCLASS41" src="HBFIRSTCLASS41"/> class="OraCellNumber"><rw:field id="FFIRSTCLASS41" src="FIRST_CLASS" nullValue="&nbsp;"> F_FIRST_CLASS </rw:field></td>
            <td <rw:headers id="HFBUSINESSCLASS41" src="HBBUSINESSCLASS41"/> class="OraCellNumber"><rw:field id="FBUSINESSCLASS41" src="BUSINESS_CLASS" nullValue="&nbsp;"> F_BUSINESS_CLASS </rw:field></td>
            <td <rw:headers id="HFECONOMYCLASS41" src="HBECONOMYCLASS41"/> class="OraCellNumber"><rw:field id="FECONOMYCLASS41" src="ECONOMY_CLASS" nullValue="&nbsp;"> F_ECONOMY_CLASS </rw:field></td>
            <td <rw:headers id="HFDISTANCE41" src="HBDISTANCE41"/> class="OraCellText"><rw:field id="FDISTANCE41" src="DISTANCE" nullValue="&nbsp;"> F_DISTANCE </rw:field></td>
            <td <rw:headers id="HFARRIVEDTIME41" src="HBARRIVEDTIME41"/> class="OraCellText"><rw:field id="FARRIVEDTIME41" src="ARRIVED_TIME" nullValue="&nbsp;"> F_ARRIVED_TIME </rw:field></td>
            <td <rw:headers id="HFFLYTIME41" src="HBFLYTIME41"/> class="OraCellText"><rw:field id="FFLYTIME41" src="FLY_TIME" nullValue="&nbsp;"> F_FLY_TIME </rw:field></td>
            <td <rw:headers id="HFSTATUSCODE41" src="HBSTATUSCODE41"/> class="OraCellNumber"><rw:field id="FSTATUSCODE41" src="STATUS_CODE" nullValue="&nbsp;"> F_STATUS_CODE </rw:field></td>
            <td <rw:headers id="HFPLANECODE41" src="HBPLANECODE41"/> class="OraCellText"><rw:field id="FPLANECODE41" src="PLANE_CODE" nullValue="&nbsp;"> F_PLANE_CODE </rw:field></td>
            <td <rw:headers id="HFFROMAIRPORTID41" src="HBFROMAIRPORTID41"/> class="OraCellText"><rw:field id="FFROMAIRPORTID41" src="FROM_AIRPORT_ID" nullValue="&nbsp;"> F_FROM_AIRPORT_ID </rw:field></td>
            <td <rw:headers id="HFTOAIRPORTID41" src="HBTOAIRPORTID41"/> class="OraCellText"><rw:field id="FTOAIRPORTID41" src="TO_AIRPORT_ID" nullValue="&nbsp;"> F_TO_AIRPORT_ID </rw:field></td>
            <td <rw:headers id="HFPLANECODE141" src="HBPLANECODE141"/> class="OraCellText"><rw:field id="FPLANECODE141" src="PLANE_CODE1" nullValue="&nbsp;"> F_PLANE_CODE1 </rw:field></td>
            <td <rw:headers id="HFMODEL41" src="HBMODEL41"/> class="OraCellText"><rw:field id="FMODEL41" src="MODEL" nullValue="&nbsp;"> F_MODEL </rw:field></td>
           </tr>
          </rw:foreach>
         </tbody>
         <tr>
         </tr>
        </table>
       </td>
      </tr>
     </table>
    </rw:foreach>
    <table class="OraTable" summary="">
    </table>
   </td>
  </tr>
 </table>
</rw:foreach>
<table class="OraTable" summary="">
</table>
</rw:dataArea> <!-- id="MGFLIGHTNUMBERGRPFR41" -->
<!-- End of Data Area Generated by Reports Developer -->

      </DIV>
    </TD>
  </TR>
</TABLE>

<P>
  <BR>
</P>

<TABLE border=0 cellPadding=0 cellSpacing=0 width="100%">
  <TBODY>
  <TR>
    <TD bgColor="#000000" colSpan=2><IMG alt="" border=0 height=1 src="images/stretch.gif" width=1></TD>
  </TR>
  <TR>
    <TD bgColor="#ff0000" colSpan=2 class="OraColumnHeader"><IMG alt="" border=0 height=4 src="images/stretch.gif" width=1></TD>
  </TR>
  <TR>
    <TD bgColor="#000000" colSpan=2><IMG alt="" border=0 height=1 src="images/stretch.gif" width=1></TD>
  </TR>
  <TR>
    <TD bgColor="#ffffff">&nbsp;</TD>
    <TD align=right bgColor="#ffffff">&nbsp;</TD>
  </TR>
  </TBODY>
</TABLE>

</BODY>

</HTML>

<!--
</rw:report>
-->
