!#/bin/bash

kubectl get pod mypod 2>/dev/null && echo 1 || echo 0