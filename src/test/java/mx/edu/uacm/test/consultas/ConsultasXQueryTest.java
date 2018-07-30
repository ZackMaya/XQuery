package mx.edu.uacm.test.consultas;

import java.io.FileNotFoundException;

import javax.xml.xquery.XQException;

import org.junit.Test;

import mx.edu.uacm.consultas.ConsultasXQuery;
//Pagina para ejecutar xquery
//xpathtester.com/xquery
public class ConsultasXQueryTest {
	@Test
	public void ejecutarQueryTest() {
		ConsultasXQuery consulta=new ConsultasXQuery();
		try {
			consulta.ejecutar();
		} catch (FileNotFoundException | XQException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
