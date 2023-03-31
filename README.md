# Crisis Connect Application Repository

Crisis Connect is an app designed to help people stay informed and connected during natural disasters. The app's map feature also allows users to locate essential services such as hospitals, fire stations, and food banks. In the future, Crisis Connect plans to add educational videos on how to stay safe during natural disasters, making it an even more valuable resource. We also plan to add real-time alerts so that users can receive important information about natural disasters in their area. The app was created with the goal of helping people be better prepared and informed during times of crisis.

In short, a Crisis Connect is a help and support application that can make a significant difference in the lives of those impacted by natural disasters, providing them with essential information, resources, and support during challenging times.

## How to run Crisis Connect

Install Flutter and your preferred IDE:
- Make sure you have Flutter and either Android Studio or Visual Studio Code installed on your computer.
Download Flutter and Dart Plugins:

Once your IDE is installed, you'll need to download the Flutter and Dart plugins. Check your IDE's documentation on how to do this.
Verify Flutter installation:
- Open a terminal or command prompt and run "flutter doctor" to verify that Flutter is installed correctly on your system.
Clone the Git repository:

Use Git to clone the repository to your local machine.
Navigate to the application directory:
- Open your IDE and navigate to the "crisis-connect" directory within the cloned repository.
Run the application:

Run the application from your IDE or by running the command "flutter run" in the terminal or command prompt.
By following these steps, you should be able to run the "crisis-connect" Flutter application on your computer.

## Images

Sign in screen:
![image](https://user-images.githubusercontent.com/90366819/229123634-10981016-fab1-4621-847b-70fbd643a6a6.png)

Create an account screen:
![image](https://user-images.githubusercontent.com/90366819/229123690-43d77c0b-82bb-4e15-874f-ffe446dd3c40.png)

Map screen prompting user to allow location:
![image](https://user-images.githubusercontent.com/90366819/229123804-69a2ee00-cc6a-47b0-af7f-d08aaebfd513.png)

After clicking on the Hospital button, we get the locations of all the hospitals on the map:
![image](https://user-images.githubusercontent.com/90366819/229123937-74b57078-8f25-489c-815a-816659d68f4d.png)

After clicking on the Police Station button, we get the locations of all the police stations on the map:
![image](https://user-images.githubusercontent.com/90366819/229124497-358a2a8d-cfd7-4b52-8502-4eb17cbd4a53.png)

After clicking on the Fire Station button, we get the locations of all the fire stations on the map:
![image](https://user-images.githubusercontent.com/90366819/229124340-45af42ed-e2a6-4f04-886e-c4b742e89dfd.png)

After clicking on the Food Bank button, we get the locations of all the food banks on the map:
![image](https://user-images.githubusercontent.com/90366819/229124701-fde1bdf9-274c-4994-9024-b7969696da43.png)


## Figma Mobile Template:
- [https://www.figma.com/community/file/1076609425686201098](https://www.figma.com/community/file/1076609425686201098)
- [https://www.figma.com/community/file/936170226770702647](https://www.figma.com/community/file/936170226770702647)

## Technologies
-   Flutter
-   Google Cloud Platform
-   Firebase
-   Google Maps API

## User Stories:
- Make a profile with contact information and emergency contact(allow or decline collection of location) and language/country
- Natural disaster alerts
- User authentication - sign up/ sign in
- Contact emergency contacts
- Contact emergency services
- Get push notifications for danger alerts

## Map
- See disasters in a specific areas
- View essential services
- Show weather 
- Search for locations on the map

## Education (to be implemented)
- Links to educational videos/resources
- Search for videos
- Coping Mechanisms & resources to help you stay calm

## API/Data Sources
- [Common Alerting Protocol Documentation](http://docs.oasis-open.org/emergency/cap/v1.2/CAP-v1.2.html)
	- The Common Alerting Protocol (CAP) is an [XML](https://en.wikipedia.org/wiki/XML)-based data format for exchanging [public warnings](https://en.wikipedia.org/wiki/Emergency_population_warning) and emergencies between alerting technologies.
	- This would also allow us to pull our alert data from more than one source to maximize response time and accuracy of alerts propogated over a certain area
- [Public Alerts | Google Developers](https://developers.google.com/public-alerts)
- [Weather API - By Any City](https://rapidapi.com/onetech265/api/weather-api-by-any-city/)
    
- [OpenWeather](https://openweathermap.org/our-initiatives) also has an excellent Weather API and a suite of other tools to assist humanitarian initiatives 
- [Reliefweb API](https://apidoc.rwlabs.org/) 
- ReliefWeb (RW) is a [humanitarian](https://en.wikipedia.org/wiki/Humanitarian) information portal founded by The United Nations Office for the Coordination of Humanitarian Affairs (OCHA) in 1996.
- [ReliefWeb Field Tables](https://apidoc.rwlabs.org/fields-tables)
- [Cloud Functions for Firebase](https://firebase.google.com/docs/functions)
  
## Libraries/frameworks/Hosting
- Firebase cloud functions
- Firebase Firestore
- Google Cloud
