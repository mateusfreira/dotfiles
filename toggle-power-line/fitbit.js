#!/usr/bin/env node

const fs = require("fs");
const moment = require("moment");
const clientID = process.env.FTIBIT_CLIENT_ID,
    clientSecret = process.env.FITBIT_SECRET;
const FitbitApiClient = require("fitbit-node");
const fitbit = new FitbitApiClient(clientID, clientSecret);
//console.log(fitbit.getAuthorizeUrl("activity", "http://localhost"));
//fitbit.getAccessToken("528db05f5276d8879c12274439c0fb57c84ac366", 'http://localhost').then(function (result) {
//i	console.log("here", result.access_token, result);
//fs.writeFileSync(`${__dirname}/.fitbitTokey`, JSON.stringify(data));¬
//}).catch(console.error);
const togglLastRunFile = `${__dirname}/.fitbit-last-run`;
const lastResultFile = `${__dirname}/.fitbit-last-result`
let lastTime = fs.existsSync(togglLastRunFile) ? parseInt(fs.readFileSync(togglLastRunFile)) || 0 : 0;
if(new Date() - lastTime > 60000 || !fs.existsSync(lastResultFile)) {
    const data = JSON.parse(fs.readFileSync(`${__dirname}/.fitbitTokey`));
    fitbit.refreshAccessToken(data.accessToken, data.refresh_token, 28800 * 1000).then((data) => {
        fs.writeFileSync(`${__dirname}/.fitbitTokey`, JSON.stringify(data));
        return fitbit.get("/activities/steps/date/today/today.json", data.access_token).then(r => {
            store(r);
            print(r);
        });
    }).catch(console.log);

} else {
    print(JSON.parse(fs.readFileSync(lastResultFile)));
}

function store(time) {
    fs.writeFileSync(lastResultFile, JSON.stringify(time));
    fs.writeFileSync(togglLastRunFile, (new Date().getTime()));
}

function print(r) {
    if (r != null && !r[0].errors) {
        console.log("Fitbit: 👟  " + r[0]["activities-steps"][0].value);
    } else {
        process.stdout.write("No data");
    }
    process.exit(0);
}
