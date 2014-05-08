﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="donate.aspx.cs" Inherits="donate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
	<link href="css/stylesheet.css" rel="stylesheet" type="text/css" />
	<script>
	function isNumberKey(evt){
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode != 46 &&(charCode < 48 || charCode > 57)))
        return false;
    return true;
	
}

           

 function myFunction() {
	 var li_0_price_my	= '';
     var Text1_my 		= '';
	 var Text2_my		= '';
	 var emailnmatch_my	= '';
	 var emailnvalid_my	= '';
	 var Text5_my  		= '';
	 var Text6_my		= '';
	 var Text7_my		= '';
	 var Text7_my2		= '';
	 var Text8_my		= '';
	 var Text9_my		= '';
 

        if (li_0_price.value.length == 0) {
        	var li_0_price_my = "Amount Field Required";
			//alert("Amount Field Required");
			//return false;
		}
 
		if (Text1.value.length == 0) {
			var Text1_my = "Name Field Required";
			//alert("Name Field Required");
			//return false;
		}

		if (Text2.value.length == 0) {
			var Text2_my = "Address 1 Field Required";
			//alert("Address 1 Field Required");
			//return false;
		}
		
	

		var x=Text3.value;
		var atpos=x.indexOf("@");
		var dotpos=x.lastIndexOf(".");
		if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
		  {
			  var emailnvalid_my = "Not a valid e-mail address";
			  //alert("Not a valid e-mail address");
			  //return false;
		  }
		
        <!--Here validation email matching removed since not req but available backup-->
		
		if (Text5.value.length == 0) {
			var Text5_my = "City Field Required";
			//alert("City Field Required");
			//return false;
		}
		

		if (Text6.value.length == 0) {
			var Text6_my = "State Field Required";
			//alert("State Field Required");
			//return false;
		}


		if (Text7.value.length == 0) {
			var Text7_my = "Zipcode Field Required";
			//alert("Zipcode Field Required");
			//return false;
		}


		if (Text7.value.length > 5) {
			var Text7_my2 = "Zipcode should be 5 digits limit";
			//alert("Zipcode should be 5 digits limit");
			//return false;
		}


		if (Text8.value.length != 10) {
			var Text8_my = "Primary Number Field Required/10 Digits Number";
			//alert("Primary Number Field Required/10 Digits Number");
			//return false;
		}
		

		
		
        <!--Here validation email comparison group traces removed since not req but available backup-->
		
		
		if(li_0_price_my || Text1_my || Text2_my || emailnvalid_my || Text5_my || Text6_my || Text7_my || Text7_my2 || Text8_my || Text9_my){
			alert(li_0_price_my+'\n'+Text1_my+'\n'+Text2_my+'\n'+emailnvalid_my	+'\n'+Text5_my+'\n'+Text6_my+'\n'+Text7_my+'\n'+
			Text7_my2+'\n'+Text8_my);
			return false;	
		}
		if (li_0_price.value.length == 0 || Text1.value.length == 0 || Text2.value.length == 0 ||
			atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length || Text5.value.length == 0 || Text6.value.length == 0 || Text7.value.length == 0
			|| Text7.value.length > 5 || Text8.value.length != 10) {
		 	return false;
		}
		
		


		else
		{
		return true;
		}

		
    }
	

</script>
</head>

<body>
    <form id="form1" runat="server">
<asp:hiddenfield id="siid" runat="server"></asp:hiddenfield>
<asp:hiddenfield id="issdemo" runat="server"></asp:hiddenfield>
    <div>
    
    </div>
    </form>

    <form action='https://www.2checkout.com/checkout/purchase' method='post'>
    <input type='hidden' name='sid' value='<% Response.Write(siid.Value); %>' />
    <input type='hidden' name='li_0_name' value='Donation' />
    <input type='hidden' name='mode' value='2CO' />
        <% if(issdemo.Value == "Y")
           { %>
    <input type="hidden" name="demo"value="Y">
        <% }
           else if (issdemo.Value == "N")
           {
           }
           %>
    <fieldset>
        <legend><% Response.Write(Session["Category"]); %></legend>
		
		<span>* Fields are mandartory</span><br><br>
			<span>* </span><label>Amount :</label>
				<div>
				<!--Response.Write("Hello " + Session["Amount"] + "<br>");-->
				 <% 
				 
				 if(Convert.ToInt32(Session["Amount"]) > 0)
                   { %>
                   <input id="li_0_price" readonly name="li_0_price" type="text" value='<% Response.Write(Session["Amount"]); %>' />
				   <% }
				 else 
				   {%>
				   <input id="li_0_price" name="li_0_price" type="text" value='' onkeypress="return isNumberKey(event)" />				   
				  <% }
				   %>
				
				</div>
			<span>* </span><label>Full Name :</label>
				<div>
				<input id="Text1" name="card_holder_name" type="text" value='<% Response.Write(Session["FullName"]); %>' />&nbsp; 
				<span style="font-size:11px; color:#666666; font-style:italic;">Firstname Lastname</span>
				</div>
			<span>* </span><label>Billing Address 1 :</label>
				<div> 
				<input id="Text2" name="street_address" type="text" value='<% Response.Write(Session["Address"]); %>' />
				</div>
			<label>Billing Address 2 (Optimal) :</label>
				<div> 
				<input id="Text10" name="street_address2" type="text" value="address2 123 Test Address" />
				</div>
            <span>* </span><label>Email Address :</label>
				<div>
                <input id="Text3" name="email" type="text" value='<% Response.Write(Session["Email"]); %>' />
				<span style="font-size:11px; color:#666666; font-style:italic;">example@domain.org</span>
				</div>
			<!--<span>* </span><label>Confirm Email Address :</label>
				<div>
                <input id="confemail" name="confemail" type="text" />
				<span style="font-size:11px; color:#666666; font-style:italic;">example@domain.org</span>
				</div>

                -->
           
			<span>* </span><label>Country :</label>
				<div>
				<select id="billing-country" name="country" class="valid">
				
				<option selected value="USA">United States</option>
				<option value="GBR">United Kingdom</option>
				<option value="CAN">Canada</option>
				<option value="AUS">Australia</option>
				<option disabled="">—</option>
				<option value="ALA">Åland Islands</option>
				<option value="AFG">Afghanistan</option>
				<option value="ALB">Albania</option>
				<option value="DZA">Algeria</option>
				<option value="ASM">American Samoa</option>
				<option value="AND">Andorra</option>
				<option value="AGO">Angola</option>
				<option value="AIA">Anguilla</option>
				<option value="ATA">Antarctica</option>
				<option value="ATG">Antigua and Barbuda</option>
				<option value="ARG">Argentina</option>
				<option value="ARM">Armenia</option>
				<option value="ABW">Aruba</option>
				<option value="AUS">Australia</option>
				<option value="AUT">Austria</option>
				<option value="AZE">Azerbaijan</option>
				<option value="BHS">Bahamas</option>
				<option value="BHR">Bahrain</option>
				<option value="BGD">Bangladesh</option>
				<option value="BRB">Barbados</option>
				<option value="BLR">Belarus</option>
				<option value="BEL">Belgium</option>
				<option value="BLZ">Belize</option>
				<option value="BEN">Benin</option>
				<option value="BMU">Bermuda</option>
				<option value="BTN">Bhutan</option>
				<option value="BOL">Bolivia</option>
				<option value="BES">Bonaire, Sint Eustatius and Saba</option>
				<option value="BIH">Bosnia and Herzegovina</option>
				<option value="BWA">Botswana</option>
				<option value="BVT">Bouvet Island</option>
				<option value="BRA">Brazil</option>
				<option value="IOT">British Indian Ocean Territory</option>
				<option value="BRN">Brunei Darussalam</option>
				<option value="BGR">Bulgaria</option>
				<option value="BFA">Burkina Faso</option>
				<option value="BDI">Burundi</option>
				<option value="KHM">Cambodia</option>
				<option value="CMR">Cameroon</option>
				<option value="CAN">Canada</option>
				<option value="CPV">Cape Verde</option>
				<option value="CYM">Cayman Islands</option>
				<option value="CAF">Central African Republic</option>
				<option value="TCD">Chad</option>
				<option value="CHL">Chile</option>
				<option value="CHN">China</option>
				<option value="CXR">Christmas Island</option>
				<option value="CCK">Cocos (Keeling) Islands</option>
				<option value="COL">Colombia</option>
				<option value="COM">Comoros</option>
				<option value="COG">Congo</option>
				<option value="COD">Congo, the Democratic Republic of the</option>
				<option value="COK">Cook Islands</option>
				<option value="CRI">Costa Rica</option>
				<option value="CIV">Cote D'ivoire</option>
				<option value="HRV">Croatia (Hrvatska)</option>
				<option value="CUB">Cuba</option>
				<option value="CYP">Cyprus</option>
				<option value="CZE">Czech Republic</option>
				<option value="DNK">Denmark</option>
				<option value="DJI">Djibouti</option>
				<option value="DMA">Dominica</option>
				<option value="DOM">Dominican Republic</option>
				<option value="ECU">Ecuador</option>
				<option value="EGY">Egypt</option>
				<option value="SLV">El Salvador</option>
				<option value="GNQ">Equatorial Guinea</option>
				<option value="ERI">Eritrea</option>
				<option value="EST">Estonia</option>
				<option value="ETH">Ethiopia</option>
				<option value="FLK">Falkland Islands (Malvinas)</option>
				<option value="FRO">Faroe Islands</option>
				<option value="FJI">Fiji</option>
				<option value="FIN">Finland</option>
				<option value="FRA">France</option>
				<option value="FXX">France, Metropolitan</option>
				<option value="GUF">French Guiana</option>
				<option value="PYF">French Polynesia</option>
				<option value="ATF">French Southern Territories</option>
				<option value="GAB">Gabon</option>
				<option value="GMB">Gambia</option>
				<option value="GEO">Georgia</option>
				<option value="DEU">Germany</option>
				<option value="GHA">Ghana</option>
				<option value="GIB">Gibraltar</option>
				<option value="GRC">Greece</option>
				<option value="GRL">Greenland</option>
				<option value="GRD">Grenada</option>
				<option value="GLP">Guadeloupe</option>
				<option value="GUM">Guam</option>
				<option value="GTM">Guatemala</option>
				<option value="GGY">Guernsey</option>
				<option value="GIN">Guinea</option>
				<option value="GNB">Guinea-Bissau</option>
				<option value="GUY">Guyana</option>
				<option value="HTI">Haiti</option>
				<option value="HMD">Heard Island and Mcdonald Islands</option>
				<option value="HND">Honduras</option>
				<option value="HKG">Hong Kong</option>
				<option value="HUN">Hungary</option>
				<option value="ISL">Iceland</option>
				<option value="IND">India</option>
				<option value="IDN">Indonesia</option>
				<option value="IRN">Iran, Islamic Republic of</option>
				<option value="IRQ">Iraq</option>
				<option value="IRL">Ireland</option>
				<option value="IMN">Isle of Man</option>
				<option value="ISR">Israel</option>
				<option value="ITA">Italy</option>
				<option value="JAM">Jamaica</option>
				<option value="JPN">Japan</option>
				<option value="JEY">Jersey</option>
				<option value="JOR">Jordan</option>
				<option value="KAZ">Kazakhstan</option>
				<option value="KEN">Kenya</option>
				<option value="KIR">Kiribati</option>
				<option value="PRK">Korea, Democratic People's Republic of</option>
				<option value="KOR">Korea, Republic of</option>
				<option value="UNK">UNK</option>
				<option value="KWT">Kuwait</option>
				<option value="KGZ">Kyrgyzstan</option>
				<option value="LAO">Lao People's Democratic Republic</option>
				<option value="LVA">Latvia</option>
				<option value="LBN">Lebanon</option>
				<option value="LSO">Lesotho</option>
				<option value="LBR">Liberia</option>
				<option value="LBY">Libyan Arab Jamahiriya</option>
				<option value="LIE">Liechtenstein</option>
				<option value="LTU">Lithuania</option>
				<option value="LUX">Luxembourg</option>
				<option value="MAC">Macao</option>
				<option value="MKD">Macedonia</option>
				<option value="MDG">Madagascar</option>
				<option value="MWI">Malawi</option>
				<option value="MYS">Malaysia</option>
				<option value="MDV">Maldives</option>
				<option value="MLI">Mali</option>
				<option value="MLT">Malta</option>
				<option value="MHL">Marshall Islands</option>
				<option value="MTQ">Martinique</option>
				<option value="MRT">Mauritania</option>
				<option value="MUS">Mauritius</option>
				<option value="MYT">Mayotte</option>
				<option value="MEX">Mexico</option>
				<option value="FSM">Micronesia, Federated States of</option>
				<option value="MDA">Moldova, Republic of</option>
				<option value="MCO">Monaco</option>
				<option value="MNG">Mongolia</option>
				<option value="MNE">Montenegro</option>
				<option value="MSR">Montserrat</option>
				<option value="MAR">Morocco</option>
				<option value="MOZ">Mozambique</option>
				<option value="MMR">Myanmar</option>
				<option value="NAM">Namibia</option>
				<option value="NRU">Nauru</option>
				<option value="NPL">Nepal</option>
				<option value="NLD">Netherlands</option>
				<option value="ANT">Netherlands Antilles</option>
				<option value="NCL">New Caledonia</option>
				<option value="NZL">New Zealand</option>
				<option value="NIC">Nicaragua</option>
				<option value="NER">Niger</option>
				<option value="NGA">Nigeria</option>
				<option value="NIU">Niue</option>
				<option value="NFK">Norfolk Island</option>
				<option value="MNP">Northern Mariana Islands</option>
				<option value="NOR">Norway</option>
				<option value="OMN">Oman</option>
				<option value="PAK">Pakistan</option>
				<option value="PLW">Palau</option>
				<option value="PSE">Palestinian Territory, Occupied</option>
				<option value="PAN">Panama</option>
				<option value="PNG">Papua New Guinea</option>
				<option value="PRY">Paraguay</option>
				<option value="PER">Peru</option>
				<option value="PHL">Philippines</option>
				<option value="PCN">Pitcairn</option>
				<option value="POL">Poland</option>
				<option value="PRT">Portugal</option>
				<option value="PRI">Puerto Rico</option>
				<option value="QAT">Qatar</option>
				<option value="REU">Reunion</option>
				<option value="ROU">Romania</option>
				<option value="RUS">Russian Federation</option>
				<option value="RWA">Rwanda</option>
				<option value="SHN">Saint Helena</option>
				<option value="KNA">Saint Kitts and Nevis</option>
				<option value="LCA">Saint Lucia</option>
				<option value="SPM">Saint Pierre and Miquelon</option>
				<option value="VCT">Saint Vincent and the Grenadines</option>
				<option value="WSM">Samoa</option>
				<option value="SMR">San Marino</option>
				<option value="STP">Sao Tome and Principe</option>
				<option value="SAU">Saudi Arabia</option>
				<option value="SEN">Senegal</option>
				<option value="SRB">Serbia</option>
				<option value="SCG">Serbia and Montenegro</option>
				<option value="SYC">Seychelles</option>
				<option value="SLE">Sierra Leone</option>
				<option value="SGP">Singapore</option>
				<option value="SVK">Slovakia</option>
				<option value="SVN">Slovenia</option>
				<option value="SLB">Solomon Islands</option>
				<option value="SOM">Somalia</option>
				<option value="ZAF">South Africa</option>
				<option value="SGS">South Georgia and the South Sandwich Islands</option>
				<option value="ESP">Spain</option>
				<option value="LKA">Sri Lanka</option>
				<option value="SDN">Sudan</option>
				<option value="SUR">Suriname</option>
				<option value="SJM">Svalbard and Jan Mayen Islands</option>
				<option value="SWZ">Swaziland</option>
				<option value="SWE">Sweden</option>
				<option value="CHE">Switzerland</option>
				<option value="SYR">Syrian Arab Republic</option>
				<option value="TWN">Taiwan</option>
				<option value="TJK">Tajikistan</option>
				<option value="TZA">Tanzania, United Republic of</option>
				<option value="THA">Thailand</option>
				<option value="TLS">Timor-Leste</option>
				<option value="TGO">Togo</option>
				<option value="TKL">Tokelau</option>
				<option value="TON">Tonga</option>
				<option value="TTO">Trinidad and Tobago</option>
				<option value="TUN">Tunisia</option>
				<option value="TUR">Turkey</option>
				<option value="TKM">Turkmenistan</option>
				<option value="TCA">Turks and Caicos Islands</option>
				<option value="TUV">Tuvalu</option>
				<option value="UGA">Uganda</option>
				<option value="UKR">Ukraine</option>
				<option value="ARE">United Arab Emirates</option>
				<option value="GBR">United Kingdom</option>
				<option value="USA">United States</option>
				<option value="UMI">United States Minor Outlying Islands</option>
				<option value="URY">Uruguay</option>
				<option value="UZB">Uzbekistan</option>
				<option value="VUT">Vanuatu</option>
				<option value="VAT">Vatican City State (Holy See)</option>
				<option value="VEN">Venezuela</option>
				<option value="VNM">Viet Nam</option>
				<option value="VGB">Virgin Islands, British</option>
				<option value="VIR">Virgin Islands, U.S.</option>
				<option value="WLF">Wallis and Futuna Islands</option>
				<option value="ESH">Western Sahara</option>
				<option value="YEM">Yemen</option>
				<option value="YUG">Yugoslavia</option>
				<option value="ZAR">Zaire</option>
				<option value="ZMB">Zambia</option>
				<option value="ZWE">Zimbabwe</option>
				</select>
				
				 </div>
				<p></p>
		<span>* </span><label>City :</label>
			<div> 
			<input id="Text5" name="city" type="text" value='<% Response.Write(Session["City"]); %>' />
			</div>
		<span>* </span><label>State :</label>
			<div>
			<input id="Text6" name="state" type="text" value='<% Response.Write(Session["State"]); %>' />
			</div>
		<span>* </span><label>Zip Code :</label>
			<div>
			<input id="Text7" name="zip" type="text" value='<% Response.Write(Session["Zip"]); %>' onkeypress="return isNumberKey(event)" />
			</div>
		<span>* </span><label>Primary Number :</label>
			<div>
			<input id="Text8" name="phone" type="text" value='<% Response.Write(Session["Phone"]); %>' onkeypress="return isNumberKey(event)"  />
			<span style="font-size:11px; color:#666666; font-style:italic;">XXXXXXXXXX</span>
			</div>
		<label>Secondary Number (Optional) :</label>
			<div>
			<input id="Text9" name="phone2" type="text" value="6149212450" onkeypress="return isNumberKey(event)" />
			<span style="font-size:11px; color:#666666; font-style:italic;">XXXXXXXXXX</span>
			</div>
        <label>Your Category & Account Number :</label>
			<div>
				
            <input id="category" readonly name="category" type="text" value='<% Response.Write(Session["Category"]); %>' />
			<input id="AccountNumber" readonly name="AccountNumber" type="text" value='<% Response.Write(Session["AccountNumber"]); %>' />
				
			</div>
			<br/><br/>
			<div>        
    <input name='submit' type='submit' value='Checkout' onclick="return myFunction();" />
			</div>
                   
    </form>
    
    


<script src="https://www.2checkout.com/static/checkout/javascript/direct.min.js"></script>
    </form>
    
</body>
</html>
