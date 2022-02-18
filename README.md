# api-rails

Importante :
 para iniciar nuestro docker compose es necesario cambiar el nombre de las variables de ambiente
 .env.postgresql
 .env.env.store
 
 Levantar nuestro docker compose:
  docker-compose up -d
  
 Para corroborar nuestros contenedores que estén levantados ejecutamos
    docker container ls
 ( en caso de que quisieramos verificar un contenedor no se esté ejecutando debemos ejecutar
  docker container ls -a
 )   
 
 Es necesario ejecturar el contenedor . 
 docker container exec nombre_contenedor bash
 
Además se realizaron pruebas unitarias y de integración con Rspec. Se documentó con Swagger.

 
