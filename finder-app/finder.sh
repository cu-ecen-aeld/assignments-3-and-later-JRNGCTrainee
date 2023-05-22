# Accepts the following runtime arguments: the first argument is a path to a directory on the 
# filesystem, referred to below as filesdir; the second argument is a text string which will 
# be searched within these files, referred to below as searchstr



# Exits with return value 1 error and print statements if any of the parameters above were not specified
if [ "$#" -ne 2 ]; then
  echo "ERROR: The finder script requires exactly 2 arguments: The path to a directory and the text string to search for in that directory's files"
  exit 1
fi;

filesdir=$1
searchstr=$2

# Exits with return value 1 error and print statements if filesdir does not represent a directory on the filesystem
if [ ! -d "$filesdir" ]; then
  echo "ERROR: The first argument, $filesdir, is not a directory."
  exit 1
fi;

# Prints a message "The number of files are X and the number of matching lines are Y" where X is the number of files 
# in the directory and all subdirectories and Y is the number of matching lines found in respective files, where a 
# matching line refers to a line which contains searchstr (and may also contain additional content).

num_files=$(find "$filesdir" -type f | wc -l)
num_matching_lines=$(grep -r "$searchstr" "$filesdir" | wc -l)

echo "The number of files are $num_files and the number of matching lines are $num_matching_lines"