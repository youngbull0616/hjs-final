package com.mindskip.xzs.service;

import com.github.pagehelper.PageInfo;
import com.mindskip.xzs.domain.Course;
import com.mindskip.xzs.viewmodel.admin.course.CoursePageRequestVM;

import java.util.List;

public interface CourseService extends BaseService<Course> {

    List<Course> getCourseByLevel(Integer level);

    List<Course> allCourse();

    Integer levelByCourseId(Integer id);

    PageInfo<Course> page(CoursePageRequestVM requestVM);
}
