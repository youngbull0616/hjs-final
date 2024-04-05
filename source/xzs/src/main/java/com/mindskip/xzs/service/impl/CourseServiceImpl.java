package com.mindskip.xzs.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mindskip.xzs.domain.Course;
import com.mindskip.xzs.repository.CourseMapper;
import com.mindskip.xzs.service.CourseService;
import com.mindskip.xzs.viewmodel.admin.course.CoursePageRequestVM;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseServiceImpl extends BaseServiceImpl<Course> implements CourseService {

    private final CourseMapper courseMapper;

    @Autowired
    public CourseServiceImpl(CourseMapper courseMapper) {
        super(courseMapper);
        this.courseMapper = courseMapper;
    }

    @Override
    public Course selectById(Integer id) {
        return super.selectById(id);
    }

    @Override
    public int updateByIdFilter(Course record) {
        return super.updateByIdFilter(record);
    }

    @Override
    public List<Course> getCourseByLevel(Integer level) {
        return courseMapper.getCourseByLevel(level);
    }

    @Override
    public List<Course> allCourse() {
        return courseMapper.allCourse();
    }

    @Override
    public Integer levelByCourseId(Integer id) {
        return this.selectById(id).getLevel();
    }

    @Override
    public PageInfo<Course> page(CoursePageRequestVM requestVM) {
        return PageHelper.startPage(requestVM.getPageIndex(), requestVM.getPageSize(), "id desc").doSelectPageInfo(() ->
                courseMapper.page(requestVM)
        );
    }

}
