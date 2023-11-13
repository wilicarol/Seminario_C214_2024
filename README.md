# Trabalho DevOps

1. Montar imagem:

```
docker build -t dockerfile .  
```

2. Iniciar Jenkins:

```
docker run --name jenkins_flutter -p 8080:8080 -p 50000:50000 dockerfile
```




