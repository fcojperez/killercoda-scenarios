#!/bin/bash

kubectl exec -it redis-pod -- redis-cli CONFIG GET maxmemory CONFIG GET maxmemory-policy \
  | grep -E 'maxmemory|2[0-9]{1,6}|maxmemory-policy|allkeys-lru'
