package com.mindskip.xzs.controller.student;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mindskip.xzs.base.BaseApiController;
import com.mindskip.xzs.base.RestResponse;
import com.mindskip.xzs.domain.FileDomain;
import com.mindskip.xzs.service.FileService;
import com.mindskip.xzs.utility.NonStaticResourceHttpRequestHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.http.HttpHeaders;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

@RestController("StudentFileController")
@RequestMapping(value = "/api/student/file")
public class FileController extends BaseApiController {

    private final FileService fileService;



    public static final String URL= "/Users/youngbull/Desktop/hjs/source/xzs/src/main/resources/files";


    @Autowired
    public FileController(FileService fileService, NonStaticResourceHttpRequestHandler nonStaticResourceHttpRequestHandler) {
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
            String uploadPath = URL;
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
            String uploadPath = URL;
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
                videoLinks.add(file.getFileName());
            }
        }
        return RestResponse.ok(videoLinks);
    }

    @PostMapping("/downloadFile")
    public ResponseEntity<byte[]> downloadFile(@RequestBody String fileName) {
        System.out.println(fileName);
        try {
            String filePath = URL + fileName; // 通过文件名确定文件路径
            Path path = Paths.get(filePath);

            // 检查文件是否存在
            if (!Files.exists(path)) {
                return ResponseEntity.notFound().build(); // 文件不存在，返回404 Not Found
            }

            // 通过文件名获取后缀名
            String fileExtension = getFileExtension(path);

            // 根据后缀名确定Content-Type
            String contentType;
            switch (fileExtension.toLowerCase()) {
                case "pdf":
                    contentType = "application/pdf";
                    break;
                case "jpg":
                case "jpeg":
                    contentType = "image/jpeg";
                    break;
                case "png":
                    contentType = "image/png";
                    break;
                case "doc":
                    contentType = "application/msword"; // Word 97-2003 文档
                    break;
                case "docx":
                    contentType = "application/vnd.openxmlformats-officedocument.wordprocessingml.document"; // Office Open XML 格式的 Word 文档
                    break;
                default:
                    contentType = "application/octet-stream"; // 二进制流
                    break;
            }

            // 读取文件内容
            byte[] data = Files.readAllBytes(path);
            System.out.println(path);
            HttpHeaders headers = new HttpHeaders();
            headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + path.getFileName().toString());
            headers.add(HttpHeaders.CONTENT_TYPE, contentType);

            return ResponseEntity.ok()
                    .headers(headers)
                    .body(data);
        } catch (IOException e) {
            // 文件读取失败，返回500 Internal Server Error
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    // 获取文件的后缀名
    private String getFileExtension(Path path) {
        String fileName = path.getFileName().toString();
        int dotIndex = fileName.lastIndexOf(".");
        if (dotIndex != -1 && dotIndex < fileName.length() - 1) {
            return fileName.substring(dotIndex + 1);
        }
        return "";
    }

    @PostMapping("/videos")
    public ResponseEntity<Resource> playVideo(@RequestBody String courseId, HttpServletRequest request) {
        if (courseId.endsWith("=")) {
            // 去除末尾的 "=" 字符
            courseId = courseId.substring(0, courseId.length() - 1);
        }
        List<FileDomain> files = fileService.getFile(Integer.valueOf(courseId));
        List<String> videoLinks = new ArrayList<>();
        for (FileDomain file : files) {
            if (file.getStatus() == 2) { // Assuming status 2 indicates video files
                videoLinks.add(file.getFileName());
            }
        }
        try {
            // 构建视频文件路径
            Path videoPath = Paths.get(URL + videoLinks.get(0));

            // 创建文件系统资源对象
            Resource videoResource = new FileSystemResource(videoPath);

            // 返回视频资源作为响应，并设置响应类型为视频类型
            return ResponseEntity.ok()
                    .contentType(MediaType.valueOf("video/mp4"))
                    .body(videoResource);
        } catch (Exception e) {
            // 处理异常情况
            e.printStackTrace();
            return ResponseEntity.notFound().build();
        }
    }
}
