package br.com.convergencia.emendas.servlet;

import java.awt.image.RenderedImage;
import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/imagem")
public class ImagemServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		
        response.setContentType("image/png");

        String nome = request.getParameter("nome");
 
        InputStream ips= new BufferedInputStream(new FileInputStream(nome));

        RenderedImage image=ImageIO.read(ips);

        OutputStream out = null;
        
        try {
            out = response.getOutputStream();
            ImageIO.write(image, "PNG", out);
            
        } finally {
            if (out != null) {
                out.close();
            }
        }
    }
}
