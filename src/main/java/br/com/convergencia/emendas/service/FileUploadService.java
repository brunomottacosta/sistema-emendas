package br.com.convergencia.emendas.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
@Transactional
public class FileUploadService {
	
	private static final Logger logger = LoggerFactory.getLogger(FileUploadService.class);
	
	public String uploadFileHandler(MultipartFile file, String nome, Long sequencia) {

		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();

				// Cria o diretório para colocar os arquivos
				String rootPath = System.getProperty("catalina.home");
				File dir = new File(rootPath + File.separator + "UPLOAD");
				if (!dir.exists()) {
					dir.mkdirs();
				}				
				
				// Cria o arquivo
				File serverFile = new File(dir.getAbsolutePath() + File.separator + nome + "_" + sequencia + ".jpg");
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				logger.info("Server File Location="	+ serverFile.getAbsolutePath());

				return serverFile.getPath();
				
			} catch (Exception e) {
				return "You failed to upload " + file.getOriginalFilename() + " => " + e.getMessage();
			}
			
		} else {
			return "You failed to upload " + file.getOriginalFilename() + " because the file was empty.";
		}
	}
}
