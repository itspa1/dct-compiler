fname = File.open("temporary/1_1.txt","w")
$stderr = fname
$stdout = fname
puts "this is test"
fname.close
