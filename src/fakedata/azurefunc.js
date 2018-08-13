//var fs = require('fs');

var result = require(__dirname + '//data.json');

module.exports = function (context, req) {
    
    context.res = {
            // status: 200, /* Defaults to 200 */
            //body: "Hello " + (req.query.name || req.body.name)

            body: result,
            headers: {
                    
                'Content-Type': 'application/json'
            }
        };

context.done();
// var path = __dirname + '//data.json';
//  context.log(path);
//   //context.done();
  
//     fs.readFile(path, 'utf8', function (err, data) {
//         if (err) {
//             context.log.error(err);
//             context.done(err);
//         }

//         var result = JSON.parse(data);
//         context.log(result);

//         context.res = {
//             // status: 200, /* Defaults to 200 */
//             //body: "Hello " + (req.query.name || req.body.name)

//             body: result,
//             headers: {
                    
//                 'Content-Type': 'application/json'
//             }
//         };


//         context.done();
//     });

    //var contents = fs.readFileSync("..\data.json");

    
    // context.log('JavaScript HTTP trigger function processed a request.');


    // if (req.query.name || (req.body && req.body.name)) {
    //     context.res = {
    //         // status: 200, /* Defaults to 200 */
    //         //body: "Hello " + (req.query.name || req.body.name)

    //         body: context.asdf,
    //         headers: {
                    
    //             'Content-Type': 'application/json'
    //         }
    //     };
    // }
    // else {
    //     context.res = {
    //         status: 400,
    //         body: "Please pass a name on the query string or in the request body"
    //     };
    // }
    // context.done();
};