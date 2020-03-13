package pojo;
import java.io.IOException;

import pojo.GetInfo;

public class Test {
	public static void main(String[] args) {
		try {
			String temp="2020-02-01";
			String[] test= {temp,"1","2","ip","test"};
			GetInfo.main(test);
			System.out.print(GetInfo.resultInfo);
		} catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
}
