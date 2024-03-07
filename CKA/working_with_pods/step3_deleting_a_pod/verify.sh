!#/bin/bash

kubectl get pod mypod | grep mypod

# Check the exit status
if [ $? -gt 0 ]; then
    echo "Pod deleted"
else
    echo "Error: Command execution failed."
    exit 1
fi