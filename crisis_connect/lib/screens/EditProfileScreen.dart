import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Still need to add Country field

class EditFormScreen extends StatefulWidget {

  const EditFormScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return EditProfile();
  }
}

class EditProfile extends State<EditFormScreen> {

  final FirebaseFirestore firestore = FirebaseFirestore.instance;



  // Get a reference to a collection named "users"
  late CollectionReference usersRef = firestore.collection('UserInfo');

  bool _obscureText = true;

  // Contact info:
  late String _firstname;
  late String _lastname;
  late String _email;
  late String _password;
  late String _phoneNumber;

  // Emergency contact info:
  late String _emergencyFirstname;
  late String _emergencyLastname;
  late String _emergencyPhoneNumber;

  // List of countries:
  late final List<String> _countries = ['Afghanistan', 'Aland Islands', 'Albania', 'Algeria', 'American Samoa', 'Andorra', 'Angola', 'Anguilla', 'Antarctica', 'Antigua and Barbuda', 'Argentina', 'Armenia', 'Aruba', 'Australia', 'Austria', 'Azerbaijan', 'Bahamas', 'Bahrain', 'Bangladesh', 'Barbados', 'Belarus', 'Belgium', 'Belize', 'Benin', 'Bermuda', 'Bhutan', 'Bolivia, Plurinational State of', 'Bonaire, Sint Eustatius and Saba', 'Bosnia and Herzegovina', 'Botswana', 'Bouvet Island', 'Brazil', 'British Indian Ocean Territory', 'Brunei Darussalam', 'Bulgaria', 'Burkina Faso', 'Burundi', 'Cambodia', 'Cameroon', 'Canada', 'Cape Verde', 'Cayman Islands', 'Central African Republic', 'Chad', 'Chile', 'China', 'Christmas Island', 'Cocos (Keeling) Islands', 'Colombia', 'Comoros', 'Congo', 'Congo, The Democratic Republic of the', 'Cook Islands', 'Costa Rica', "Côte d'Ivoire", 'Croatia', 'Cuba', 'Curaçao', 'Cyprus', 'Czech Republic', 'Denmark', 'Djibouti', 'Dominica', 'Dominican Republic', 'Ecuador', 'Egypt', 'El Salvador', 'Equatorial Guinea', 'Eritrea', 'Estonia', 'Ethiopia', 'Falkland Islands (Malvinas)', 'Faroe Islands', 'Fiji', 'Finland', 'France', 'French Guiana', 'French Polynesia', 'French Southern Territories', 'Gabon', 'Gambia', 'Georgia', 'Germany', 'Ghana', 'Gibraltar', 'Greece', 'Greenland', 'Grenada', 'Guadeloupe', 'Guam', 'Guatemala', 'Guernsey', 'Guinea', 'Guinea-Bissau', 'Guyana', 'Haiti', 'Heard Island and McDonald Islands', 'Holy See (Vatican City State)', 'Honduras', 'Hong Kong', 'Hungary', 'Iceland', 'India', 'Indonesia', 'Iran, Islamic Republic of', 'Iraq', 'Ireland', 'Isle of Man', 'Israel', 'Italy', 'Jamaica', 'Japan', 'Jersey', 'Jordan', 'Kazakhstan', 'Kenya', 'Kiribati', "Korea, Democratic People's Republic of", 'Korea, Republic of', 'Kuwait', 'Kyrgyzstan', "Lao People's Democratic Republic", 'Latvia', 'Lebanon', 'Lesotho', 'Liberia', 'Libya', 'Liechtenstein', 'Lithuania', 'Luxembourg', 'Macao', 'Macedonia, Republic of', 'Madagascar', 'Malawi', 'Malaysia', 'Maldives', 'Mali', 'Malta', 'Marshall Islands', 'Martinique', 'Mauritania', 'Mauritius', 'Mayotte', 'Mexico', 'Micronesia, Federated States of', 'Moldova, Republic of', 'Monaco', 'Mongolia', 'Montenegro', 'Montserrat', 'Morocco', 'Mozambique', 'Myanmar', 'Namibia', 'Nauru', 'Nepal', 'Netherlands', 'New Caledonia', 'New Zealand', 'Nicaragua', 'Niger', 'Nigeria', 'Niue', 'Norfolk Island', 'Northern Mariana Islands', 'Norway', 'Oman', 'Pakistan', 'Palau', 'Palestinian Territory, Occupied', 'Panama', 'Papua New Guinea', 'Paraguay', 'Peru', 'Philippines', 'Pitcairn', 'Poland', 'Portugal', 'Puerto Rico', 'Qatar', 'Réunion', 'Romania', 'Russian Federation', 'Rwanda', 'Saint Barthélemy', 'Saint Helena, Ascension and Tristan da Cunha', 'Saint Kitts and Nevis', 'Saint Lucia', 'Saint Martin (French part)', 'Saint Pierre and Miquelon', 'Saint Vincent and the Grenadines', 'Samoa', 'San Marino', 'Sao Tome and Principe', 'Saudi Arabia', 'Senegal', 'Serbia', 'Seychelles', 'Sierra Leone', 'Singapore', 'Sint Maarten (Dutch part)', 'Slovakia', 'Slovenia', 'Solomon Islands', 'Somalia', 'South Africa', 'South Georgia and the South Sandwich Islands', 'Spain', 'Sri Lanka', 'Sudan', 'Suriname', 'South Sudan', 'Svalbard and Jan Mayen', 'Swaziland', 'Sweden', 'Switzerland', 'Syrian Arab Republic', 'Taiwan, Province of China', 'Tajikistan', 'Tanzania, United Republic of', 'Thailand', 'Timor-Leste', 'Togo', 'Tokelau', 'Tonga', 'Trinidad and Tobago', 'Tunisia', 'Turkey', 'Turkmenistan', 'Turks and Caicos Islands', 'Tuvalu', 'Uganda', 'Ukraine', 'United Arab Emirates', 'United Kingdom', 'United States', 'United States Minor Outlying Islands', 'Uruguay', 'Uzbekistan', 'Vanuatu', 'Venezuela, Bolivarian Republic of', 'Viet Nam', 'Virgin Islands, British', 'Virgin Islands, U.S.', 'Wallis and Futuna', 'Yemen', 'Zambia', 'Zimbabwe'];
  late String _country = 'Country';

  final _controller = TextEditingController();

  // box radius
  final double _boxRadius = 8;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _header(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
          child: Text(
            title,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
      ),
    );
  }

  Widget _buildFirstName() {
    return
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),

          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(_boxRadius),
            color: Colors.white,
          ),
          child : TextFormField(
            decoration: const InputDecoration(
              hintText: 'First Name',
              border: InputBorder.none,
            ),
            //maxLength: 10,
            validator: (String? value) {
              return value==null ||value.isEmpty ? "First name can't be empty" : null;
            },
            onSaved: (String? value) {
              _firstname = value!;
            },
          ));
  }

  Widget _buildLastName() {
    return
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),

          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(_boxRadius),
            color: Colors.white,
          ),
          child : TextFormField(
            decoration: const InputDecoration(
              hintText: 'Last Name',
              border: InputBorder.none,
            ),
            //maxLength: 10,
            validator: (String? value) {
              return value==null ||value.isEmpty ? "Last name can't be empty" : null;
            },
            onSaved: (String? value) {
              _lastname = value!;
            },
          ));
  }

  Widget _buildEmail() {
    return
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),

          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(_boxRadius),
            color: Colors.white,
          ),
          child : TextFormField(
            decoration: const InputDecoration(
              hintText: 'Email',
              border: InputBorder.none,
            ),
            validator: (String? value) {
              return value==null ||value.isEmpty ? "Email can't be empty" : null;
            },
            onSaved: (String? value) {
              _email = value!;
            },
          ));
  }

  Widget _buildPassword() {
    return
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),

          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(_boxRadius),
            color: Colors.white,
          ),
          child : TextFormField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Password',
              border: InputBorder.none,
              suffixIcon: IconButton(
                  onPressed: () { _toggle(); },
                  icon: Icon(Icons.remove_red_eye)),
            ),
            obscureText: _obscureText,
            validator: (String? value) {
              return value==null ||value.isEmpty ? "Password can't be empty" : null;
            },
            onSaved: (String? value) {
              _password = value!;
            },
          ));
  }

  Widget _buildPhoneNumber() {
    return
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),

          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(_boxRadius),
            color: Colors.white,
          ),
          child : TextFormField(
            decoration: const InputDecoration(
              hintText: 'Phone number',
              border: InputBorder.none,
            ),
            validator: (String? value) {
              return value==null ||value.isEmpty ? "Phone number can't be empty" : null;
            },
            onSaved: (String? value) {
              _phoneNumber = value!;
            },
          ));
  }

  Widget _buildEmergencyFirstName() {
    return
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),

          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(_boxRadius),
            color: Colors.white,
          ),
          child : TextFormField(
            decoration: const InputDecoration(
              hintText: 'Emergency Contact First Name',
              border: InputBorder.none,
            ),
            //maxLength: 10,
            validator: (String? value) {
              return value==null ||value.isEmpty ? "Emergency contact first name can't be empty" : null;
            },
            onSaved: (String? value) {
              _firstname = value!;
            },
          ));
  }

  Widget _buildEmergencyLastName() {
    return
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(_boxRadius),
            color: Colors.white,
          ),
          child : TextFormField(
            decoration: const InputDecoration(
              hintText: 'Emergency Contact Last Name',
              border: InputBorder.none,
            ),
            //maxLength: 10,
            validator: (String? value) {
              return value==null ||value.isEmpty ? "Emergency contact last name can't be empty" : null;
            },
            onSaved: (String? value) {
              _lastname = value!;
            },
          ));
  }

  Widget _buildEmergencyPhoneNumber() {
    return
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(_boxRadius),
            color: Colors.white,
          ),
          child : TextFormField(
            decoration: const InputDecoration(
              hintText: 'Emergency Contact Phone number',
              border: InputBorder.none,
            ),
            validator: (String? value) {
              return value==null ||value.isEmpty ? "Emergency phone number can't be empty" : null;
            },
            onSaved: (String? value) {
              _phoneNumber = value!;
            },
          )
      );
  }

  Widget _buildCountryDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(_boxRadius),
        color: Colors.white,
      ),
      child: DropdownButtonHideUnderline(
          child: DropdownButton(
            hint: _country == null
                ? Text('Country') :
            Text(
              _country,
              style: const TextStyle(
                fontSize: 16,
                color: Color.fromRGBO(117, 117, 117, 1),
              ),
            ),
            isExpanded: true,
            iconSize: 30.0,
            style: const TextStyle(
              fontSize: 16,
              color: Color.fromRGBO(117, 117, 117, 1),
            ),
            items: _countries.map((val) {
              return DropdownMenuItem<String>(
                value: val,
                child: Text(val),
              );
            },
            ).toList(),
            onChanged: (val) {
              setState(() {
                _country = val!;
              },
              );
            },
          ) // your Dropdown Widget here
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Edit Profile"),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Handle menu button press
            },
          )
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _header('Contact Information'),
                SizedBox(height: 10),
                _buildFirstName(),
                SizedBox(height: 10),
                _buildLastName(),
                SizedBox(height: 10),
                _buildEmail(),
                SizedBox(height: 10),
                _buildPassword(),
                SizedBox(height: 10),
                _buildPhoneNumber(),
                SizedBox(height: 10),
                _buildCountryDropdown(),
                SizedBox(height: 10),
                _header('Emergency Contact Information'),
                SizedBox(height: 10),
                _buildEmergencyFirstName(),
                SizedBox(height: 10),
                _buildEmergencyLastName(),
                SizedBox(height: 10),
                _buildEmergencyPhoneNumber(),
                SizedBox(height: 10),
                ElevatedButton(
                  child: const Text(
                    'Confirm',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    _formKey.currentState!.save();

                    if (kDebugMode) {
                      print(_firstname);
                    }
                    if (kDebugMode) {
                      print(_lastname);
                    }
                    if (kDebugMode) {
                      print(_email);
                    }
                    if (kDebugMode) {
                      print(_phoneNumber);
                    }
                    if (kDebugMode) {
                      print(_password);
                    }
                    //Send to API
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}