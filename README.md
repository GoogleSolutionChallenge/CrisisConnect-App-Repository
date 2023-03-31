# Crisis Connect Application Repository

Crisis Connect is an app designed to help people stay informed and connected during natural disasters. The app's map feature also allows users to locate essential services such as hospitals, fire stations, and food banks. In the future, Crisis Connect plans to add educational videos on how to stay safe during natural disasters, making it an even more valuable resource. We also plan to add real-time alerts so that users can receive important information about natural disasters in their area. The app was created with the goal of helping people be better prepared and informed during times of crisis.

In short, a Crisis Connect is a help and support application that can make a significant difference in the lives of those impacted by natural disasters, providing them with essential information, resources, and support during challenging times.

## How to run Crisis Connect:
First, you will need to have Flutter and your choice of Android Studio or Visual Studio installed in order to run the application. Then, you will need to download the Flutter and Dart Plugins. Then, you can run "flutter doctor" to make sure Flutter is installed correctly. Afterwards, you will be able to clone the git repository and naviate to the Flutter application "crisis-connect" which will allow you to run the application.

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
