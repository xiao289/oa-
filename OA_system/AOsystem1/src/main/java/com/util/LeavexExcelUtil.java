package com.util;

import com.bean.Leavex;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import java.io.IOException;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class LeavexExcelUtil {

    //1.创建一个excel对象
    static  HSSFWorkbook excel=new HSSFWorkbook();
    //2.创建一个sheet文件
    static HSSFSheet sheet=excel.createSheet("sheet1");
    //3.创建保存文件头目录的数组
    public static String[] headers=null;
    //4.保存sheet表中的列数
    static int cellcount;
    //5.创建第一行
    public static void createhead(int num){
        cellcount=num;
        HSSFRow row= sheet.createRow(0);
        for (int i = 0; i < cellcount; i++) {
           HSSFCell cell= row.createCell(i);
           cell.setCellValue(headers[i]);
        }
    }
    //6.创建其他行 list保存的是要导出的数据
    public static void createother(List list){
        for (int i = 0; i < list.size(); i++) {
            Leavex leavex = (Leavex) list.get(i);
            HSSFRow row= sheet.createRow(i+1);
            HSSFCell c1= row.createCell(0);
            HSSFCell c2= row.createCell(1);
            HSSFCell c3= row.createCell(2);
            HSSFCell c4= row.createCell(3);
            HSSFCell c5= row.createCell(4);
            HSSFCell c6= row.createCell(5);
            HSSFCell c7= row.createCell(6);

            c1.setCellValue(leavex.getId());


            SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
            String starttime= sf.format(leavex.getStarttime());
            String endtime = sf.format(leavex.getEndtime());

            c2.setCellValue(starttime);
            c3.setCellValue(endtime);
            c4.setCellValue(leavex.getNumber());
            c5.setCellValue(leavex.getDept().getName());
            c6.setCellValue(leavex.getRemark());
            c7.setCellValue(leavex.getState());
        }
    }

    //设置io流和excel的关系
    public static void export(OutputStream outputStream){
        try {
            //1.设置以表格的方式输出
            sheet.setGridsPrinted(true);
            //2.建立io的关系
            excel.write(outputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }





}
