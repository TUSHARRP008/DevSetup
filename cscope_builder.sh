#!/bin/bash
if [ $# -lt 1 ] ; then
echo "Usage: cscope_builder <path_to_project>"
exit 1
fi
project=$1
cd $project

rm -f cscope*
rm -f tags

if [ $# -gt 1 ] && [ $2 == "clean" ]; then
        echo "Removed cscope and tag files."
        echo ""
        exit 1
fi
find . -name '*.c' | grep -v 'stub' > cscope.files
find . -name '*.cpp' >>cscope.files
find . -name '*.cc' >>cscope.files
find . -name '*.h' >>cscope.files
find . -name '*.j' >>cscope.files
find . -name '*.javac' >>cscope.files
find . -name '*.py' >>cscope.files
find . -name '*.py.in' >>cscope.files
ctags -L cscope.files --extra=f
cscope -bkq -i cscope.files
echo "Done building database. Run cscope -d."
echo ""
 
