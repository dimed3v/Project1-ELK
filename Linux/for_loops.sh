#!/bin/bash

states=("New York", "Hawaii", "California", "Washington", "Texas")

 for state in ${states[@]}
 do
if [ $state == 'Hawaii' ];
then 
	echo "Hawaii is the best!"
	break
else
	echo "I'm not fond of Hawaii"
fi
done



