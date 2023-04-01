# Crisis Connect Application Repository
Crisis Connect is a comprehensive, cross-platform flutter application designed to keep individuals informed, connected, and prepared during natural disasters. With a user-friendly map feature, the app enables users to easily locate essential services such as hospitals, fire stations, and food banks. Future updates will include educational videos on disaster preparedness and real-time alerts, making Crisis Connect an indispensable resource during emergencies.

Our aim is for Crisis Connect to be a vital support application that empowers those affected by natural disasters with crucial information, resources, and assistance during trying times.

Prompted by the devastating earthquakes in Turkey earlier this year, our team of computer science and engineering students set out to create innovative solutions to help mitigate the impact of natural disasters on communities worldwide. As climate change continues to intensify, the frequency of such disasters is anticipated to increase, further highlighting the need for modern solutions to these modern issues.

Although academic responsibilities have temporarily slowed our progress, our vision for Crisis Connect incorporates several essential features, such as an emergency alert system to keep users informed during crises. In future updates, we aim to broaden our database to deliver vital emergency information to people globally, and to implement features that facilitate communication between users and their emergency contacts, ensuring seamless connections with loved ones during distressing situations.

Leveraging data from the United Nations Office for the Coordination of Humanitarian Affairs ReliefWeb API, our database continually consolidates critical emergency alert information from government agencies and international sources worldwide. This approach ensures that Crisis Connect provides comprehensive and up-to-date insights into global emergencies, offering users unparalleled access to essential information.

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

This is a small snapshot of our emergency alert database that is refreshed every five minutes via cloud functions. We hope to integrate this data into a real time alert feature:
![Screenshot_20230331_164146](https://user-images.githubusercontent.com/90366819/229316199-9cb7d475-3625-4480-89fc-2956fdf405c8.png)


This is the layout of the mobile application:
![Screenshot_20230331_170040](https://user-images.githubusercontent.com/90366819/229316200-a4b19493-8eb2-4777-bffc-8debbc1e31e0.png)


## Figma Mobile Template:
- https://www.figma.com/file/vqT0dYIKiAdcIbf8X3K8vM/App-Template?node-id=0-1&t=7bB6kZsx8sYTSsFu-0

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
