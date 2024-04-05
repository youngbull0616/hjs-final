package com.mindskip.xzs.repository;

import com.mindskip.xzs.domain.FileDomain;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FileMapper extends BaseMapper<FileDomain> {

    void uploadFile(FileDomain fileDomain);

    List<FileDomain> getFilesByCourseId(Integer courseId);

    void setDeleted(Integer id);
}
