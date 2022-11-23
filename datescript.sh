# Creating the file
#!/bin/sh

# Writing the commands to take in values
echo "Enter the start date: "
read -r start_date

echo "Enter the end date: "
read -r end_date

# Converting the values to seconds and attaching them to variables

sdate=$(date --date="$start_date" +%s)
edate=$(date --date="$end_date" +%s)

# Getting the sum total number of seconds
num=$(( edate-sdate ))

# Declaring the remaining variables
min=0
hour=0
day=0

# Writing the if-else statement to determine seconds
if [  "$num" -gt 59 ];
then
	sec=$(( num%60 ))
	num=$(( num/60 ))

# Writing the if-else statement to determine minutes
	if [ "$num" -gt 59 ];
	then
		min=$(( num%60 ))
		num=$(( num/60 ))

# Writing the if-else statement to determine hours
		if [ "$num" -gt 23 ];
		then
			hour=$(( num%24 ))
			day=$(( num/24 ))
		else
			hour="$num"
		fi
	else
		min="$num"
	fi
else
	sec="$num"
fi

#Printing out the result
echo "${day}d ${hour}h ${min}m ${sec}s between $start_date and $end_date"
