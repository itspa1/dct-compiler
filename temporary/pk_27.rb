fname = File.open("temporary/pk_27.txt","w")
$stderr = fname
$stdout = fname
puts "hello from the database"
fname.close
