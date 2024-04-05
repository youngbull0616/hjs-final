package com.mindskip.xzs.service.impl;

import com.mindskip.xzs.domain.FileDomain;
import com.mindskip.xzs.repository.BaseMapper;
import com.mindskip.xzs.repository.FileMapper;
import com.mindskip.xzs.service.FileService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FileServiceImpl extends BaseServiceImpl<FileDomain> implements FileService {

    private final FileMapper fileMapper;

    public FileServiceImpl(BaseMapper<FileDomain> baseMapper, FileMapper fileMapper) {
        super(baseMapper);
        this.fileMapper = fileMapper;
    }

    @Override
    public void fileUpload(FileDomain fileDomain) {
        fileMapper.uploadFile(fileDomain);
    }

    @Override
    public List<FileDomain> getFile(Integer courseId) {
        return fileMapper.getFilesByCourseId(courseId);
    }

    @Override
    public FileDomain getFileById(Integer fileId) {
        return  fileMapper.selectByPrimaryKey(fileId);
    }

    @Override
    public void updateFile(FileDomain fileDomain) {
        fileMapper.updateByPrimaryKey(fileDomain);
    }

    @Override
    public void setDeleted(Integer id) {
        fileMapper.setDeleted(id);
    }
}
