package com.mindskip.xzs.controller.student;


import com.github.pagehelper.PageInfo;
import com.mindskip.xzs.base.BaseApiController;
import com.mindskip.xzs.base.RestResponse;
import com.mindskip.xzs.domain.Course;
import com.mindskip.xzs.domain.Subject;
import com.mindskip.xzs.domain.User;
import com.mindskip.xzs.service.CourseService;
import com.mindskip.xzs.service.SubjectService;
import com.mindskip.xzs.utility.PageInfoHelper;
import com.mindskip.xzs.viewmodel.admin.course.CourseEditRequestVM;
import com.mindskip.xzs.viewmodel.admin.course.CoursePageRequestVM;
import com.mindskip.xzs.viewmodel.admin.course.CourseResponseVM;
import com.mindskip.xzs.viewmodel.student.education.SubjectEditRequestVM;
import com.mindskip.xzs.viewmodel.student.education.SubjectVM;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.stream.Collectors;

@RestController("StudentEducationController")
@RequestMapping(value = "/api/student/education")
public class EducationController extends BaseApiController {

    private final SubjectService subjectService;

    private final CourseService courseService;

    @Autowired
    public EducationController(SubjectService subjectService, CourseService courseService) {
        this.subjectService = subjectService;
        this.courseService = courseService;
    }

    @RequestMapping(value = "/subject/list", method = RequestMethod.POST)
    public RestResponse<List<SubjectVM>> list() {
        User user = getCurrentUser();
        List<Subject> subjects = subjectService.getSubjectByLevel(user.getUserLevel());
        List<SubjectVM> subjectVMS = subjects.stream().map(d -> {
            SubjectVM subjectVM = modelMapper.map(d, SubjectVM.class);
            subjectVM.setId(String.valueOf(d.getId()));
            return subjectVM;
        }).collect(Collectors.toList());
        return RestResponse.ok(subjectVMS);
    }

    @RequestMapping(value = "/subject/select/{id}", method = RequestMethod.POST)
    public RestResponse<SubjectEditRequestVM> select(@PathVariable Integer id) {
        Subject subject = subjectService.selectById(id);
        SubjectEditRequestVM vm = modelMapper.map(subject, SubjectEditRequestVM.class);
        return RestResponse.ok(vm);
    }

    @RequestMapping(value = "/course/list", method = RequestMethod.POST)
    public RestResponse<List<Course>> listCourse() {
        List<Course> courses = courseService.allCourse();
        return RestResponse.ok(courses);
    }


    @RequestMapping(value = "/course/page", method = RequestMethod.POST)
    public RestResponse<PageInfo<CourseResponseVM>> pageList(@RequestBody CoursePageRequestVM model) {
        PageInfo<Course> pageInfo = courseService.page(model);
        PageInfo<CourseResponseVM> page = PageInfoHelper.copyMap(pageInfo, e -> {
            CourseResponseVM courseResponseVM = modelMapper.map(e, CourseResponseVM.class);
            // 获取学科名称并设置到 CourseResponseVM 对象中
            Subject subject = subjectService.getSubjectById(e.getSubjectId());
            if (subject != null) {
                courseResponseVM.setSubjectName(subject.getName());
            }
            return courseResponseVM;
        });
        return RestResponse.ok(page);
    }

    @RequestMapping(value = "/course/edit", method = RequestMethod.POST)
    public RestResponse edit(@RequestBody @Valid CourseEditRequestVM model) {
        Course course = modelMapper.map(model, Course.class);
        if (model.getId() == null) {
            course.setDeleted(false);
            courseService.insertByFilter(course);
        } else {
            courseService.updateByIdFilter(course);
        }
        return RestResponse.ok();
    }

    @RequestMapping(value = "/course/select/{id}", method = RequestMethod.POST)
    public RestResponse<CourseEditRequestVM> selectCourse(@PathVariable Integer id) {
        Course course = courseService.selectById(id);
        CourseEditRequestVM vm = modelMapper.map(course, CourseEditRequestVM.class);
        return RestResponse.ok(vm);
    }

    @RequestMapping(value = "/course/delete/{id}", method = RequestMethod.POST)
    public RestResponse deleteCourse(@PathVariable Integer id) {
        Course course = courseService.selectById(id);
        course.setDeleted(true);
        courseService.updateByIdFilter(course);
        return RestResponse.ok();
    }

}
