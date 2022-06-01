<%@ taglib uri="/WEB-INF/lib/reports_tld.jar" prefix="rw" %>
<%@ page language="java" import="java.io.*" errorPage="/rwerror.jsp" session="false" %>
<!--
<rw:report id="report">
<rw:objects id="objects">
<?xml version="1.0" encoding="WINDOWS-1252" ?>
<report name="RE_RESERVATIONS" DTDVersion="9.0.2.0.10">
  <xmlSettings xmlTag="MODULE2" xmlPrologType="text">
  <![CDATA[<?xml version="1.0" encoding="&Encoding"?>]]>
  </xmlSettings>
  <reportHtmlEscapes>
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
      <![CDATA[SELECT ALL RESERVATIONS.DESTINATION, 
RESERVATIONS.FLIGHT_DATE, RESERVATIONS.RETURN_DATE, RESERVATIONS.PURPOSE, 
RESERVATIONS.CLIENT_ID, RESERVATIONS.FLIGHT_RETURN_NUMBER, RESERVATIONS.FLIGHT_NUMBER, 
RESERVATIONS.PASSPORT_NUM, RESERVATIONS.CLASS_ID
FROM RESERVATIONS ]]>
      </select>
      <displayInfo x="1.65002" y="1.00000" width="0.69995" height="0.19995"/>
      <group name="G_DESTINATION">
        <displayInfo x="0.93787" y="1.94995" width="2.12439" height="1.69922"
        />
        <dataItem name="DESTINATION" datatype="vchar2" columnOrder="11"
         width="50" defaultWidth="100000" defaultHeight="10000"
         columnFlags="33" defaultLabel="Destination">
          <dataDescriptor expression="RESERVATIONS.DESTINATION"
           descriptiveExpression="DESTINATION" order="1" width="50"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="FLIGHT_DATE" datatype="date" oracleDatatype="date"
         columnOrder="12" width="9" defaultWidth="90000" defaultHeight="10000"
         columnFlags="33" defaultLabel="Flight Date">
          <dataDescriptor expression="RESERVATIONS.FLIGHT_DATE"
           descriptiveExpression="FLIGHT_DATE" order="2" width="9"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="RETURN_DATE" datatype="date" oracleDatatype="date"
         columnOrder="13" width="9" defaultWidth="90000" defaultHeight="10000"
         columnFlags="33" defaultLabel="Return Date">
          <dataDescriptor expression="RESERVATIONS.RETURN_DATE"
           descriptiveExpression="RETURN_DATE" order="3" width="9"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="PURPOSE" datatype="vchar2" columnOrder="14"
         width="100" defaultWidth="100000" defaultHeight="10000"
         columnFlags="33" defaultLabel="Purpose">
          <dataDescriptor expression="RESERVATIONS.PURPOSE"
           descriptiveExpression="PURPOSE" order="4" width="100"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="CLIENT_ID" oracleDatatype="number" columnOrder="15"
         width="22" defaultWidth="120000" defaultHeight="10000"
         columnFlags="33" defaultLabel="Client Id">
          <dataDescriptor expression="RESERVATIONS.CLIENT_ID"
           descriptiveExpression="CLIENT_ID" order="5" width="22"
           precision="10"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="FLIGHT_RETURN_NUMBER" oracleDatatype="number"
         columnOrder="16" width="22" defaultWidth="120000"
         defaultHeight="10000" columnFlags="33"
         defaultLabel="Flight Return Number">
          <dataDescriptor expression="RESERVATIONS.FLIGHT_RETURN_NUMBER"
           descriptiveExpression="FLIGHT_RETURN_NUMBER" order="6" width="22"
           precision="10"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="FLIGHT_NUMBER" oracleDatatype="number"
         columnOrder="17" width="22" defaultWidth="120000"
         defaultHeight="10000" columnFlags="33" defaultLabel="Flight Number">
          <dataDescriptor expression="RESERVATIONS.FLIGHT_NUMBER"
           descriptiveExpression="FLIGHT_NUMBER" order="7" width="22"
           precision="10"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="PASSPORT_NUM" datatype="character"
         oracleDatatype="aFixedChar" columnOrder="18" defaultWidth="100000"
         defaultHeight="10000" columnFlags="33" defaultLabel="Passport Num">
          <dataDescriptor expression="RESERVATIONS.PASSPORT_NUM"
           descriptiveExpression="PASSPORT_NUM" order="8" width="10"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="CLASS_ID" oracleDatatype="number" columnOrder="19"
         width="22" defaultWidth="30000" defaultHeight="10000"
         columnFlags="33" defaultLabel="Class Id">
          <dataDescriptor expression="RESERVATIONS.CLASS_ID"
           descriptiveExpression="CLASS_ID" order="9" width="22" precision="1"
          />
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
      </group>
    </dataSource>
  </data>
  <layout>
  <section name="main">
    <body>
      <frame name="M_G_DESTINATION_GRPFR">
        <geometryInfo x="0.00000" y="0.00000" width="6.75000" height="0.25000"
        />
        <generalLayout verticalElasticity="variable"/>
        <visualSettings fillPattern="transparent"
         fillBackgroundColor="r100g100b100"/>
        <repeatingFrame name="R_G_DESTINATION" source="G_DESTINATION"
         printDirection="down" minWidowRecords="1" columnMode="no">
          <geometryInfo x="0.00000" y="0.12500" width="6.75000"
           height="0.12500"/>
          <generalLayout verticalElasticity="expand"/>
          <visualSettings fillPattern="transparent"
           fillBackgroundColor="TableCell"/>
          <field name="F_DESTINATION" source="DESTINATION" minWidowLines="1"
           spacing="0" alignment="start">
            <font face="helvetica" size="6"/>
            <geometryInfo x="0.00000" y="0.12500" width="0.50000"
             height="0.12500"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <field name="F_FLIGHT_DATE" source="FLIGHT_DATE" minWidowLines="1"
           spacing="0" alignment="start">
            <font face="helvetica" size="6"/>
            <geometryInfo x="0.50000" y="0.12500" width="0.81250"
             height="0.12500"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <field name="F_RETURN_DATE" source="RETURN_DATE" minWidowLines="1"
           spacing="0" alignment="start">
            <font face="helvetica" size="6"/>
            <geometryInfo x="1.31250" y="0.12500" width="0.81250"
             height="0.12500"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <field name="F_PURPOSE" source="PURPOSE" minWidowLines="1"
           spacing="0" alignment="start">
            <font face="helvetica" size="6"/>
            <geometryInfo x="2.12500" y="0.12500" width="0.43750"
             height="0.12500"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <field name="F_CLIENT_ID" source="CLIENT_ID" minWidowLines="1"
           spacing="0" alignment="start">
            <font face="helvetica" size="6"/>
            <geometryInfo x="2.56250" y="0.12500" width="1.06250"
             height="0.12500"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <field name="F_FLIGHT_RETURN_NUMBER" source="FLIGHT_RETURN_NUMBER"
           minWidowLines="1" spacing="0" alignment="start">
            <font face="helvetica" size="6"/>
            <geometryInfo x="3.62500" y="0.12500" width="1.06250"
             height="0.12500"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <field name="F_FLIGHT_NUMBER" source="FLIGHT_NUMBER"
           minWidowLines="1" spacing="0" alignment="start">
            <font face="helvetica" size="6"/>
            <geometryInfo x="4.68750" y="0.12500" width="1.06250"
             height="0.12500"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <field name="F_PASSPORT_NUM" source="PASSPORT_NUM" minWidowLines="1"
           spacing="0" alignment="start">
            <font face="helvetica" size="6"/>
            <geometryInfo x="5.75000" y="0.12500" width="0.62500"
             height="0.12500"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <field name="F_CLASS_ID" source="CLASS_ID" minWidowLines="1"
           spacing="0" alignment="start">
            <font face="helvetica" size="6"/>
            <geometryInfo x="6.37500" y="0.12500" width="0.37500"
             height="0.12500"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
        </repeatingFrame>
        <frame name="M_G_DESTINATION_HDR">
          <geometryInfo x="0.00000" y="0.00000" width="6.75000"
           height="0.12500"/>
          <advancedLayout printObjectOnPage="allPage"
           basePrintingOn="anchoringObject"/>
          <visualSettings fillPattern="transparent"
           fillBackgroundColor="TableHeading"/>
          <text name="B_DESTINATION" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="0.00000" y="0.00000" width="0.50000"
             height="0.12500"/>
            <visualSettings fillBackgroundColor="r25g50b75"/>
            <textSegment>
              <font face="helvetica" size="6" bold="yes"
               textColor="r100g100b100"/>
              <string>
              <![CDATA[Destination]]>
              </string>
            </textSegment>
          </text>
          <text name="B_FLIGHT_DATE" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="0.50000" y="0.00000" width="0.81250"
             height="0.12500"/>
            <visualSettings fillBackgroundColor="TableHeading"/>
            <textSegment>
              <font face="helvetica" size="6" bold="yes"
               textColor="r100g100b100"/>
              <string>
              <![CDATA[Flight Date]]>
              </string>
            </textSegment>
          </text>
          <text name="B_RETURN_DATE" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="1.31250" y="0.00000" width="0.81250"
             height="0.12500"/>
            <visualSettings fillBackgroundColor="TableHeading"/>
            <textSegment>
              <font face="helvetica" size="6" bold="yes"
               textColor="r100g100b100"/>
              <string>
              <![CDATA[Return Date]]>
              </string>
            </textSegment>
          </text>
          <text name="B_PURPOSE" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="2.12500" y="0.00000" width="0.43750"
             height="0.12500"/>
            <visualSettings fillBackgroundColor="r25g50b75"/>
            <textSegment>
              <font face="helvetica" size="6" bold="yes"
               textColor="r100g100b100"/>
              <string>
              <![CDATA[Purpose]]>
              </string>
            </textSegment>
          </text>
          <text name="B_CLIENT_ID" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="2.56250" y="0.00000" width="1.06250"
             height="0.12500"/>
            <visualSettings fillBackgroundColor="TableHeading"/>
            <textSegment>
              <font face="helvetica" size="6" bold="yes"
               textColor="r100g100b100"/>
              <string>
              <![CDATA[Client Id]]>
              </string>
            </textSegment>
          </text>
          <text name="B_FLIGHT_RETURN_NUMBER" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="3.62500" y="0.00000" width="1.06250"
             height="0.12500"/>
            <visualSettings fillBackgroundColor="TableHeading"/>
            <textSegment>
              <font face="helvetica" size="6" bold="yes"
               textColor="r100g100b100"/>
              <string>
              <![CDATA[Flight Return Number]]>
              </string>
            </textSegment>
          </text>
          <text name="B_FLIGHT_NUMBER" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="4.68750" y="0.00000" width="1.06250"
             height="0.12500"/>
            <visualSettings fillBackgroundColor="TableHeading"/>
            <textSegment>
              <font face="helvetica" size="6" bold="yes"
               textColor="r100g100b100"/>
              <string>
              <![CDATA[Flight Number]]>
              </string>
            </textSegment>
          </text>
          <text name="B_PASSPORT_NUM" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="5.75000" y="0.00000" width="0.62500"
             height="0.12500"/>
            <visualSettings fillBackgroundColor="r25g50b75"/>
            <textSegment>
              <font face="helvetica" size="6" bold="yes"
               textColor="r100g100b100"/>
              <string>
              <![CDATA[Passport Num]]>
              </string>
            </textSegment>
          </text>
          <text name="B_CLASS_ID" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="6.37500" y="0.00000" width="0.37500"
             height="0.12500"/>
            <visualSettings fillBackgroundColor="TableHeading"/>
            <textSegment>
              <font face="helvetica" size="6" bold="yes"
               textColor="r100g100b100"/>
              <string>
              <![CDATA[Class Id]]>
              </string>
            </textSegment>
          </text>
        </frame>
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
          
74946483 93167800 42007F00 00FFFFFF 5689BC23 56899D5E 2F2BCC5E C82B8DF6
E9EC5F9F CFCE2F9F 598BBDF9 FBFDCB2D 8E875A2D FCFDFE28 BA5D2ECE 5F8A5C2E
5C8DCEF3 F6E9CC9D 5E2F5F9F 2B5C8D27 598BF7F9 FB5ECE2F C88A5C85 28BA992B
CCFBFCFD 9D2ECE56 C82BC487 5A5ACB2D 26598C85 B8EB2C2D 2EC4F72B 26292C53
86B9F327 5A25588B 84B7EACC CDCE0000 00000000 00000000 00000000 00000000
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
FF003080 C1840B0A 1C388031 A2C58C01 16802172 40844106 2250A868 8133E043
07000874 0030A061 8F830A0C 143040A3 E7400408 0E8C5912 90E7C69B 05102859
83172589 820624EC F90438A0 51801A0A 2859C080 A18B9C27 123870B2 96A0C794
2B0ECC68 C158E74C 0315386D FA0617A0 C1090A0E 00F82550 E20F8B00 BAAC6A30
9AA7C893 0FA63C3A F514C4CC 016BFE7D 1B70C001 47000018 0E8BE111 81C40400
24252887 1EE45C94 750AD518 E06086E8 0F850A10 0B6162AF 4FB4AF7E 8500D0A0
21039B19 9A205A05 F3EB628C 43DAC509 651DABC5 99A56E75 90215240 D9041E32
17DA3164 B6D3D00A CE6C28B6 D3E16184 00760628 1DD635EC D29308CD 80A4FBE4
FF898616 5258C0E1 E3808F0E 1B200FF0 5C37E40B 0E183070 90516970 83B00E04
7E2890C7 48040040 2181BDA4 90418100 E5408287 BD00A060 0F153850 A3030C58
40810A06 46145602 0C789FDA 441C70F1 E5000878 F1A00ACD 74E1A980 0C602080
724118CF 10001648 10810F6D D850EF44 1218F2DF 810C3811 E4883E19 60035249
60922609 3940F127 05185002 4A8D10E4 71800E18 74D1C78C EDC8104D 80004083
630B21F8 40AF8E0A 7424219A 0A1974A3 87060581 4A8E51E4 D5E78318 9851C782
3E7403AA 8E1150C4 688141D8 B2D10C08 2810E995 46E4D62B 9B6A3AF6 A4A176E8
1DD75D7E 78C71E41 8A507141 761498B2 5D920CD9 E712AB25 10A06579 864826A7
FF4CA618 0185A042 E486A486 BE0900C2 0116DAF5 D8AA76E4 C46C8752 0092A1A0
046920C6 05A9AAF1 DCA40ABA B2D2A502 7800C08A 0640E153 0A0E76B2 9FA50230
07EDA366 4866A650 56C89399 ADCA74C1 4A81F974 BE270FC6 898394B1 005B5E21
899220E0 448A296B 7DE74F08 6850FEAF 2D108031 8C0CB5F3 D4092697 83D6A214
C7822AA0 04E92860 531CCBF1 14B2B6BA 9313C11A 105040C1 12FBAF6E 8923E853
64AE1540 B2B0582A 00024E42 C67A0009 8FEA3900 84C152E4 1F11A6C2 E422300A
F2FBF15E A17A3001 F3079E68 B29CCE19 AC406291 451B2000 DB25A86F 200EEE40
B100D414 A8B520A1 2659F125 C123EBBA 29CF3530 D0F19900 4C337DD8 361001B5
FFD63648 8DE7424F 78023001 F2BBE1D0 E7182BE1 0ADB1460 2181AC6B 00E6B749
4F2D14D1 04085BC8 6CAB2120 A08ED108 30CD2E4E 730090A2 81B65009 7A8A5E60
3F23BE63 600564E4 433B52A7 D0081D21 C1BF6718 9082983D 202AFEBD 1D5830C1
83006D3D 2EA46618 9969BF59 8BA06ABB 2D3FF8E7 4D048022 480DCF48 1249032C
7ED0B80A 20E49A31 8183E425 F7BE97E4 A08CDB25 BF6024AD 3E4FFDEF 44F75A80
ACF00058 0CAF8010 20040CBD 43080850 40BC0011 85ABFA83 0018C43F 88108080
E2C9C205 75F51600 20308831 D0220908 93930C40 908CFAB0 6CAC382C 311E7058
70085041 02101BA1 1ED60100 1871630D 3230080E F421040C 64950118 83920010
FF938000 500207E4 B2950C70 14893930 29075271 46004C27 8C43E122 0903B213
2E11F328 00B2A5F0 0080811E 01172F0C 0005BE04 1102066A E0471C02 E6150840
427D74A1 0F6140C2 1138831B 2690F384 446A9315 78F1970C 21B00B00 50870998
F11D2EA0 1A8F44C1 2F7CE810 06AC00A6 4D6C5980 19082CB5 02FB020F 5C23201F
72A2CD3E 70FD7E11 51E70FB8 A4CB3E21 1B8F1934 230752E4 4A6D008A 5C009320
080049CF 4E74A689 08F2200E 292C3600 782D8F1C 0AC10549 804300ED E3279C15
232559F1 CBD8A29F 593433E7 46004515 0446A009 B444A050 29CA4036 00C69008
30C21172 26A40023 118E3C42 AA25C471 4866004A 9774A663 210093CF 8440A181
FF08E62E 11827082 364F2593 72B2A731 0025CF8C 102A71F4 40AF23C8 FEC76E70
D593F4C9 8811181D BA6AC2BF 9E114084 293AE19A 4A13D392 CBB42FB8 8970D004
B3F7877C A0A74C0A B44B7E70 903F0071 AE2F5A77 C93962FA 96DCF1AF 317253C2
0410C39D 3447E421 98264C90 10D79074 55AB1559 B2575ED0 98937AA6 220F63A7
4E9ED6E7 902DB5ED 49BA0DCB 1A05419A 4D00823F 72D0DFA6 33FE82CB 70801D00
5542026B A10F0430 8200266E CB765337 240CF9A5 25E9BC40 ACF1BCAA 254B243F
9A0550B0 4290884C 0A82273A D55C76F5 B9AFFC5B E707D714 1F021630 0C4D4BE1
4D2BB441 B68098A9 05DA0A4B 7A2954DA 75BBA225 F808679A B2114E70 D5A00080
074A4399 873FC656 5E9A6C0A 404FE8C0 025693D6 BF148CAC 5E29E756 6AA296B4
CD356C6F 6BCE469E D111B2F4 60C20A64 70810040 E2A38C80 0675BBCD D0082062
9308456F 39CB8152 FA229CB3 942AE559 DB3007FA 871EB314 8FED1FAB AE5862C7
5EBCBDEF AF7FFB00 E00B0870 C406ED60 4000B3DC DCDCDCDC DCDCDCDC DCDCDCDC
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
    <color index="190" displayName="TextColor" value="#336699"/>
    <color index="191" displayName="TableHeading" value="#336699"/>
    <color index="192" displayName="TableCell" value="#e0f0ff"/>
    <color index="193" displayName="Totals" value="#c5e3ff"/>
  </colorPalette>
  <reportPrivate defaultReportType="tabular" versionFlags2="0"
   templateName="rwblue"/>
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
  <rw:style id="rwblue135">
<link rel="StyleSheet" type="text/css" href="css/rwblue.css">
</rw:style>

  <META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</HEAD>

<BODY bgColor="#ffffff" link="#000000" vLink="#000000">

<TABLE border=0 cellPadding=0 cellSpacing=0 width="100%">
  <TBODY>
  <TR>
    <TD bgColor="#ffffff" rowSpan=2 vAlign=middle width=188><IMG alt="" src="images/rwblue_logo.gif" width="135" height="36"></TD>
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
          <TD width="10%" class="OraCellText"><IMG alt="" src="images/blue_d_arrow.gif" width="10" height="10"></TD>
          <TD width="90%" class="OraCellText">Navigation goes here </TD>
        </TR>
        <TR>
          <TD width="10%" class="OraCellText"><IMG alt="" src="images/blue_r_arrow.gif" width="10" height="10"></TD>
          <TD width="90%" class="OraCellText">Navigation Item</TD>
        </TR>
      </TABLE>
    </TD>
    <TD width="71%">
      <DIV align="center">
      <!-- Data Area Generated by Reports Developer -->
<rw:dataArea id="MGDESTINATIONGRPFR189">
<table class="OraTable">
<caption>  </caption>
 <!-- Header -->
 <thead>
  <tr>
   <th <rw:id id="HBDESTINATION189" asArray="no"/> class="OraColumnHeader"> Destination </th>
   <th <rw:id id="HBFLIGHTDATE189" asArray="no"/> class="OraColumnHeader"> Flight Date </th>
   <th <rw:id id="HBRETURNDATE189" asArray="no"/> class="OraColumnHeader"> Return Date </th>
   <th <rw:id id="HBPURPOSE189" asArray="no"/> class="OraColumnHeader"> Purpose </th>
   <th <rw:id id="HBCLIENTID189" asArray="no"/> class="OraColumnHeader"> Client Id </th>
   <th <rw:id id="HBFLIGHTRETURNNUMBER189" asArray="no"/> class="OraColumnHeader"> Flight Return Number </th>
   <th <rw:id id="HBFLIGHTNUMBER189" asArray="no"/> class="OraColumnHeader"> Flight Number </th>
   <th <rw:id id="HBPASSPORTNUM189" asArray="no"/> class="OraColumnHeader"> Passport Num </th>
   <th <rw:id id="HBCLASSID189" asArray="no"/> class="OraColumnHeader"> Class Id </th>
  </tr>
 </thead>
 <!-- Body -->
 <tbody>
  <rw:foreach id="RGDESTINATION1891" src="G_DESTINATION">
   <tr>
    <td <rw:headers id="HFDESTINATION189" src="HBDESTINATION189"/> class="OraCellText"><rw:field id="FDESTINATION189" src="DESTINATION" nullValue="&nbsp;"> F_DESTINATION </rw:field></td>
    <td <rw:headers id="HFFLIGHTDATE189" src="HBFLIGHTDATE189"/> class="OraCellText"><rw:field id="FFLIGHTDATE189" src="FLIGHT_DATE" nullValue="&nbsp;"> F_FLIGHT_DATE </rw:field></td>
    <td <rw:headers id="HFRETURNDATE189" src="HBRETURNDATE189"/> class="OraCellText"><rw:field id="FRETURNDATE189" src="RETURN_DATE" nullValue="&nbsp;"> F_RETURN_DATE </rw:field></td>
    <td <rw:headers id="HFPURPOSE189" src="HBPURPOSE189"/> class="OraCellText"><rw:field id="FPURPOSE189" src="PURPOSE" nullValue="&nbsp;"> F_PURPOSE </rw:field></td>
    <td <rw:headers id="HFCLIENTID189" src="HBCLIENTID189"/> class="OraCellNumber"><rw:field id="FCLIENTID189" src="CLIENT_ID" nullValue="&nbsp;"> F_CLIENT_ID </rw:field></td>
    <td <rw:headers id="HFFLIGHTRETURNNUMBER189" src="HBFLIGHTRETURNNUMBER189"/> class="OraCellNumber"><rw:field id="FFLIGHTRETURNNUMBER189" src="FLIGHT_RETURN_NUMBER" nullValue="&nbsp;"> F_FLIGHT_RETURN_NUMBER </rw:field></td>
    <td <rw:headers id="HFFLIGHTNUMBER189" src="HBFLIGHTNUMBER189"/> class="OraCellNumber"><rw:field id="FFLIGHTNUMBER189" src="FLIGHT_NUMBER" nullValue="&nbsp;"> F_FLIGHT_NUMBER </rw:field></td>
    <td <rw:headers id="HFPASSPORTNUM189" src="HBPASSPORTNUM189"/> class="OraCellText"><rw:field id="FPASSPORTNUM189" src="PASSPORT_NUM" nullValue="&nbsp;"> F_PASSPORT_NUM </rw:field></td>
    <td <rw:headers id="HFCLASSID189" src="HBCLASSID189"/> class="OraCellNumber"><rw:field id="FCLASSID189" src="CLASS_ID" nullValue="&nbsp;"> F_CLASS_ID </rw:field></td>
   </tr>
  </rw:foreach>
 </tbody>
</table>
</rw:dataArea> <!-- id="MGDESTINATIONGRPFR189" -->
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
