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

if (doc("books.xml")/books[author = "Jay Ban"])
   then
   <titulos>{doc("books.xml")//books/title/text()}</titulos>
   else
   <no_encontrado></no_encontrado>
	
