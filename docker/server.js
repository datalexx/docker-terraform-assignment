const { Client } = require("pg");
var express = require('express')
var app = express()
const product = 'Fake Product'

// https://node-postgres.com/features/connecting
const client = new Client({
    user: 'postgres',
    password: 'example',
    database: 'postgres',
    host: 'db',
    port: 5432,
});
client.connect()
client.query('SELECT NOW()', (err, res) => {
    console.log(err, res)
    client.end()
})

app.get('/', function (req, res) {
    // changed to backticks
    // https://github.com/airbnb/javascript#es6-template-literals
    res.send(`Hello ${product}`)
})

app.listen(8080, function () {
    console.log('app started on http://localhost:8080/')
})
