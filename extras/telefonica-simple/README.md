# Pasos para sacar ifs:

1) Crear una jerarquia polimorfica con una abstraccion para cada condicion de if (opcional porque a veces ya existe)
2) Mover (pero adaptandolo contextualmente) el cuerpo de cada if a cada abstraccion correspondiente usando el mismo mensaje
3) nombrar las abstracciones/clases de 1)
4) nombrar los mensajes de 2)
5) reemplazar ifs por envio de mensaje polimorfico
6) buscar objeto polimorfico (opcional)