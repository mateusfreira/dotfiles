#!/usr/bin/env node

const request = require("request");
const fs = require("fs");
const moment = require("moment");
const KEY = process.env.RESCUITIME_KEY;
const togglLastRunFile = `${__dirname}/.rescuitime-last-run`;
const lastResultFile = `${__dirname}/.rescuitime-last-result`
let lastTime = fs.existsSync(togglLastRunFile) ? parseInt(fs.readFileSync(togglLastRunFile)) || 0 : 0;
if (new Date() - lastTime > 60000 || !fs.existsSync(lastResultFile)) {
    const data = JSON.parse(fs.readFileSync(`${__dirname}/.fitbitTokey`));
    return request.get("https://www.rescuetime.com/anapi/daily_summary_feed?key=" + KEY, (err, r) => {
        const data = JSON.parse(r.body)[0]
        store(data);
        print(data);
    });

} else {
    print(JSON.parse(fs.readFileSync(lastResultFile)));
}

function store(time) {
    fs.writeFileSync(lastResultFile, JSON.stringify(time));
    fs.writeFileSync(togglLastRunFile, (new Date().getTime()));
}

function print(r) {
    if (r != null && !r.errors) {
        const pt = r.all_productive_duration_formatted;
        const pp = r.productivity_pulse + "%";
        console.log(`Rescui: 📈  Pt:${pt}, ${pp}`)
    } else {
        process.stdout.write("No data");
    }
    process.exit(0);
}
