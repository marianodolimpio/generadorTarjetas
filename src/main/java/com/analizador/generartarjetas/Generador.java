package com.analizador.generartarjetas;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigInteger;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.krysalis.barcode4j.impl.code128.Code128Bean;
import org.krysalis.barcode4j.output.bitmap.BitmapCanvasProvider;
import org.krysalis.barcode4j.tools.UnitConv;

import com.opensymphony.xwork2.ActionSupport;
public class Generador extends ActionSupport  {

 
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	//business logic
	public String execute() {

		HttpServletRequest request = ServletActionContext.getRequest();
		
		StringEncrypter encrypter = new StringEncrypter((String)request.getParameter("clavecodigo"));
		
		String diastarjeta = (String)request.getParameter("diastarjeta");
		
		Date hoy = new Date();
		
		long dias = (long) (hoy.getTime() / 86400000 );
		
		String diasvalor= Long.valueOf(dias).toString();
		
		String valorencriptar  = "";
		
		String recarga = "";
		
		String valorencriptaranterior = "";
		
		if(("030").equals(diastarjeta)){
			valorencriptaranterior = diasvalor.concat("030");
			valorencriptar = diasvalor.concat("1");
			recarga="Recarga de 30 dias.";
		}
		if(("180").equals(diastarjeta)){
			valorencriptaranterior = diasvalor.concat("180");
			valorencriptar = diasvalor.concat("2");
			recarga="Recarga de 180 dias.";
		}
		if(("360").equals(diastarjeta)){
			valorencriptaranterior = diasvalor.concat("360");
			valorencriptar = diasvalor.concat("3");
			recarga="Recarga de 360 dias.";
		}
		
		
		String valorencriptado = encrypter.encrypt(String.valueOf(valorencriptar));
		
		BigInteger encriptadomesanumero = new BigInteger(valorencriptado.getBytes());
		
		String valorencriptadoanterior = encrypter.encrypt(String.valueOf(valorencriptaranterior));
		
		request.setAttribute("textoencriptadoanterior", valorencriptadoanterior);

		// si realiza la recarga manual se debe incoporar el =
		String textoencriptadosinigual = valorencriptado.substring(0, valorencriptado.length()-1);
		
		request.setAttribute("textoencriptado", textoencriptadosinigual);

		
		request.setAttribute("numeroencriptado", "" + encriptadomesanumero);
		
		request.setAttribute("comercio", (String)request.getParameter("comercio"));

		request.setAttribute("textorecarga", recarga);
		
		request.setAttribute("fecha", hoy.toLocaleString());

		
	/*	
		try {
			DefaultConfigurationBuilder builder = new DefaultConfigurationBuilder();
			Configuration cfg = builder.buildFromFile(new File("C:/GeneradorTarjetas/barcode-cfg.xml"));
		
			BarcodeGenerator gen = BarcodeUtil.getInstance().createBarcodeGenerator( cfg );
			
	//		SVGCanvasProvider provider = new SVGCanvasProvider(false, 0);
	//		gen.generateBarcode(provider, recarga);
	//		org.w3c.dom.DocumentFragment frag = provider.getDOMFragment();
			
			OutputStream out = new java.io.FileOutputStream(new File("C:/GeneradorTarjetas/output.png"));
			BitmapCanvasProvider provider = new BitmapCanvasProvider(
			    out, "image/x-png", 300, BufferedImage.TYPE_BYTE_GRAY, true, 0);
			gen.generateBarcode(provider, recarga);
			provider.finish();
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
	
	*/	
		try {
		      
			 
		//	 CodabarBean bean = new CodabarBean();
			
			 
			 Code128Bean bean = new Code128Bean(); 
			 
// anda bien
		      final int dpi = 160;

		      //Configure the barcode generator era 2.8
		      bean.setModuleWidth(UnitConv.in2mm(2.2f / dpi));

		      bean.setFontSize(0);
		      
		      bean.setBarHeight(10);
		      
		      bean.doQuietZone(false);

		      //Open output file
		      File outputFile = new File("../webapps/generadortarjetas-1.0/output.png");
		      
		      FileOutputStream out = new FileOutputStream(outputFile);
		    
		      BitmapCanvasProvider canvas = new BitmapCanvasProvider(
		          out, "image/x-png", dpi, BufferedImage.TYPE_BYTE_BINARY, false, 0);

		      //Generate the barcode
		     // bean.generateBarcode(canvas, "0123456789");
		      System.out.println("recarga  "+encriptadomesanumero);
		      bean.generateBarcode(canvas, "" + encriptadomesanumero);
		      //Signal end of generation
		      canvas.finish();
		    
		      System.out.println("Bar Code is generated successfully");
		    }
		    catch (IOException ex) {
		      ex.printStackTrace();
		    }
		
		
		
//		System.out.println("dias: "+dias);
		
//		String diasvalor= Long.valueOf(dias).toString();
		
//		String diasaux =  diasvalor;
		
//		String mes = diasaux.concat("030");
		
	//	System.out.println("30 dias: "+mes);
		
	//	diasaux = diasvalor;
				
	//	String medioanio = diasaux.concat("180");
		
	//	System.out.println("180 dias: "+medioanio);
				
//		diasaux = diasvalor;
		
	//	String anio = diasaux.concat("360");
		
//		System.out.println("360 dias: "+anio);
		

		
		
		
	//	String mesencriptado = encrypter.encrypt(String.valueOf(mes));

	//	BigInteger encriptadomesanumero = new BigInteger(mesencriptado.getBytes());
		
	//	String encriptadomesatexto = new String(encriptadomesanumero.toByteArray());
				
	//	request.setAttribute("mesencriptado", mesencriptado +" clave: "+String.valueOf(mes) +" a numero "+encriptadomesanumero+" a texto de nuevo " +encriptadomesatexto);

		
		
	//	String medioanioencriptado = encrypter.encrypt(String.valueOf(medioanio));

//		BigInteger medioanioencriptadonumero = new BigInteger(medioanioencriptado.getBytes());
		
	
		// del lado de la aplicacion lo primero que se debe hacer es transformarlo a texto
		// String medioanioencriptadotexto = new String(medioanioencriptadonumero.toByteArray());
		
	//	request.setAttribute("medioanioencriptado", medioanioencriptado +" clave: "+String.valueOf(medioanio) +" a numero "+medioanioencriptadonumero);
		
		
	//	String anioencriptado = encrypter.encrypt(String.valueOf(anio));

		
	//	request.setAttribute("anioencriptado", anioencriptado);
		
	//	request.setAttribute("comercio", (String)request.getParameter("clavecodigo"));
		
		return "SUCCESS";
 
	}
 
}

