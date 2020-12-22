@echo off
echo ****PySpark Installation on Windows****
echo ****https://patilvijay23.medium.com/about****
timeout 5

REM Update path to install Spark at required location.
REM Following command uses the Env variable 'USERPROFILE' to create the spark_setup folder in Users home directory
ECHO Creating folder in %USERPROFILE%
mkdir %USERPROFILE%\spark_setup
cd %USERPROFILE%\spark_setup\
echo *********************************************************
echo *********************************************************

REM Update below path to the required version of spark
ECHO Downloading spark file
curl -o sparkfile.tgz https://archive.apache.org/dist/spark/spark-2.4.3/spark-2.4.3-bin-hadoop2.7.tgz

ECHO Extracting spark file
timeout 2
tar -xvzf sparkfile.tgz

REM Optional command to delete the file post extraction. Comment/Uncomment below line
DEL /F sparkfile.tgz
echo *********************************************************
echo *********************************************************

REM Update below path to the required version of winutils.exe
ECHO Downloading winutils.exe
curl -k -L -o winutils.exe https://github.com/steveloughran/winutils/raw/master/hadoop-2.7.1/bin/winutils.exe

ECHO move winutils.exe to required locations (create \hadoop\bin directories)
copy winutils.exe spark-2.4.3-bin-hadoop2.7\bin\winutils.exe
mkdir spark-2.4.3-bin-hadoop2.7\hadoop\bin
move winutils.exe spark-2.4.3-bin-hadoop2.7\hadoop\bin\winutils.exe
echo *********************************************************
echo *********************************************************

REM Update the Env paths as per installation directories.
REM 'Path' variable step will have to be done manually. Lots of issues in using setx for updating 'Path'
ECHO Setting Env variables
setx SPARK_HOME "%cd%\spark-2.4.3-bin-hadoop2.7"
setx HADOOP_HOME "%SPARK_HOME%\hadoop
setx JAVA_HOME "C:\Program Files\Java\jre1.8.0_271"
REM Optional variables for using Jupyter instead of console. Uncomment/comment below lines
REM setx PYSPARK_DRIVER_PYTHON "jupyter"
REM setx PYSPARK_DRIVER_PYTHON_OPTS "notebook"
echo *********************************************************
echo *********************************************************


echo Thank you for using this setup. Please like (clap) the medium article if it was helpful.
timeout 5
start chrome "https://patilvijay23.medium.com/installing-and-using-pyspark-on-windows-machine-59c2d64af76e"
