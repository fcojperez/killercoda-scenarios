<br>

Use `kubectl exec` to enter the pod and run the `redis-cli` tool to check the current configuration:

<details><summary>Solution</summary>
<br>


```bash
kubectl exec -it redis -- redis-cli
```

* Check maxmemory:
```bash
127.0.0.1:6379> CONFIG GET maxmemory
```

* Check maxmemory:
```bash
127.0.0.1:6379> CONFIG GET maxmemory-policy
```

</details>