package com.mindskip.xzs.service;

import com.mindskip.xzs.domain.FileDomain;

import java.util.List;


public interface FileService extends BaseService<FileDomain>{

    void fileUpload(FileDomain fileDomain);

    List<FileDomain> getFile(Integer courseId);

    FileDomain getFileById(Integer fileId);

    void updateFile(FileDomain fileDomain);

    void setDeleted(Integer id);
}
