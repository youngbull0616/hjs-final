package com.mindskip.xzs.repository;

import com.mindskip.xzs.domain.Course;
import com.mindskip.xzs.viewmodel.admin.course.CoursePageRequestVM;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CourseMapper extends BaseMapper<Course> {

    List<Course> getCourseByLevel(Integer level);

    List<Course> allCourse();

    List<Course> page(CoursePageRequestVM requestVM);
}
