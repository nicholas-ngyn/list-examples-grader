CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

if [[ -f student-submission/ListExamples.java ]]
then
    echo "Found file!"
else
    echo "Error: No ListExamples.java file found!"
    exit 1
fi

cp -r lib grading-area
cp TestListExamples.java grading-area
cp student-submission/ListExamples.java grading-area

cd grading-area

javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java

if [[ $? -ne 0 ]]
then
    echo "Error: Can't compile!"
    exit 1
fi

java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples

if [[ $? -ne 0 ]]
then
    echo "Failed!"
else
    echo "Passed!"
fi


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
