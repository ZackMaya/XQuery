(: Esto es un comentario:)
(: Este query es para hacer uso de los atributos:)
(:doc("books.xml")//book[@category="XML"]:)

(:exp para obtener elementos libro cuyo año sea mayor o igual a 2010:)
(:doc("books.xml")//book[year>=2010]:)

(:Con comparaciones de valores:)
(:doc("books.xml")//book[./year ge "2010"]:)

(:Comparación entre nodos:)
(:doc("books.xml")//book[1] is doc("books2.xml")//book[1]:)

(:year aparece despues de title:)
(:doc("books.xml")//book[1]/year >> doc("books.xml")//book[1]/title:)

(:Expresiones condicionales:)
(:Una condicion donde el autor debe ser igual a Jay Ban si se cumple imprimimos todos
los titulos dentro de un elemento xml llamado <titulos> y lo regresamos 
sino se cumple retornamos un elemento <no_encontrado>:)

(:if (doc("books.xml")/books[author = "Jay Ban"])
   then
   <titulos>{doc("books.xml")//books/title/text()}</titulos>
   else
   <no_encontrado></no_encontrado>:)
   
(:doc("catalogoproductos.xml")//catalogo/dvd/text():)

(:if (doc("catalogoproductos.xml")//catalogo/dvd[./@moneda eq "euro"])
	then
	<dvds>{doc("catalogoproductos.xml")//catalogo/dvd[./@precio ge "20"]}</dvds>
	else
	<consultamal></consultamal>:)
	
(:doc("catalogoproductos.xml")//catalogo/dvd[./@precio ge "20"]:)





for $x in doc("quimicamexicana.xml")//extracto/producto
return if($x[./@valor<7.0])
		then <ph valor="{data($x/@valor)}" 
		 		 type="acida"
         		 nombre="{data($x/@nombre)}" ></ph>
else 
	if($x[./@valor=7.0])
		then <ph valor="{data($x/@valor)}" 
		 		 type="neutra"
         		 nombre="{data($x/@nombre)}" ></ph>
    else <ph valor="{data($x/@valor)}" 
		 type="basica"
         nombre="{data($x/@nombre)}" ></ph>

 
  
  (:    
for $x in doc("catalogoproductos.xml")//catalogo/dvd
return if($x[./@precio>=20])
	then <dvds nombre="{data($x/text())}" precio="{data($x/@precio)}" moneda="{data($x/@moneda)}"></dvds>
else
	<dvds/>

:)
