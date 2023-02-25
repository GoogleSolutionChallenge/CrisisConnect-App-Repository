const axios = require('axios');

exports.getActiveDisasterAlerts = async (req, res) => {
  try {
    const API_ENDPOINT = 'https://api.reliefweb.int/v1/disasters?appname=apidoc&preset=latest&fields%5Binclude%5D%5B%5D=country&fields%5Binclude%5D%5B%5D=profile.key_content&fields%5Binclude%5D%5B%5D=date&fields%5Binclude%5D%5B%5D=description&fields%5Binclude%5D%5B%5D=profile.key_content&fields%5Binclude%5D%5B%5D=type.name&fields%5Binclude%5D%5B%5D=status&sort[]=date:desc&limit=300';
    const response = await axios.get(API_ENDPOINT);
    const json = response.data;

    console.log(JSON.stringify(json));

    res.status(200).send('Disaster alerts retrieved successfully!');
  } catch (error) {
    console.error(error);
    res.status(500).send('Error retrieving disaster alerts.');
  }
};