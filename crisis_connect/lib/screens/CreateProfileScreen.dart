import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Still need to add Country field

class FormScreen extends StatefulWidget {

  const FormScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return CreateProfile();
  }
}

class CreateProfile extends State<FormScreen> {

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
  late String _country;


  var _controller = TextEditingController();



  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _header(String title) {
    return TextField(
      decoration: InputDecoration(labelText: title),
    );
  }

  Widget _buildFirstName() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'First Name'),
      //maxLength: 10,
      validator: (String? value) {
        return value==null ||value.isEmpty ? "First Name can't be empty" : null;
      },
      onSaved: (String? value) {
        _firstname = value!;
      },
    );
  }

  Widget _buildLastName() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Last Name'),
      //maxLength: 10,
      validator: (String? value) {
        return value==null ||value.isEmpty ? "Last Name can't be empty" : null;
      },
      onSaved: (String? value) {
        _lastname = value!;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Email'),
      validator: (String? value) {
        return value==null ||value.isEmpty ? "Email can't be empty" : null;
      },
      onSaved: (String? value) {
        _email = value!;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
          labelText: 'Password',
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
    );
  }

  Widget _hideShowPassword() {
    return TextButton(
        onPressed: _toggle,
        child: Text(_obscureText ? "Show" : "Hide"));
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Phone number'),
      validator: (String? value) {
        return value==null ||value.isEmpty ? "Phone number can't be empty" : null;
      },
      onSaved: (String? value) {
        _phoneNumber = value!;
      },
    );
  }

  Widget _buildEmergencyFirstName() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Emergency Contact First Name'),
      //maxLength: 10,
      validator: (String? value) {
        return value==null ||value.isEmpty ? "Emergency Contact First Name can't be empty" : null;
      },
      onSaved: (String? value) {
        _firstname = value!;
      },
    );
  }

  Widget _buildEmergencyLastName() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Emergency Contact Last Name'),
      //maxLength: 10,
      validator: (String? value) {
        return value==null ||value.isEmpty ? "Emergency Contact Last Name can't be empty" : null;
      },
      onSaved: (String? value) {
        _lastname = value!;
      },
    );
  }

  Widget _buildEmergencyPhoneNumber() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Emergency Contact Phone number'),
      validator: (String? value) {
        return value==null ||value.isEmpty ? "Emergency Phone number can't be empty" : null;
      },
      onSaved: (String? value) {
        _phoneNumber = value!;
      },
    );
  }

  Widget _buildCountryDropdown() {
    return DropdownButton<String>(
      items: _countries.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? value) {
        _country = value!;
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _header('Contact Information'),
                _buildFirstName(),
                _buildLastName(),
                _buildEmail(),
                _buildPassword(),
                _buildPhoneNumber(),
                _buildCountryDropdown(),
                _header('Emergency Contact Information'),
                _buildEmergencyFirstName(),
                _buildEmergencyLastName(),
                _buildEmergencyPhoneNumber(),
                SizedBox(height: 100),
                ElevatedButton(
                  child: Text(
                    'Submit',
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