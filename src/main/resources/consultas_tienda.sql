-- 1. Lista los nombres y los precios de todos los productos de la tabla producto
    Select nombre,precio FROM producto;

-- 2. Devuelve una lista de Producto completa con el precio de euros convertido a dólares .
    SELECT nombre,round(precio*1.17,2) From producto;

-- 3. Lista los nombres y los precios de todos los productos, convirtiendo los nombres a mayúscula.
    Select UPPER(nombre),precio from producto;

-- 4. Lista el nombre de todos los fabricantes y a continuación en mayúsculas los dos primeros caracteres del nombre del fabricante.
    select nombre,UPPER(SUBSTR(nombre,1,2)) AS iniciales_Mayus from fabricante;
-- 5. Lista el código de los fabricantes que tienen productos.
    Select distinct f.codigo from fabricante f
    inner join producto p
    on f.codigo = p.codigo_fabricante;

-- 6. Lista los nombres de los fabricantes ordenados de forma descendente.
    Select p.nombre from fabricante p order by p.nombre desc;


-- 7. Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.

    Select p.nombre, p.precio from producto p order by p.nombre ASC , p.precio DESC

-- 8. Devuelve una lista con los 5 primeros fabricantes.
    Select * from fabricante f limit 5;

-- 9. Devuelve una lista con 2 fabricantes a partir del cuarto fabricante. El cuarto fabricante también se debe incluir en la respuesta.
    Select fabricante.nombre from fabricante
    limit 2 offset 3;


-- 10. Lista el nombre y el precio del producto más barato
    Select p.nombre, p.precio from producto p order by precio limit 1;

-- 11. Lista el nombre y el precio del producto más caro
    SELECT p.nombre, p.precio from producto p order by precio DESC  limit 1;

-- 12. Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
    Select p.nombre from producto p where p.codigo_fabricante = 2;

-- 13. Lista el nombre de los productos que tienen un precio menor o igual a 120€.
    Select p.nombre from producto p where p.precio<= 120;

-- 14. Lista los productos que tienen un precio mayor o igual a 400€.
    Select p.nombre from producto p where p.precio>= 400;

-- 15. Lista todos los productos que tengan un precio entre 80€ y 300€.
    Select p.nombre from producto p where p.precio>80 and p.precio<300;

-- 16. Lista todos los productos que tengan un precio mayor que 200€ y que el código de fabricante sea igual a 6.
    Select * from producto where precio>200 and codigo_fabricante=6;

-- 17. Lista todos los productos donde el código de fabricante sea 1, 3 o 5 utilizando un Set de codigos de fabricantes para filtrar.
    select * from producto where codigo_fabricante = 1 or codigo_fabricante =3 or codigo_fabricante = 5;

-- 18. Lista el nombre y el precio de los productos en céntimos.
    SELECT nombre,precio*100 AS precioCentimos from producto;

-- 19. Lista los nombres de los fabricantes cuyo nombre empiece por la letra S
    SELECT f.nombre from fabricante f where f.nombre like 'S%';

-- 20. Devuelve una lista con los productos que contienen la cadena Portátil en el nombre.
    Select* from producto where producto.nombre like '%Portátil%';

-- 21. Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
    Select p.nombre from producto p where p.nombre like '%Monitor%' and p.precio<215;

-- 22. Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
    SELECT p.nombre, p.precio from producto p where p.precio>=180 order by p.precio DESC, p.nombre;

-- 23. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.
    Select p.nombre,p.precio,f.nombre from producto p inner join fabricante f on p.codigo_fabricante = f.codigo order by f.nombre;

-- 24. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
    SELECT p.nombre,p.precio,f.nombre from producto p inner join fabricante f on p.codigo_fabricante = f.codigo
    order by p.precio DESC limit 1;

-- 25. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
    USE tienda;
    SELECT p.nombre, p.precio from producto p
    inner join fabricante f
    on p.codigo_fabricante = f.codigo
    where p.precio > 200;

-- 26. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate.
         SELECT p.nombre from producto p
        inner join fabricante f
        on p.codigo_fabricante = f.codigo
        where f.nombre = 'Asus' or f.nombre = 'Hewlett-Packard' or f.nombre = 'Seagate';

-- 27. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre.
    Select p.nombre,p.precio,f.nombre from producto p
    inner join fabricante f
    where p.precio > 180
    order by p.precio DESC, f.nombre ASC


-- 28. Devuelve un listado de los nombres fabricantes que existen en la base de datos, junto con los nombres productos que tiene cada uno de ellos.
--    El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
    Select f.nombre As nombre_fabricante, p.nombre As nombre_producto from fabricante f
    left join producto p
    on f.codigo = p.codigo_fabricante;

-- 29. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
    Select f.nombre from fabricante f
    left join producto p
    on p.codigo_fabricante = f.codigo
    where p.codigo_fabricante is null
    order by f.nombre;

-- 30. Calcula el número total de productos que hay en la tabla productos. Utiliza la api de stream.
        Select count(p.nombre) AS cantidad_productos from producto p;

-- 31. Calcula el número de fabricantes con productos, utilizando un stream de Productos.
        Select count(DISTINCT f.codigo ) AS fabricante_con_productos from producto p
        inner join fabricante f
        on f.codigo = p.codigo_fabricante



-- 32. Calcula la media del precio de todos los productos
    Select AVG(precio) from producto;

-- 33. Calcula el precio más barato de todos los productos. No se puede utilizar ordenación de stream.
        SELECT min(precio) from producto;

-- 34. Calcula la suma de los precios de todos los productos.
        select sum(precio) from producto;

-- 35. Calcula el número de productos que tiene el fabricante Asus.
        Select count(p.nombre) from producto p
        inner join fabricante f
        where f.codigo = p.codigo_fabricante and f.nombre = 'Asus';

-- 36. Calcula la media del precio de todos los productos del fabricante Asus.
        Select AVG(p.precio) from producto p
        inner join fabricante f
        on p.codigo_fabricante = f.codigo and f.nombre = 'Asus';

-- 37. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.
-- Realízalo en 1 solo stream principal. Utiliza reduce con Double[] como "acumulador".
    Select max(p.precio) AS precio_máximo,min(p.precio) AS precio_minimo, AVG(p.precio) AS media,count(p.nombre) AS total_de_productos from producto p
    inner join fabricante f
    on p.codigo_fabricante = f.codigo and f.nombre = 'Crucial';

-- 38. Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe incluir los fabricantes que no tienen
-- ningún producto. El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. Ordene el resultado
-- descendentemente por el número de productos.
    Select f.nombre AS nombre_del_fabricante, count(p.nombre) AS numero_de_productos from fabricante f
    left join producto p
    on p.codigo_fabricante = f.codigo
    group by nombre_del_fabricante
    order by numero_de_productos DESC ;

-- 39. Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes.
--     El resultado mostrará el nombre del fabricante junto con los datos que se solicitan. Realízalo en 1 solo stream principal.
--     Utiliza reduce con Double[] como "acumulador".

        Select f.nombre AS nombre_fabricante, max(p.precio) AS precio_maximo,min(p.precio) AS precio_minimo ,avg(p.precio) AS media from producto p
        inner join fabricante f
        on p.codigo_fabricante = f.codigo
        group by f.nombre;

-- 40. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€.
-- No es necesario mostrar el nombre del fabricante, con el código del fabricante es suficiente.
    Select p.codigo_fabricante AS codigo_fab,max(p.precio) AS precio_maximo, min(p.precio) AS precio_minimo, AVG(p.precio) AS media,count(p.nombre) AS total_productos from producto p
    group by p.codigo_fabricante
    having avg(p.precio)>200;
-- 41. Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.
    Select f.nombre from fabricante f
    inner join producto p
    on f.codigo = p.codigo_fabricante
    group by f.codigo
    having COUNT(p.codigo)>=2;



-- 42. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €.
--  Ordenado de mayor a menor número de productos.

    Select f.nombre,SUM(CASE WHEN p.precio >= 220 then 1 else 0 END) AS num_productos from fabricante f
    left join producto p
    on f.codigo = p.codigo_fabricante
    group by f.codigo,f.nombre
    order by num_productos DESC;



-- 43. Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es superior a 1000 €
        SELECT f.nombre, SUM(p.precio) AS suma_precios from fabricante f
        inner join producto p
        on f.codigo = p.codigo_fabricante
        GROUP BY f.nombre
        HAVING suma_precios > 1000;
-- 44. Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es inferior a 1000 €.
--      Ordenado de menor a mayor por cuantía de precio de los productos.
    Select f.nombre,IFNULL(SUM(p.precio),0) as suma_precios from fabricante f
    left join producto p
    on f.codigo=p.codigo_fabricante
    group by f.nombre
    having suma_precios < 1000
    order by suma_precios asc;

-- 45. Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. El resultado debe tener tres columnas: nombre del producto, precio y
--      nombre del fabricante. El resultado tiene que estar ordenado alfabéticamente de menor a mayor por el nombre del fabricante.
    SELECT p.nombre, p.precio,f.nombre from producto p
    inner join fabricante f
    on p.codigo_fabricante = f.codigo
    where p.precio = (Select MAX(p2.precio)
                      from producto p2
                      where p2.codigo_fabricante = p.codigo_fabricante
                      )
    order by f.nombre;


-- 46. Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.
--  Se ordenará por fabricante en orden alfabético ascendente y los productos de cada fabricante tendrán que estar ordenados por precio descendente.

    SELECT f.nombre,p.nombre from fabricante f
    inner join producto p
    on f.codigo = p.codigo_fabricante
    where p.precio >= (
        Select avg(p2.precio)
        from producto p2
        where p2.codigo_fabricante = p.codigo
        )
    order by f.nombre ASC, p.precio DESC;
