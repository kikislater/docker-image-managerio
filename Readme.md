

Release Notes
-------------

This is a non official dockerized version of the www.manager.io accounting software.

https://www.manager.io/releases/

Running
-------

You can run this image as:

```
 docker build -t giscan/managerio .
 docker run -v managerio_data:/data -p 80:8080 --name managerio giscan/managerio:latest
```

