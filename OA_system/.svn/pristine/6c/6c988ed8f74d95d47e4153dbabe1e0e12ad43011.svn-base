package com.util;

import com.bean.Car;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

public class CarExcelUtil {
    //1.创建一个Excel对象
    static HSSFWorkbook excel = new HSSFWorkbook();
    //2.创建一个sheet子文件
    static HSSFSheet sheet = excel.createSheet("sheet1");
    //3.创建保存文件头目录的数组
    static String[] headers={"车牌号","车型","颜色","备注"};
    //4.保存sheet表中的列数
    static int cellcount=headers.length;
    //5.创建第一行
    public static void creatheader(){
        HSSFRow row = sheet.createRow(0);
        for (int i = 0; i < cellcount; i++) {
            HSSFCell cell = row.createCell(i);
            cell.setCellValue(headers[i]);
        }
    }
    //6.创建其他行list保存的是要导出的数据
    public static void creatother(List list){
        for (int i = 0; i < list.size(); i++) {
            Car car = (Car) list.get(i);
            HSSFRow row =sheet.createRow(i+1);
            HSSFCell c1 = row.createCell(0);
            HSSFCell c2 = row.createCell(1);
            HSSFCell c3 = row.createCell(2);
            HSSFCell c4 = row.createCell(3);


            c1.setCellValue(car.getCarid());
            c2.setCellValue(car.getType());
            c3.setCellValue(car.getColor());
            c4.setCellValue(car.getRemark());

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
