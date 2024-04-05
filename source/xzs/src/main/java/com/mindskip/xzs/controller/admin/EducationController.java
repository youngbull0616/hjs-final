package com.mindskip.xzs.controller.admin;


import com.mindskip.xzs.base.BaseApiController;
import com.mindskip.xzs.base.RestResponse;
import com.mindskip.xzs.domain.Course;
import com.mindskip.xzs.domain.Subject;
import com.mindskip.xzs.service.CourseService;
import com.mindskip.xzs.service.SubjectService;
import com.mindskip.xzs.utility.PageInfoHelper;
import com.mindskip.xzs.viewmodel.admin.course.CourseEditRequestVM;
import com.mindskip.xzs.viewmodel.admin.course.CoursePageRequestVM;
import com.mindskip.xzs.viewmodel.admin.course.CourseResponseVM;
import com.mindskip.xzs.viewmodel.admin.education.SubjectEditRequestVM;
import com.mindskip.xzs.viewmodel.admin.education.SubjectPageRequestVM;
import com.mindskip.xzs.viewmodel.admin.education.SubjectResponseVM;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController("AdminEducationController")
@RequestMapping(value = "/api/admin/education")
public class EducationController extends BaseApiController {

    private final SubjectService subjectService;

    private final CourseService courseService;

    @Autowired
    public EducationController(SubjectService subjectService,CourseService courseService) {
        this.subjectService = subjectService;
        this.courseService = courseService;
    }

    @RequestMapping(value = "/subject/list", method = RequestMethod.POST)
    public RestResponse<List<Subject>> list() {
        List<Subject> subjects = subjectService.allSubject();
        return RestResponse.ok(subjects);
    }

    @RequestMapping(value = "/subject/page", method = RequestMethod.POST)
    public RestResponse<PageInfo<SubjectResponseVM>> pageList(@RequestBody SubjectPageRequestVM model) {
        PageInfo<Subject> pageInfo = subjectService.page(model);
        PageInfo<SubjectResponseVM> page = PageInfoHelper.copyMap(pageInfo, e -> modelMapper.map(e, SubjectResponseVM.class));
        return RestResponse.ok(page);
    }

    @RequestMapping(value = "/subject/edit", method = RequestMethod.POST)
    public RestResponse edit(@RequestBody @Valid SubjectEditRequestVM model) {
        Subject subject = modelMapper.map(model, Subject.class);
        if (model.getId() == null) {
            subject.setDeleted(false);
            subjectService.insertByFilter(subject);
        } else {
            subjectService.updateByIdFilter(subject);
        }
        return RestResponse.ok();
    }

    @RequestMapping(value = "/subject/select/{id}", method = RequestMethod.POST)
    public RestResponse<SubjectEditRequestVM> select(@PathVariable Integer id) {
        Subject subject = subjectService.selectById(id);
        SubjectEditRequestVM vm = modelMapper.map(subject, SubjectEditRequestVM.class);
        return RestResponse.ok(vm);
    }

    @RequestMapping(value = "/subject/delete/{id}", method = RequestMethod.POST)
    public RestResponse delete(@PathVariable Integer id) {
        Subject subject = subjectService.selectById(id);
        subject.setDeleted(true);
        subjectService.updateByIdFilter(subject);
        return RestResponse.ok();
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
