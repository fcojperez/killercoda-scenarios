#!/bin/bash

kubectl describe cm redis-config \
  | grep -E 'maxmemory|2mb|maxmemory-policy|allkeys-lru'
