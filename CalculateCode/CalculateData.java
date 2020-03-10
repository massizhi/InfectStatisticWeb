import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Scanner;

/*版本1.0*/

public class CalculateData {
	static int dailycount=0;//当天变化数据的条数
	static int allcount=0;//累计数据条数
	static line[] all=new line[34];//初始化结果，当天结果
	static line[] result=new line[34];//总的排序后结果，累计结果
    static line[] proresult=new line[34];//筛选省份后的排序后结果
    static String topath="D:\\test.txt";//输出文档路径
    static String frompath="D:\\log\\";//log文件路径
    static int index=0;//控制是否输入日期比日志最早一天还早，若是则值为-2
    static int isChanged=1;//指定日期相比前几天的数据有所变化
    static int timeLimits;//获取累计数据值为1，当天数据值为2
    
    public static void main(String[] args) throws IOException {
		System.out.println("输入查找日期、数据范围、可选省份、数据时间");
		Scanner in=new Scanner(System.in);
        String date=in.next();//输入字符串
        int boundary=Integer.parseInt(in.next());
        String province=in.next();
        timeLimits=in.nextInt();
        in.close();
        CalData dailyData=new CalData(date, boundary, province,timeLimits);        
	}
    
    static class line{//统计之后的病例每条的结构
		String location;//地理位置
		int infected;//感染患者人数
		int suspected;//疑似患者人数
		int cure;//治愈人数
		int dead;//死亡人数
		
		line(String plocation,int pgrhz,int pyshz,int precover,int pdead){
			location=plocation;
			infected=pgrhz;
			suspected=pyshz;
			cure=precover;
			dead=pdead;
		}
		
		line(){}
		
		String printline() {
			return(location+" 感染患者"+infected+"人 疑似患者"+suspected+"人 治愈"+cure+"人 死亡"+dead+"人");
		}
		
		
	}
    
	static public class CalData {//今日或累计的数据统计
		private int infected;
		private int cure;
		private int dead;
		private int suspected;
		private String date;
		private boolean useCountry=true;//获得全国数据
		private boolean useRegion=true;//获得地区数据
		private String province="";
		
		/*boundary的值决定是想要全国数据（boundary=1）还是省份数据,timeLimits的值决定是现今数据（timeLimits=1）还是累计数据*/
		public CalData(String passDate,int boundary,String passPro,int timeLimits) throws IOException {
			date=passDate;
			if (boundary==1) {//全国数据
				useRegion=false;
			}
			else {
				useCountry=false;
				province=passPro;
			}
			if (timeLimits==1) {//当天
				calOneData();
			}
			else {
				calAllData();
			}
		}
		
		public int getInfect() {
			return infected;
		}
		
		public int getCure() {
			return cure;
		}
		
		public int getDead() {
			return dead;
		}
		
		public int getSup() {
			return suspected;
		}
		
		/*现有确诊*/
		public void calOneData() throws IOException {
			int index=findPot(date);//存储指定日期日志索引
			int i=0;//查找省份数据的索引
			int hasData=0;//检验该省份是否有数据
			if (index==-2||isChanged==0) {//比最早的日期还早或该日期内数据无变化
				infected=0;
				suspected=0;
				cure=0;
				dead=0;
			}
			else {
				readLog(index);
				if (useCountry) {
					line allCountry=calAll(all,dailycount);
					infected=allCountry.infected;
					suspected=allCountry.suspected;
					cure=allCountry.cure;
					dead=allCountry.dead;
					
					//System.out.print("sssss");
				}
				else {
					while (i<dailycount) {
						if (all[i].location.equals(province)) {
							infected=all[i].infected;
							suspected=all[i].suspected;
							cure=all[i].cure;
							dead=all[i].dead;
							hasData=1;
							break;
						}
						i++;
					}
					if (hasData==0) {
						infected=0;
						suspected=0;
						cure=0;
						dead=0;
					}
				}
			}
		}
		
		/*累计确诊*/
		public void calAllData() throws IOException {
			int index=findPot(date);//存储指定日期日志索引
			int i=0;//查找省份数据的索引
			int j=0;//控制前几天所有的数据索引
			int hasData=0;//检验该省份是否有数据
			File file = new File(frompath);
			String[] filename = file.list();//获取所有日志文件名     	
			if (index==-2) {//比最早的日期还早
				infected=0;
				suspected=0;
				cure=0;
				dead=0;
			}
			else {
				while (j<=index) {
					FileInputStream fs=new FileInputStream(frompath+filename[j]);
				    InputStreamReader is=new InputStreamReader(fs,"UTF-8");
				    BufferedReader br=new BufferedReader(is);
				    String s="";				    
				    while ((s=br.readLine())!=null){//一行一行读
				    	if (s.length()!=0&&s.charAt(0)=='/'&&s.charAt(1)=='/') {//排除注释掉的内容
				    		continue;
				    	}
				    	else if (s.equals("")) {
				    		continue;
				    	}
				    	else {
				    		String[] sp =s.split(" ");//分隔开的字符串
				    		statistics(sp,result,allcount);
				    	}
		    	    }
				    br.close();
				    j++;
		    	}				
				if (useCountry) {
					line allCountry=calAll(result,allcount);
					infected=allCountry.infected;
					suspected=allCountry.suspected;
					cure=allCountry.cure;
					dead=allCountry.dead;
					System.out.print(cure);
				}
				else {
					while (i<allcount) {
						if (result[i].location.equals(province)) {
							infected=result[i].infected;
							suspected=result[i].suspected;
							cure=result[i].cure;
							dead=result[i].dead;
							hasData=1;
							break;
						}
						i++;
					}
					if (hasData==0) {
						infected=0;
						suspected=0;
						cure=0;
						dead=0;
					}
				}
			}
		}
	}
		
	/*读取指定日期的当天的数据情况*/
	public static void readLog(int index) throws IOException {	
		File file = new File(frompath);
		String[] filename = file.list();//获取所有日志文件名     	
		FileInputStream fs=new FileInputStream(frompath+filename[index]);
	    InputStreamReader is=new InputStreamReader(fs,"UTF-8");
	    BufferedReader br=new BufferedReader(is);
	    String s="";				    
	    while((s=br.readLine())!=null){//一行一行读
	    	if (s.length()!=0&&s.charAt(0)=='/'&&s.charAt(1)=='/') {//排除注释掉的内容
	    		continue;
	    	}
	    	else if (s.equals("")) {//跳过空行
	    		continue;
	    	}
	    	else {
	    		String[] sp =s.split(" ");//分隔开的字符串
	    		statistics(sp,all,dailycount);
	    	}
	    }
	    br.close();
	    //printtxt(all);
	}
	
	/*计算全国疫情情况*/
	static line calAll(line[] all,int num) {
    	int sumg=0;//全国感染患者总数
        int sumy=0;//全国疑似患者总数
        int sumd=0;//全国死亡人数
        int sumr=0;//全国治愈人数
        for(int i=0;i<num;i++) {
        	sumg+=all[i].infected;
        	sumy+=all[i].suspected;
        	sumd+=all[i].dead;
        	sumr+=all[i].cure;
        }
        return new line("全国",sumg,sumy,sumr,sumd);
    }
	
	/*统计函数，归类同省份信息*/
	static void statistics(String[] sp,line[] all,int count) {   	
    	//System.out.println("111");
    	String location="";    	
    	location=sp[0];
    	line line1;
    	if (!isExistlocation(location,all,count)) {//不存在对应该省的记录
    		line1=new line(location,0,0,0,0);//新建数据条   		
    		all[count]=line1;
    		count++;
    	}
    	else {
    		line1=getLine(location,all,count);//获得原有的数据条
    	}
    	if (sp[1].equals("新增")) {
    		if (sp[2].equals("感染患者")) {//获得感染人数
    			line1.infected+=Integer.valueOf(sp[3].substring(0,sp[3].length()-1));
    			
    		}
    		else {//疑似患者
    			line1.suspected+=Integer.valueOf(sp[3].substring(0,sp[3].length()-1));
    		}
    	}
    	else if (sp[1].equals("死亡")) {
    		line1.dead+=Integer.valueOf(sp[2].substring(0,sp[2].length()-1));
    		line1.infected-=Integer.valueOf(sp[2].substring(0,sp[2].length()-1));
    	}
    	else if (sp[1].equals("治愈")) {
    		line1.cure+=Integer.valueOf(sp[2].substring(0,sp[2].length()-1));
    		line1.infected-=Integer.valueOf(sp[2].substring(0,sp[2].length()-1));
    	}
    	else if (sp[1].equals("疑似患者")) {
    		if (sp[2].equals("确诊感染")){
    			int change=Integer.valueOf(sp[3].substring(0,sp[3].length()-1));//改变人数
    			line1.infected+=change;
    			line1.suspected-=change; 			
    		}
    		else {//流入情况
    			String tolocation=sp[3];//流入省
    			int change=Integer.valueOf(sp[4].substring(0,sp[4].length()-1));//改变人数
    			line line2;
    	    	if (!isExistlocation(tolocation,all,count)) {//不存在对应该省的记录
    	    		line2=new line(tolocation,0,0,0,0);//新建数据条
    	    		all[count]=line2;
    	    		count++;
    	    	}
    	    	else {
    	    		line2=getLine(tolocation,all,count);//获得原有的数据条
    	    	}
    			line1.suspected-=change;
    			line2.suspected+=change;
    		}
    	}
    	else if (sp[1].equals("排除")) {
    		line1.suspected-=Integer.valueOf(sp[3].substring(0,sp[3].length()-1));   		
    	}
    	else {//感染患者流入情况
    		String tolocation=sp[3];//流入省
    		//System.out.print(sp[0]);
			int change=Integer.valueOf(sp[4].substring(0,sp[4].length()-1));//改变人数
			line line2;
	    	if(!isExistlocation(tolocation,all,count)) {//不存在对应该省的记录
	    		line2=new line(tolocation,0,0,0,0);//新建数据条
	    		all[count]=line2;
	    		count++;
	    	}
	    	else {
	    		line2=getLine(tolocation,all,count);//获得原有的数据条
	    	}
			line1.infected-=change;
			line2.infected+=change;   		
    	}
    	if (timeLimits==1) {//当天
    		dailycount=count;
    	}
    	else {
			allcount=count;
		}
    }
	
	static boolean isBefore(String date1,String date2) {
    	if (date1.compareTo(date2)>=0) {
    		return false;
    	}
    	else {
    		return true;
    	}
    }
	
	/*找出指定地址是否已经存在记录*/
	static boolean isExistlocation(String location,line[] all,int count) {
    	for(int i=0;i<count;i++) {
    		if (location.equals(all[i].location)) {
    			return true;
    		}
    	}
    	return false;    	
    }
	
	/*找出指定地址的记录*/
	static line getLine(String location,line[] all,int count) {
    	for(int i=0;i<count;i++) {
    		if (location.equals(all[i].location)) {
    			return all[i];
    		}
    	}
    	return null;//不会用到
    }
	
	static int findPot(String date) {
    	File file = new File(frompath);
        String[] filename = file.list();//获取所有日志文件名      
        int mid=-1;//中间存储变量，暂存返回值
        if (isBefore(date,filename[0].substring(0,10))) {//输入日期比日志最早还早
        	return -2;
        }
    	for(int i=0;i<filename.length-1;i++) {
    		String datecut1=filename[i].substring(0,10);//只获取文件名前的日期
    		String datecut2=filename[i+1].substring(0,10);//前后两个日期
    		if (date.equals(datecut1)) {   	   			
    			mid=i;
    			return mid;
    		}
    		else if (date.equals(datecut2)) {
    			mid=i+1;
    			return mid;
    		}
    		else if (isBefore(datecut1,date)&&isBefore(date,datecut2)) {//所给日期在两天有记录的日志之间
    			mid=i;
    			isChanged=0;//标记是否有变化
    			return mid;
    		}   		
    	}    	
    	return -1;   	
    }
}
