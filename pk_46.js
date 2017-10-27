var fs = require('fs'); var access = fs.createWriteStream('pk_46.txt'); access.truncate; process.stdout.write = process.stderr.write = access.write.bind(access); process.on('uncaughtException', function(err) { console.error((err && err.stack) ? err.stack : err); });
console.log("this was written before.");
console.log("this is tested");
