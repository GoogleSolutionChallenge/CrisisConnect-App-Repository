// Import the required Node.js modules.
const admin = require('firebase-admin');
const axios = require('axios');

// Initialize the Firebase Admin SDK.
admin.initializeApp();

// Get a reference to the Firestore database and specify the name of the collection.
const db = admin.firestore();
const collectionName = 'disasterAlerts';

// Define an asynchronous function to handle the HTTP request and response.
exports.getActiveDisasterAlerts = async (req, res) => {
  try {
    // Define the ReliefWeb API endpoint to retrieve active disaster alerts.
    const API_ENDPOINT = 'https://api.reliefweb.int/v1/disasters?appname=apidoc&preset=latest&fields%5Binclude%5D%5B%5D=country&fields%5Binclude%5D%5B%5D=profile.key_content&fields%5Binclude%5D%5B%5D=date&fields%5Binclude%5D%5B%5D=description&fields%5Binclude%5D%5B%5D=profile.key_content&fields%5Binclude%5D%5B%5D=type.name&fields%5Binclude%5D%5B%5D=status&sort[]=date:desc&limit=10';

    // Make an HTTP GET request to the ReliefWeb API to retrieve active disaster alerts.
    const response = await axios.get(API_ENDPOINT);

    // Extract the array of active disaster alerts from the response data.
    const alerts = response.data.data;

    // Iterate over the array of active disaster alerts.
    const writeBatch = db.batch();
    for (const alert of alerts) {
      // Get a reference to the document in the Firestore collection with the same ID as the alert.
      const alertDocRef = db.collection(collectionName).doc(alert.id);

      // Check if the document already exists in Firestore.
      const alertDocSnapshot = await alertDocRef.get();
      if (alertDocSnapshot.exists) {
        // If the document exists, check if the alert date has changed.
        const alertData = alertDocSnapshot.data();
        if (alert.fields.date.changed !== alertData.fields.date.changed) {
          // If the date has changed, update the existing document with the new alert data.
          writeBatch.set(alertDocRef, alert, { merge: true });
          console.log(`Disaster alert ${alertDocRef.id} updated in Firestore!`);
        } else {
          // If the date has not changed, skip this alert.
          console.log(`Disaster alert ${alertDocRef.id} already up to date in Firestore!`);
        }
      } else {
        // If the document does not exist, create a new document in Firestore with the alert data.
        writeBatch.set(alertDocRef, alert);
        console.log(`Disaster alert ${alertDocRef.id} stored in Firestore!`);
      }
    }

    // Commit the batch of writes to Firestore.
    await writeBatch.commit();

    // Send a success response to the HTTP request.
    console.log('All disaster alerts stored in Firestore!');
    res.status(200).send('Disaster alerts retrieved and stored successfully in Firestore!');
  } catch (error) {
    // If an error occurs, send an error response to the HTTP request.
    console.error(error);
    res.status(500).send('Error retrieving or storing disaster alerts.');
  }
};
