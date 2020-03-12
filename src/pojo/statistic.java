package pojo;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Scanner;

public class statistic {
	static int dailycount=0;//�������б仯���ݵ�����
	static int nowcount=0;//������������
	static int allcount=0;//�ۼ���������
	static int changecount=0;//�ۼƱ仯���ݵ�����
	static line[] all=new line[34];//��ʼ�����������仯���
	static line[] result=new line[34];//�ܵ����������������
	static line[] allResult=new line[34];//�ܵ�����������ۼƽ��
	static line[] changeResult=new line[34];//�ۼƱ仯���
    static String topath="D:\\test.txt";//����ĵ�·��
    static String frompath="D:\\log\\";//log�ļ�·��
    static int index=0;//�����Ƿ��������ڱ���־����һ�컹�磬������ֵΪ-2
    static int isChanged=1;//ָ���������ǰ��������������仯
    static int timeLimits;//��ȡ�ۼ�����ֵΪ1����������ֵΪ2
    
    public static void main(String[] args) {
		System.out.print("����������ڡ����ݷ�Χ(ȫ����������1��ʡ����������2)��ʡ��������ǰһ��ѡ��2�������룩��");
		System.out.println("�������ͣ��ִ�仯������1����������2���ۼ�����3���ۼƱ仯������4������Ⱦ��Ϣ��ip,sp,cure,dead��");
		Scanner in=new Scanner(System.in);
		String province="";
        String date=in.next();//�����ַ���
        int boundary=Integer.parseInt(in.next());
        if(boundary==2) {
        	province=in.next();
        }
        timeLimits=in.nextInt();
        String type=in.next();//�����Ҫ�ĸ�Ⱦ����
		try {
			CalData dailyData;
			dailyData = new CalData(date, boundary, province,timeLimits);
			getData(type,dailyData);
	        in.close();  
		} catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}          
	}
    
    static void getData(String type,CalData data) {
    	switch (type) {
		case "ip":
			System.out.println(data.getInfect());
			break;
		case "sp":
			System.out.println(data.getSup());
			break;
		case "cure":
			System.out.println(data.getCure());
			break;
		case "dead":
			System.out.println(data.getDead());
			break;
		default:
			System.out.println("��Ⱦ������������");
			break;
		}
    }
    
    static class line{//ͳ��֮��Ĳ���ÿ���Ľṹ
		String location;//����λ��
		int infected;//��Ⱦ��������
		int suspected;//���ƻ�������
		int cure;//��������
		int dead;//��������
		
		line(String plocation,int pgrhz,int pyshz,int precover,int pdead){
			location=plocation;
			infected=pgrhz;
			suspected=pyshz;
			cure=precover;
			dead=pdead;
		}
		
		line(){}
		
		String printline() {
			return(location+" ��Ⱦ����"+infected+"�� ���ƻ���"+suspected+"�� ����"+cure+"�� ����"+dead+"��");
		}		
	}
    
	static public class CalData {//���ջ��ۼƵ�����ͳ��
		private int infected;
		private int cure;
		private int dead;
		private int suspected;
		private String date;
		private boolean useCountry=true;//���ȫ������
		private boolean useRegion=true;//��õ�������
		private String province="";
		
		/*boundary��ֵ��������Ҫȫ�����ݣ�boundary=1������ʡ������,timeLimits��ֵ�����ǵ������б仯���ݣ�timeLimits=1��������������*/
		public CalData(String passDate,int boundary,String passPro,int timeLimits) throws IOException {
			date=passDate;
			if (boundary==1) {//ȫ������
				useRegion=false;
			}
			else {
				useCountry=false;
				province=passPro;
			}
			if (timeLimits==1) {//���б仯��
				calOneData();
			}
			else if (timeLimits==2) {//������
				calNowData();
			}
			else if (timeLimits==3){//�ۼ���
				calAllData();
			}
			else {
				calSumData();//�ۼƱ仯��
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
		
		/*���б仯��ȷ��*/
		public void calOneData() throws IOException {
			int index=findPot(date);//�洢ָ��������־����
			int i=0;//����ʡ�����ݵ�����
			int hasData=0;//�����ʡ���Ƿ�������
			if (index==-2||isChanged==0) {//����������ڻ����������������ޱ仯
				infected=0;
				suspected=0;
				cure=0;
				dead=0;
				isChanged=1;//��ԭ
			}
			else {
				readLog(index);
				if (useCountry) {//����ȫ������
					line allCountry=calAll(all,dailycount);
					infected=allCountry.infected;
					suspected=allCountry.suspected;
					cure=allCountry.cure;
					dead=allCountry.dead;
					//System.out.print("sssss");
				}
				else {//����ĳʡ������
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
						hasData=1;//��ԭ
					}
				}
			}
		}
		
		/*�ۼƱ仯��ȷ��*/
		public void calSumData() throws IOException {
			int index=findPot(date);//�洢ָ��������־����
			int i=0;//����ʡ�����ݵ�����
			int hasData=0;//�����ʡ���Ƿ�������
			if (index==-2||isChanged==0) {//����������ڻ����������������ޱ仯
				infected=0;
				suspected=0;
				cure=0;
				dead=0;
				isChanged=1;//��ԭ
			}
			else {
				readLog(index);
				if (useCountry) {//����ȫ������
					line allCountry=calAll(changeResult,changecount);
					//System.out.print(changecount);
					infected=allCountry.infected;
					suspected=allCountry.suspected;
					cure=allCountry.cure;
					dead=allCountry.dead;
				}
				else {//����ĳʡ������
					while (i<changecount) {
						if (changeResult[i].location.equals(province)) {
							infected=changeResult[i].infected;
							suspected=changeResult[i].suspected;
							cure=changeResult[i].cure;
							dead=changeResult[i].dead;
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
						hasData=1;//��ԭ
					}
				}
			}
		}
		
		/*����ȷ��*/
		public void calNowData() throws IOException {
			int index=findPot(date);//�洢ָ��������־����
			int i=0;//����ʡ�����ݵ�����
			int j=0;//����ǰ�������е���������
			int hasData=0;//�����ʡ���Ƿ�������
			File file = new File(frompath);
			String[] filename = file.list();//��ȡ������־�ļ���     	
			if (index==-2) {//����������ڻ���
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
				    while ((s=br.readLine())!=null){//һ��һ�ж�
				    	if (s.length()!=0&&s.charAt(0)=='/'&&s.charAt(1)=='/') {//�ų�ע�͵�������
				    		continue;
				    	}
				    	else if (s.equals("")) {
				    		continue;
				    	}
				    	else {
				    		String[] sp =s.split(" ");//�ָ������ַ���
				    		statistics(sp,result,nowcount);
				    	}
		    	    }
				    br.close();
				    j++;
		    	}				
				if (useCountry) {
					line allCountry=calAll(result,nowcount);
					infected=allCountry.infected;
					suspected=allCountry.suspected;
					cure=allCountry.cure;
					dead=allCountry.dead;
				}
				else {
					while (i<nowcount) {
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
		
		/*�ۼ�ȷ��*/
		public void calAllData() throws IOException {
			int index=findPot(date);//�洢ָ��������־����
			int i=0;//����ʡ�����ݵ�����
			int j=0;//����ǰ�������е���������
			int hasData=0;//�����ʡ���Ƿ�������
			File file = new File(frompath);
			String[] filename = file.list();//��ȡ������־�ļ���     	
			if (index==-2) {//����������ڻ���
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
				    while ((s=br.readLine())!=null){//һ��һ�ж�
				    	if (s.length()!=0&&s.charAt(0)=='/'&&s.charAt(1)=='/') {//�ų�ע�͵�������
				    		continue;
				    	}
				    	else if (s.equals("")) {
				    		continue;
				    	}
				    	else {
				    		String[] sp =s.split(" ");//�ָ������ַ���
				    		allStatistics(sp,allResult,allcount);
				    	}
		    	    }
				    br.close();
				    j++;
		    	}				
				if (useCountry) {
					line allCountry=calAll(allResult,allcount);
					infected=allCountry.infected;
					suspected=allCountry.suspected;
					cure=allCountry.cure;
					dead=allCountry.dead;
				}
				else {
					while (i<allcount) {
						if (allResult[i].location.equals(province)) {
							infected=allResult[i].infected;
							suspected=allResult[i].suspected;
							cure=allResult[i].cure;
							dead=allResult[i].dead;
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
	
	/*�����ۼ����*/
	static void allStatistics(String[] sp,line[] all,int count) {   	
    	String location="";    	
    	location=sp[0];
    	line line1;
    	if (!isExistlocation(location,all,count)) {//�����ڶ�Ӧ��ʡ�ļ�¼
    		line1=new line(location,0,0,0,0);//�½�������   		
    		all[count]=line1;
    		count++;
    	}
    	else {
    		line1=getLine(location,all,count);//���ԭ�е�������
    	}
    	if (sp[1].equals("����")) {
    		if (sp[2].equals("��Ⱦ����")) {//��ø�Ⱦ����
    			line1.infected+=Integer.valueOf(sp[3].substring(0,sp[3].length()-1));    			
    		}
    		else {//���ƻ���
    			line1.suspected+=Integer.valueOf(sp[3].substring(0,sp[3].length()-1));
    		}
    	}
    	else if (sp[1].equals("����")) {
    		line1.dead+=Integer.valueOf(sp[2].substring(0,sp[2].length()-1));
    	}
    	else if (sp[1].equals("����")) {
    		line1.cure+=Integer.valueOf(sp[2].substring(0,sp[2].length()-1));
    	}
    	else if (sp[1].equals("���ƻ���")) {
    		if (sp[2].equals("ȷ���Ⱦ")){
    			int change=Integer.valueOf(sp[3].substring(0,sp[3].length()-1));//�ı�����
    			line1.infected+=change;
    			line1.suspected-=change; 			
    		}
    		else {//�������
    			String tolocation=sp[3];//����ʡ
    			int change=Integer.valueOf(sp[4].substring(0,sp[4].length()-1));//�ı�����
    			line line2;
    	    	if (!isExistlocation(tolocation,all,count)) {//�����ڶ�Ӧ��ʡ�ļ�¼
    	    		line2=new line(tolocation,0,0,0,0);//�½�������
    	    		all[count]=line2;
    	    		count++;
    	    	}
    	    	else {
    	    		line2=getLine(tolocation,all,count);//���ԭ�е�������
    	    	}
    			line1.suspected-=change;
    			line2.suspected+=change;
    		}
    	}
    	else if (sp[1].equals("�ų�")) {
    		line1.suspected-=Integer.valueOf(sp[3].substring(0,sp[3].length()-1));   		
    	}
    	else {//��Ⱦ�����������
    		String tolocation=sp[3];//����ʡ
    		//System.out.print(sp[0]);
			int change=Integer.valueOf(sp[4].substring(0,sp[4].length()-1));//�ı�����
			line line2;
	    	if(!isExistlocation(tolocation,all,count)) {//�����ڶ�Ӧ��ʡ�ļ�¼
	    		line2=new line(tolocation,0,0,0,0);//�½�������
	    		all[count]=line2;
	    		count++;
	    	}
	    	else {
	    		line2=getLine(tolocation,all,count);//���ԭ�е�������
	    	}
			line2.infected+=change;   		
    	}
		allcount=count;
		changecount=count;
    }
	
	/*��ȡָ�����ڵĵ�������ݱ仯���*/
	public static void readLog(int index) throws IOException {	
		File file = new File(frompath);
		String[] filename = file.list();//��ȡ������־�ļ���     	
		FileInputStream fs=new FileInputStream(frompath+filename[index]);
	    InputStreamReader is=new InputStreamReader(fs,"UTF-8");
	    BufferedReader br=new BufferedReader(is);
	    String s="";				    
	    while((s=br.readLine())!=null){//һ��һ�ж�
	    	if (s.length()!=0&&s.charAt(0)=='/'&&s.charAt(1)=='/') {//�ų�ע�͵�������
	    		continue;
	    	}
	    	else if (s.equals("")) {//��������
	    		continue;
	    	}
	    	else {
	    		String[] sp =s.split(" ");//�ָ������ַ���
	    		if (timeLimits==4) {//�ۼƱ仯��
	    			allStatistics(sp,changeResult,changecount);
	    		}
	    		else {//����仯��
	    			statistics(sp,all,dailycount);
	    		}	    		
	    	}
	    }
	    br.close();
	}
	
	/*����ȫ���������*/
	static line calAll(line[] all,int num) {
    	int sumg=0;//ȫ����Ⱦ��������
        int sumy=0;//ȫ�����ƻ�������
        int sumd=0;//ȫ����������
        int sumr=0;//ȫ����������
        for(int i=0;i<num;i++) {
        	sumg+=all[i].infected;
        	sumy+=all[i].suspected;
        	sumd+=all[i].dead;
        	sumr+=all[i].cure;
        }
        return new line("ȫ��",sumg,sumy,sumr,sumd);
    }
	
	/*ͳ�ƺ���������ͬʡ����Ϣ*/
	static void statistics(String[] sp,line[] all,int count) {   	
    	//System.out.println("111");
    	String location="";    	
    	location=sp[0];
    	line line1;
    	if (!isExistlocation(location,all,count)) {//�����ڶ�Ӧ��ʡ�ļ�¼
    		line1=new line(location,0,0,0,0);//�½�������   		
    		all[count]=line1;
    		count++;
    	}
    	else {
    		line1=getLine(location,all,count);//���ԭ�е�������
    	}
    	if (sp[1].equals("����")) {
    		if (sp[2].equals("��Ⱦ����")) {//��ø�Ⱦ����
    			line1.infected+=Integer.valueOf(sp[3].substring(0,sp[3].length()-1));
    			
    		}
    		else {//���ƻ���
    			line1.suspected+=Integer.valueOf(sp[3].substring(0,sp[3].length()-1));
    		}
    	}
    	else if (sp[1].equals("����")) {
    		line1.dead+=Integer.valueOf(sp[2].substring(0,sp[2].length()-1));
    		line1.infected-=Integer.valueOf(sp[2].substring(0,sp[2].length()-1));
    	}
    	else if (sp[1].equals("����")) {
    		line1.cure+=Integer.valueOf(sp[2].substring(0,sp[2].length()-1));
    		line1.infected-=Integer.valueOf(sp[2].substring(0,sp[2].length()-1));
    	}
    	else if (sp[1].equals("���ƻ���")) {
    		if (sp[2].equals("ȷ���Ⱦ")){
    			int change=Integer.valueOf(sp[3].substring(0,sp[3].length()-1));//�ı�����
    			line1.infected+=change;
    			line1.suspected-=change; 			
    		}
    		else {//�������
    			String tolocation=sp[3];//����ʡ
    			int change=Integer.valueOf(sp[4].substring(0,sp[4].length()-1));//�ı�����
    			line line2;
    	    	if (!isExistlocation(tolocation,all,count)) {//�����ڶ�Ӧ��ʡ�ļ�¼
    	    		line2=new line(tolocation,0,0,0,0);//�½�������
    	    		all[count]=line2;
    	    		count++;
    	    	}
    	    	else {
    	    		line2=getLine(tolocation,all,count);//���ԭ�е�������
    	    	}
    			line1.suspected-=change;
    			line2.suspected+=change;
    		}
    	}
    	else if (sp[1].equals("�ų�")) {
    		line1.suspected-=Integer.valueOf(sp[3].substring(0,sp[3].length()-1));   		
    	}
    	else {//��Ⱦ�����������
    		String tolocation=sp[3];//����ʡ
    		//System.out.print(sp[0]);
			int change=Integer.valueOf(sp[4].substring(0,sp[4].length()-1));//�ı�����
			line line2;
	    	if(!isExistlocation(tolocation,all,count)) {//�����ڶ�Ӧ��ʡ�ļ�¼
	    		line2=new line(tolocation,0,0,0,0);//�½�������
	    		all[count]=line2;
	    		count++;
	    	}
	    	else {
	    		line2=getLine(tolocation,all,count);//���ԭ�е�������
	    	}
			line1.infected-=change;
			line2.infected+=change;   		
    	}
    	if (timeLimits==1) {//����
    		dailycount=count;
    	}
    	else {
			nowcount=count;
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
	
	/*�ҳ�ָ����ַ�Ƿ��Ѿ����ڼ�¼*/
	static boolean isExistlocation(String location,line[] all,int count) {
    	for(int i=0;i<count;i++) {
    		if (location.equals(all[i].location)) {
    			return true;
    		}
    	}
    	return false;    	
    }
	
	/*�ҳ�ָ����ַ�ļ�¼*/
	static line getLine(String location,line[] all,int count) {
    	for(int i=0;i<count;i++) {
    		if (location.equals(all[i].location)) {
    			return all[i];
    		}
    	}
    	return null;//�����õ�
    }
	
	/*�ҳ���������������־������*/
	static int findPot(String date) {
    	File file = new File(frompath);
        String[] filename = file.list();//��ȡ������־�ļ���      
        int mid=-1;//�м�洢�������ݴ淵��ֵ
        if (isBefore(date,filename[0].substring(0,10))) {//�������ڱ���־���绹��
        	return -2;
        }
    	for(int i=0;i<filename.length-1;i++) {
    		String datecut1=filename[i].substring(0,10);//ֻ��ȡ�ļ���ǰ������
    		String datecut2=filename[i+1].substring(0,10);//ǰ����������
    		if (date.equals(datecut1)) {   	   			
    			mid=i;
    			return mid;
    		}
    		else if (date.equals(datecut2)) {
    			mid=i+1;
    			return mid;
    		}
    		else if (isBefore(datecut1,date)&&isBefore(date,datecut2)) {//���������������м�¼����־֮��
    			mid=i;
    			isChanged=0;//����Ƿ��б仯
    			return mid;
    		}   		
    	}    	
    	return -1;   	
    }
}
