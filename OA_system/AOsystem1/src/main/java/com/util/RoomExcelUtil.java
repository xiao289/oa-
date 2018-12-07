package com.util;

import com.bean.Room;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

public class RoomExcelUtil {
    //1.创建一个Excel对象
    static HSSFWorkbook excel = new HSSFWorkbook();
    //2.创建一个sheet子文件
    static HSSFSheet sheet = excel.createSheet("sheet1");
    //3.创建保存文件头目录的数组
    public static String[] headers=null;
    //4.保存sheet表中的列数
    public static int cellcount;
    //5.创建第一行
    public static void createhead(int l){
        cellcount=l;
        HSSFRow row = sheet.createRow(0);
        for (int i = 0; i < cellcount; i++) {
            HSSFCell cell = row.createCell(i);
            cell.setCellValue(headers[i]);
        }
    }
    //6.创建其他行list保存的是要导出的数据
    public static void createother(List list){
        for (int i = 0; i < list.size(); i++) {
            Room classes = (Room) list.get(i);
            HSSFRow row =sheet.createRow(i+1);
            HSSFCell c1 = row.createCell(0);
            HSSFCell c2 = row.createCell(1);
            HSSFCell c3 = row.createCell(2);

            c1.setCellValue(classes.getId());
            c2.setCellValue(classes.getName());
            c3.setCellValue(classes.getRemark());

        }
    }

    //设置io流和Excel的关系
    public static void export(OutputStream outputStream){
        //1.设置以表格的方式输出
        sheet.setGridsPrinted(true);
        try {
            //2.建立io的关系
            excel.write(outputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
