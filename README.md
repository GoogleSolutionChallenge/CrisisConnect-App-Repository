# CrisisConnect Application Repository

A natural disaster help and support application that provides critical information and resources to people impacted by natural disasters. Whether it's an earthquake, hurricane, wildfire, or any other natural disaster, the app can provide real-time updates on the situation, emergency contacts, shelter locations, and essential supplies such as food, water, and medical aid.

Moreover, the application also provides support to those affected by natural disasters, including counseling services, financial assistance, and volunteer opportunities. It enables users to connect with others affected by the same natural disaster, share their stories, and offer support to each other.

In short, a natural disaster help and support application can make a significant difference in the lives of those impacted by natural disasters, providing them with essential information, resources, and support during these challenging times.

## Ideas
-   Good Health and Wellbeing: 
-   Share data with doctors
-   Video call with Doctors
-   Find doctors in vicinity 
-   Quality Education:
-   Connects you to free courses
-   Environmental:
-   Store data related to something you want to investigate
- Natural Disaster (Climate Action or Sustainable Cities and Communities or Good Health and Wellbeing):
	-   Emergency response advice - locations of food banks and alerts
	-   Postings for non-profits organizations to coordinate donations

## Functionalities
- Link educational videos with general safety information
- Search for essential services near you
- Notifications alerting about the natural disaster
- Store emergency contact info
- Section with resources to help you stay calm (breathing exercises)
- If a disaster is detected in the country set by the user, their current/last known location is sent to the database and relayed to their emergency contacts, along with other information such as their secondary emergency contacts, information about the disaster, etc.

## Technologies
-   Flutter
-   Google Cloud Platform
-   Firebase

## User Stories:
- Make a profile with contact information and emergency contact(allow or decline collection of location) and language/country
- Natural disaster alerts
- User authentication - sign up/ sign in
- Contact emergency contacts
- Contact emergency services
- Get push notifications for danger alerts
- Change UI color

## Map
- See disasters in a specific areas
- View essential services
- Show weather 
- Search for locations on the map

## Education
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
  

## Figma Mobile Template:
- [https://www.figma.com/community/file/1076609425686201098](https://www.figma.com/community/file/1076609425686201098)
- [https://www.figma.com/community/file/936170226770702647](https://www.figma.com/community/file/936170226770702647)

## Color Palette
- #0085FF

## Resources (citations):

- [https://thenounproject.com/icon/earthquake-4762676/](https://thenounproject.com/icon/earthquake-4762676/)
- [https://thenounproject.com/icon/natural-disasters-1674920/](https://thenounproject.com/icon/natural-disasters-1674920/)
- [https://thenounproject.com/icon/volcano-1837025/](https://thenounproject.com/icon/volcano-1837025/)
- [https://thenounproject.com/icon/mental-health-3306335/](https://thenounproject.com/icon/mental-health-3306335/)
- [https://thenounproject.com/icon/natural-disasters-27832/](https://thenounproject.com/icon/natural-disasters-27832/)
- [https://thenounproject.com/icon/natural-disasters-1674927/](https://thenounproject.com/icon/natural-disasters-1674927/)
  
## Application blurb: (thank you ChatGPT :p)

A natural disaster help and support application provides critical information and resources to people impacted by natural disasters. Whether it's an earthquake, hurricane, wildfire, or any other natural disaster, the app can provide real-time updates on the situation, emergency contacts, shelter locations, and essential supplies such as food, water, and medical aid.

Moreover, the application also provides support to those affected by natural disasters, including counseling services, financial assistance, and volunteer opportunities. It enables users to connect with others affected by the same natural disaster, share their stories, and offer support to each other.

In short, a natural disaster help and support application can make a significant difference in the lives of those impacted by natural disasters, providing them with essential information, resources, and support during these challenging times.

## Organization Name Ideas
- Blaze Brigade
- CrisisConnect Team

## App Name Ideas
- Proactive
- LifeLine
- __CrisisConnect__
- ReliefNow
- Protocol
    
## Organization email
- [crisisconnectteam@gmail.com](mailto:crisisconnectteam@gmail.com)

## Database Fields
- Country
- Date and time of disaster
- Date and time disaster was created by upstream database
- Description
- Profile.key_content
- Status
- type
