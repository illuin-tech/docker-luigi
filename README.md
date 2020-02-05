# docker-luigi

Docker image based on Python 3.8 with Luigi installed. Image can be used with the following config: 

```yaml
  luigi:
    image: illuin/luigi
    restart: always
    ports:
      - "8082:8082"
    environment:
      luigi_database_url: "YOUR_DATABASE_URL"
```
