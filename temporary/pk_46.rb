fname = File.open("temporary/pk_46.txt","w")
$stderr = fname
$stdout = fname
puts "hi"
puts "this is ruby"
fname.close
