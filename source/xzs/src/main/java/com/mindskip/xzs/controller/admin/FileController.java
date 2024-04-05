package com.mindskip.xzs.controller.admin;

import com.mindskip.xzs.base.BaseApiController;
import com.mindskip.xzs.base.RestResponse;
import com.mindskip.xzs.domain.FileDomain;
import com.mindskip.xzs.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.ArrayList;
import java.util.List;


@RestController("AdminFileController")
@RequestMapping(value = "/api/admin/file")
public class FileController extends BaseApiController {

    private final FileService fileService;



    @Autowired
    public FileController(FileService fileService) {
        this.fileService = fileService;
    }



    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public RestResponse<List<String>> uploadFile(@RequestParam("file") MultipartFile file, @RequestParam("courseId") Integer courseId) {
        // 处理文件上传逻辑
        if (file.isEmpty()) {
            return RestResponse.fail(500,"上传失败，文件不能为空");
        }

        try {
            // 指定文件上传路径
            String uploadPath = "/Users/youngbull/Desktop/hjs/source/xzs/src/main/resources/files";
            File directory = new File(uploadPath);
            if (!directory.exists()) {
                directory.mkdirs();
            }

            // 保存文件
            String fileName = System.currentTimeMillis() + "_" + getCurrentUser().getId() + "_" + file.getOriginalFilename();
            String filePath = uploadPath + fileName;
            file.transferTo(new File(filePath));

            // 将上传的文件路径返回给客户端
            List<String> fileList = new ArrayList<>();
            fileList.add(filePath);

            //SQL操作
            FileDomain sqlFile = new FileDomain();
            // 设置文件相关属性
            sqlFile.setUserId(getCurrentUser().getId()); // 设置用户ID
            sqlFile.setFileURL(filePath); // 设置文件URL
            sqlFile.setFileName(fileName);//设置文件名
            sqlFile.setStatus(1); // 设置文件状态 1是课件，2是视频
            sqlFile.setCourseId(courseId); // 设置课程ID
            sqlFile.setIsDeleted(0); // 设置是否删除 0没删除，1删除了
            // 调用FileService的上传文件方法
            fileService.fileUpload(sqlFile);


            return RestResponse.ok(fileList);
        } catch (Exception e) {
            e.printStackTrace();
            return RestResponse.fail(500,"上传失败");
        }
    }

    @RequestMapping(value = "/uploadVideo", method = RequestMethod.POST)
    public RestResponse<List<String>> uploadVideo(@RequestParam("file") MultipartFile file, @RequestParam("courseId") Integer courseId) {
        // 处理文件上传逻辑
        if (file.isEmpty()) {
            return RestResponse.fail(500,"上传失败，文件不能为空");
        }

        try {
            // 指定文件上传路径
            String uploadPath = "/Users/youngbull/Desktop/hjs/source/xzs/src/main/resources/files";
            File directory = new File(uploadPath);
            if (!directory.exists()) {
                directory.mkdirs();
            }

            // 保存文件
            String fileName = System.currentTimeMillis() + "_" + getCurrentUser().getId() + "_" + file.getOriginalFilename();
            String filePath = uploadPath + fileName;
            file.transferTo(new File(filePath));

            // 将上传的文件路径返回给客户端
            List<String> fileList = new ArrayList<>();
            fileList.add(filePath);

            //SQL操作
            FileDomain sqlFile = new FileDomain();
            // 设置文件相关属性
            sqlFile.setUserId(getCurrentUser().getId()); // 设置用户ID
            sqlFile.setFileURL(filePath); // 设置文件URL
            sqlFile.setFileName(fileName);//设置文件名
            sqlFile.setStatus(2); // 设置文件状态 1是课件，2是视频
            sqlFile.setCourseId(courseId); // 设置课程ID
            sqlFile.setIsDeleted(0); // 设置是否删除 0没删除，1删除了
            // 调用FileService的上传文件方法
            fileService.fileUpload(sqlFile);


            return RestResponse.ok(fileList);
        } catch (Exception e) {
            e.printStackTrace();
            return RestResponse.fail(500,"上传失败");
        }
    }

    @RequestMapping(value = "/getFiles", method = RequestMethod.POST)
    public RestResponse<List<String>> getFiles(@RequestBody Integer courseId) {
        List<FileDomain> fileList = fileService.getFile(courseId);

        List<String> fileJsonList = new ArrayList<>();
        for (FileDomain file : fileList) {
            fileJsonList.add(file.toJsonString());
        }

        return RestResponse.ok(fileJsonList);
    }


    @RequestMapping(value = "/deleteFile", method = RequestMethod.POST)
    public RestResponse<Object> deleteFile(@RequestBody Integer fileId) {
        try {
            // 根据文件ID获取文件信息
            FileDomain file = fileService.getFileById(fileId);
            if (file == null) {
                return RestResponse.fail(404, "文件不存在");
            }
            if(file.getIsDeleted() == 1) {
                return RestResponse.fail(500, "文件已经删除");
            }

            fileService.setDeleted(file.getId());

            return RestResponse.ok("文件删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            return RestResponse.fail(500,"文件删除失败");
        }
    }

    @RequestMapping(value = "/getVideoLink", method = RequestMethod.POST)
    public RestResponse<List<String>> getVideoLink(@RequestBody Integer courseId) {
        List<FileDomain> files = fileService.getFile(courseId);
        List<String> videoLinks = new ArrayList<>();
        for (FileDomain file : files) {
            if (file.getStatus() == 2) { // Assuming status 2 indicates video files
                videoLinks.add(file.getFileURL());
            }
        }
        return RestResponse.ok(videoLinks);
    }
}
