# Accepts the following arguments: the first argument is a full path to a file including 
# filename) on the filesystem, referred to below as writefile; the second argument 
# is a text string which will be written within this file, referred to below as writestr

# Exits with value 1 error and print statements if any of the arguments above were not specified
if [ "$#" -ne 2 ]; then
  echo "ERROR: The writer script requires exactly 2 arguments: The path to a file and the text string to be written into it"
  exit 1
fi;

writefile=$1
writestr=$2


# Creates a new file with name and path writefile with content writestr, overwriting any existing 
# file and creating the path if it doesn’t exist. Exits with value 1 and error print statement if 
#the file could not be created.
writefile_path=$(dirname "$writefile")
if [ ! -d "$writefile_path" ]; then
  mkdir -p "$writefile_path"
fi;

echo "$writestr" | tee "$writefile" > /dev/null
