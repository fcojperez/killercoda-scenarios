

<br>

<blockquote>
<p><strong>Useful Resources</strong>: <a target="_blank" href="https://kubernetes.io/docs/tutorials/configuration/configure-redis-using-configmap/" rel="noreferrer noopener">configure Redis using ConfigMap</a></p>
</blockquote>

Create a configmap named `redis-config`. Within the configMap, use the key `maxmemory` with value `2mb` and key `maxmemory-policy` with value `allkeys-lru`.

<details><summary>Solution</summary>
<br>

We create a yaml file called `redis-config.yaml` with the information below.

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: redis-config
data:
  redis-config: |
    maxmemory 2mb
    maxmemory-policy allkeys-lru
```

</details>


