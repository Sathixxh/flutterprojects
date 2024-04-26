// import 'package:pincodefind/main.dart';

// List<Country> countries = [
//   Country("+7 840", "Abkhazia"),
//   Country("+93", "Afghanistan"),
//   Country("+355", "Albania"),
//   Country("+213", "Algeria"),
//   Country("+1 684", "American Samoa"),
//   Country("+376", "Andorra"),
//   Country("+244", "Angola"),
//   Country("+1 264", "Anguilla"),
//   Country("+1 268", "Antigua and Barbuda"),
//   Country("+54", "Argentina"),
//   Country("+374", "Armenia"),
//   Country("+297", "Aruba"),
//   Country("+247", "Ascension"),
//   Country("+61", "Australia"),
//   Country("+672", "Australian External Territories"),
//   Country("+43", "Austria"),
//   Country("+994", "Azerbaijan"),
//   Country("+1 242", "Bahamas"),
//   Country("+973", "Bahrain"),
//   Country("+880", "Bangladesh"),
//   Country("+1 246", "Barbados"),
//   Country("+1 268", "Barbuda"),
//   Country("+375", "Belarus"),
//   Country("+32", "Belgium"),
//   Country("+501", "Belize"),
//   Country("+229", "Benin"),
//   Country("+1 441", "Bermuda"),
//   Country("+975", "Bhutan"),
//   Country("+591", "Bolivia"),
//   Country("+387", "Bosnia and Herzegovina"),
//   Country("+267", "Botswana"),
//   Country("+55", "Brazil"),
//   Country("+246", "British Indian Ocean Territory"),
//   Country("+1 284", "British Virgin Islands"),
//   Country("+673", "Brunei"),
//   Country("+359", "Bulgaria"),
//   Country("+226", "Burkina Faso"),
//   Country("+257", "Burundi"),
//   Country("+855", "Cambodia"),
//   Country("+237", "Cameroon"),
//   Country("+1", "Canada"),
//   Country("+238", "Cape Verde"),
//   Country("+ 345", "Cayman Islands"),
//   Country("+236", "Central African Republic"),
//   Country("+235", "Chad"),
//   Country("+56", "Chile"),
//   Country("+86", "China"),
//   Country("+61", "Christmas Island"),
//   Country("+61", "Cocos-Keeling Islands"),
//   Country("+57", "Colombia"),
//   Country("+269", "Comoros"),
//   Country("+242", "Congo"),
//   Country("+243", "Congo, Dem. Rep. of (Zaire)"),
//   Country("+682", "Cook Islands"),
//   Country("+506", "Costa Rica"),
//   Country("+385", "Croatia"),
//   Country("+53", "Cuba"),
//   Country("+599", "Curacao"),
//   Country("+537", "Cyprus"),
//   Country("+420", "Czech Republic"),
//   Country("+45", "Denmark"),
//   Country("+246", "Diego Garcia"),
//   Country("+253", "Djibouti"),
//   Country("+1 767", "Dominica"),
//   Country("+1 809", "Dominican Republic"),
//   Country("+670", "East Timor"),
//   Country("+56", "Easter Island"),
//   Country("+593", "Ecuador"),
//   Country("+20", "Egypt"),
//   Country("+503", "El Salvador"),
//   Country("+240", "Equatorial Guinea"),
//   Country("+291", "Eritrea"),
//   Country("+372", "Estonia"),
//   Country("+251", "Ethiopia"),
//   Country("+500", "Falkland Islands"),
//   Country("+298", "Faroe Islands"),
//   Country("+679", "Fiji"),
//   Country("+358", "Finland"),
//   Country("+33", "France"),
//   Country("+596", "French Antilles"),
//   Country("+594", "French Guiana"),
//   Country("+689", "French Polynesia"),
//   Country("+241", "Gabon"),
//   Country("+220", "Gambia"),
//   Country("+995", "Georgia"),
//   Country("+49", "Germany"),
//   Country("+233", "Ghana"),
//   Country("+350", "Gibraltar"),
//   Country("+30", "Greece"),
//   Country("+299", "Greenland"),
//   Country("+1 473", "Grenada"),
//   Country("+590", "Guadeloupe"),
//   Country("+1 671", "Guam"),
//   Country("+502", "Guatemala"),
//   Country("+224", "Guinea"),
//   Country("+245", "Guinea-Bissau"),
//   Country("+595", "Guyana"),
//   Country("+509", "Haiti"),
//   Country("+504", "Honduras"),
//   Country("+852", "Hong Kong SAR China"),
//   Country("+36", "Hungary"),
//   Country("+354", "Iceland"),
//   Country("+91", "India"),
//   Country("+62", "Indonesia"),
//   Country("+98", "Iran"),
//   Country("+964", "Iraq"),
//   Country("+353", "Ireland"),
//   Country("+972", "Israel"),
//   Country("+39", "Italy"),
//   Country("+225", "Ivory Coast"),
//   Country("+1 876", "Jamaica"),
//   Country("+81", "Japan"),
//   Country("+962", "Jordan"),
//   Country("+7 7", "Kazakhstan"),
//   Country("+254", "Kenya"),
//   Country("+686", "Kiribati"),
//   Country("+965", "Kuwait"),
//   Country("+996", "Kyrgyzstan"),
//   Country("+856", "Laos"),
//   Country("+371", "Latvia"),
//   Country("+961", "Lebanon"),
//   Country("+266", "Lesotho"),
//   Country("+231", "Liberia"),
//   Country("+218", "Libya"),
//   Country("+423", "Liechtenstein"),
//   Country("+370", "Lithuania"),
//   Country("+352", "Luxembourg"),
//   Country("+853", "Macau SAR China"),
//   Country("+389", "Macedonia"),
//   Country("+261", "Madagascar"),
//   Country("+265", "Malawi"),
//   Country("+60", "Malaysia"),
//   Country("+960", "Maldives"),
//   Country("+223", "Mali"),
//   Country("+356", "Malta"),
//   Country("+692", "Marshall Islands"),
//   Country("+596", "Martinique"),
//   Country("+222", "Mauritania"),
//   Country("+230", "Mauritius"),
//   Country("+262", "Mayotte"),
//   Country("+52", "Mexico"),
//   Country("+691", "Micronesia"),
//   Country("+1 808", "Midway Island"),
//   Country("+373", "Moldova"),
//   Country("+377", "Monaco"),
//   Country("+976", "Mongolia"),
//   Country("+382", "Montenegro"),
//   Country("+1664", "Montserrat"),
//   Country("+212", "Morocco"),
//   Country("+95", "Myanmar"),
//   Country("+264", "Namibia"),
//   Country("+674", "Nauru"),
//   Country("+977", "Nepal"),
//   Country("+31", "Netherlands"),
//   Country("+599", "Netherlands Antilles"),
//   Country("+1 869", "Nevis"),
//   Country("+687", "New Caledonia"),
//   Country("+64", "New Zealand"),
//   Country("+505", "Nicaragua"),
//   Country("+227", "Niger"),
//   Country("+234", "Nigeria"),
//   Country("+683", "Niue"),
//   Country("+672", "Norfolk Island"),
//   Country("+850", "North Korea"),
//   Country("+1 670", "Northern Mariana Islands"),
//   Country("+47", "Norway"),
//   Country("+968", "Oman"),
//   Country("+92", "Pakistan"),
//   Country("+680", "Palau"),
//   Country("+970", "Palestinian Territory"),
//   Country("+507", "Panama"),
//   Country("+675", "Papua New Guinea"),
//   Country("+595", "Paraguay"),
//   Country("+51", "Peru"),
//   Country("+63", "Philippines"),
//   Country("+48", "Poland"),
//   Country("+351", "Portugal"),
//   Country("+1 787", "Puerto Rico"),
//   Country("+974", "Qatar"),
//   Country("+262", "Reunion"),
//   Country("+40", "Romania"),
//   Country("+7", "Russia"),
//   Country("+250", "Rwanda"),
//   Country("+685", "Samoa"),
//   Country("+378", "San Marino"),
//   Country("+966", "Saudi Arabia"),
//   Country("+221", "Senegal"),
//   Country("+381", "Serbia"),
//   Country("+248", "Seychelles"),
//   Country("+232", "Sierra Leone"),
//   Country("+65", "Singapore"),
//   Country("+421", "Slovakia"),
//   Country("+386", "Slovenia"),
//   Country("+677", "Solomon Islands"),
//   Country("+27", "South Africa"),
//   Country("+500", "South Georgia and the South Sandwich Islands"),
//   Country("+82", "South Korea"),
//   Country("+34", "Spain"),
//   Country("+94", "Sri Lanka"),
//   Country("+249", "Sudan"),
//   Country("+597", "Suriname"),
//   Country("+268", "Swaziland"),
//   Country("+46", "Sweden"),
//   Country("+41", "Switzerland"),
//   Country("+963", "Syria"),
//   Country("+886", "Taiwan"),
//   Country("+992", "Tajikistan"),
//   Country("+255", "Tanzania"),
//   Country("+66", "Thailand"),
//   Country("+670", "Timor Leste"),
//   Country("+228", "Togo"),
//   Country("+690", "Tokelau"),
//   Country("+676", "Tonga"),
//   Country("+1 868", "Trinidad and Tobago"),
//   Country("+216", "Tunisia"),
//   Country("+90", "Turkey"),
//   Country("+993", "Turkmenistan"),
//   Country("+1 649", "Turks and Caicos Islands"),
//   Country("+688", "Tuvalu"),
//   Country("+1 340", "U.S. Virgin Islands"),
//   Country("+256", "Uganda"),
//   Country("+380", "Ukraine"),
//   Country("+971", "United Arab Emirates"),
//   Country("+44", "United Kingdom"),
//   Country("+1", "United States"),
//   Country("+598", "Uruguay"),
//   Country("+998", "Uzbekistan"),
//   Country("+678", "Vanuatu"),
//   Country("+58", "Venezuela"),
//   Country("+84", "Vietnam"),
//   Country("+1 808", "Wake Island"),
//   Country("+681", "Wallis and Futuna"),
//   Country("+967", "Yemen"),
//   Country("+260", "Zambia"),
//   Country("+255", "Zanzibar"),
//   Country("+263", "Zimbabwe")
// ];