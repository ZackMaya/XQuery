package mx.edu.uacm.consultas;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

import javax.xml.xquery.XQConnection;
import javax.xml.xquery.XQDataSource;
import javax.xml.xquery.XQException;
import javax.xml.xquery.XQPreparedExpression;
import javax.xml.xquery.XQResultSequence;

import net.sf.saxon.xqj.SaxonXQDataSource;

public class ConsultasXQuery {
	public void ejecutar() throws FileNotFoundException, XQException {
		String directorioActual = System.getProperty("user.dir");
		//para que no hay conflictos en rutas debidop al sistema / \
		String ruta = directorioActual + File.separator;
		InputStream inputStream= new FileInputStream(new File(ruta+"tarea2.xqy"));
		//interface
		XQDataSource ds = new SaxonXQDataSource();
		XQConnection  conn= ds.getConnection();
		XQPreparedExpression exp= conn.prepareExpression(inputStream);
		XQResultSequence result= exp.executeQuery();
		while(result.next()) {
			System.out.println(result.getItemAsString(null));
			
		}
		
	}
}
