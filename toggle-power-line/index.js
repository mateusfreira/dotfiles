#!/usr/bin/env node
const fs = require("fs");
const moment = require("moment");
const TogglClient = require('toggl-api');
const toggl = new TogglClient({
    apiToken: process.env.TOGGLE_TOKEY
});
const togglLastRunFile = `${__dirname}/.toggl-last-run`;
const lastResultFile = `${__dirname}/.toggl-last-result`
let lastTime = fs.existsSync(togglLastRunFile) ? parseInt(fs.readFileSync(togglLastRunFile)) || 0 : 0;
if (new Date() - lastTime > 60000 || !fs.existsSync(lastResultFile)) {
    toggl.getCurrentTimeEntry((err, time) => {
        store(time);
        print(time);
    });
} else {
    print(JSON.parse(fs.readFileSync(lastResultFile)));
}

function store(time) {
    fs.writeFileSync(lastResultFile, JSON.stringify(time));
    fs.writeFileSync(togglLastRunFile, (new Date().getTime()));
}

function print(time) {
    if (time != null) {
       const dots = time.description.length > 10 ? '...' : '';
       console.log(`Toggl: ${time.description.substr(0, 10)}${dots}  ${moment.utc(moment(new Date()).diff(time.start)).format("HH:mm")}`);
    } else {
        process.stdout.write("No toggl task");
    }
    process.exit(0);
}
