package com.example.demo6.util;

import com.example.demo6.DAO.hotelDAO;
import com.example.demo6.bean.hotelVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

public class FileUpload {

    public hotelVO uploadPhoto(HttpServletRequest request){
        String filename ="";
        int sizeLimit = 15 * 1024 * 1024;

        String realPath = request.getServletContext().getRealPath("upload");

        File dir = new File(realPath);
        if (!dir.exists()) dir.mkdirs();

        hotelVO one = null;
        MultipartRequest multipartRequest = null;
        try {
            multipartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());

            filename = multipartRequest.getFilesystemName("photo");

            one = new hotelVO();
            String Id = multipartRequest.getParameter("Id");
            if (Id!=null&&!Id.equals(""))
                one.setId(Integer.parseInt(Id));
                one.setName(multipartRequest.getParameter("Name"));
                one.setPhone(multipartRequest.getParameter("Phone"));
                one.setRoomNum(multipartRequest.getParameter("RoomNum"));
                one.setGuests(multipartRequest.getParameter("Guests"));
                one.setCheckIn(multipartRequest.getParameter("CheckIn"));
                one.setCheckOut(multipartRequest.getParameter("CheckOut"));
                one.setPayment(multipartRequest.getParameter("Payment"));
            if (Id!=null&&!Id.equals("")) {
                hotelDAO dao = new hotelDAO();
                String oldfilename = dao.getPhotoFilename(Integer.parseInt(Id));
                if(filename!=null && oldfilename!=null)
                    FileUpload.deleteFile(request, oldfilename);
                else if(filename==null && oldfilename!=null)
                    filename = oldfilename;
            }
            one.setPhoto(filename);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return one;
    }
    public static void deleteFile(HttpServletRequest request, String filename){
        String filePath = request.getServletContext().getRealPath("upload");

        File f = new File(filePath + "/" + filename);
        if(f.exists()) f.delete();
    }
}
