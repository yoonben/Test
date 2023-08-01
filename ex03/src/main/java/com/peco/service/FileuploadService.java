package com.peco.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.peco.vo.FileuploadVO;

@Service
public interface FileuploadService {
	
	int insert(FileuploadVO vo);

	int fileupload(List<MultipartFile> files, String m_id) throws Exception;
}
