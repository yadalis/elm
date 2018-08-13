var fs = require('fs');

module.exports = function (context, req) {
    

var path = __dirname + '//data.json';
 context.log(path);
 
    fs.readFile(path, 'utf8', function (err, data) {
        if (err) {
            context.log.error(err);
            context.done(err);
        }

        var result = JSON.parse(data);
        context.log(result);

        context.res = {
            // status: 200, /* Defaults to 200 */
 
            body: result,
            headers: {
                    
                'Content-Type': 'application/json'
            }
        };


        context.done();
    });

     
};