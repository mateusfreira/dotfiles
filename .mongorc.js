db.getMongo().setReadPref('secondary')


var oldFind = DBCollection.prototype.find;
DBCollection.prototype.find = function(query, fields, limit, skip, batchSize, options) {
    var isOrganization = this.toString().match(/organizations/);
    var isCall = this.toString().match(/calls/);
    var isByID = query instanceof ObjectId;
    if ((!query._organization && !query._id) && !isOrganization && isCall && !isByID) {
        throw "Add _organization or _id to your query";
    }
    if (!query.createdDate && isCall && !isByID) {
        const date = new ISODate();
        date.setHours(0);
        throw `Add a createdDate to this query :) what about :  { createdDate: {  \$gt: ISODate('${date.toISOString()}') }    }`;
    }
    return oldFind.call(this, query, fields, limit, skip, batchSize, options);
};

var oldCount = DBCollection.prototype.count;
DBCollection.prototype.count = function(query, fields, limit, skip, batchSize, options) {
    var isOrganization = this.toString().match(/organizations/);
    var isCall = this.toString().match(/calls/);
    if (((!query._organization && !query._id) && !isOrganization)  && isCall)  {
        throw "Add _organization or _id to your query";
    }
    if (!query.createdDate && this.toString().match(/calls/)) {
        throw "Add a createdDate to this query :)";
    }
    return oldCount.call(this, query, fields, limit, skip, batchSize, options);
};


// Export to CSV function
DBQuery.prototype.toCSV = function(deliminator, textQualifier) {
    var count = -1;
    var headers = [];
    var data = {};

    var cursor = this;

    deliminator = deliminator == null ? ',' : deliminator;
    textQualifier = textQualifier == null ? '\"' : textQualifier;

    while (cursor.hasNext()) {

        var array = new Array(cursor.next());

        count++;

        for (var index in array[0]) {
            if (headers.indexOf(index) == -1) {
                headers.push(index);
            }
        }

        for (var i = 0; i < array.length; i++) {
            for (var index in array[i]) {
                data[count + '_' + index] = array[i][index];
            }
        }
    }

    var line = '';

    for (var index in headers) {
        line += headers[index] + ',';
    }

    line = line.slice(0, -1);
    print(line);

    for (var i = 0; i < count + 1; i++) {

        var line = '';
        var cell = '';
        for (var j = 0; j < headers.length; j++) {
            cell = data[i + '_' + headers[j]];
            if (cell == undefined) cell = '';
            line += textQualifier + cell + textQualifier + deliminator;
        }

        line = line.slice(0, -1);
        print(line);
    }
}
