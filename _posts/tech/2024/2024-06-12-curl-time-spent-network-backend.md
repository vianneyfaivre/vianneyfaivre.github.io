---
layout: post
title: "curl - How to get time spent details"
categories: [tech]
---

Here is how you can get some metrics when making a http request:
- time spent establishing the http connection
- time spent by the server (TTFB: Time to First Byte)

```
curl \
  --verbose  \
  --location  \
  --output /dev/null  \
  --silent  \
  --write-out 'Establish Connection: %{time_connect}s\nTTFB: %{time_starttransfer}s\nTotal: %{time_total}s\n'  \
  'https://vianneyfaivre.com'
```

That command will print out some tech details like what was required to establish the http connection or the size of the http response.

Timings will be printed out:

```
Establish Connection: 0.036697s
TTFB: 0.091912s
Total: 0.094491s
```