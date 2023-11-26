# Trabalho DevOps

A main não funciona por não encontrar o Android-sdk, o Branch 'web' seria a da entrega do trabalho, porem depois de mexer no docker file começou a dar problemas de permissões e não consegui resolver

1. Montar imagem:

```
docker build -t dockerfile .  
```

2. Iniciar Jenkins:

```
docker run --name jenkins_flutter -p 8080:8080 -p 50000:50000 dockerfile
```

3. Add SSH Key

Gerencias Jenkins --> Secutiry --> Host Key Verification Strategy: No verification

