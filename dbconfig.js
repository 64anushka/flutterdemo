
const {Client} = require('pg') 
const config = new Client({ 
    host: "localhost",
    user: "postgres",
    port:5432,
    password: "1234", 
    database: "projectdemo"
})
  module.exports = config;
/*const {Client} = require('pg') 

const client = new Client({ 
    host: "localhost",
    user: "postgres",
    port:5432,
    password: "1234", 
    database: "projectdemo"
})

client.connect();
module.exports = client;*/
 