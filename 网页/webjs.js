var index=0;
   var index2=0;
	onload=function(){
        setInterval(ChangeImg,3000);
        setInterval(reset,8000);
        setInterval(ChangeSlo,3000);
        setInterval(resetslo,12000);      
    }

    reset=function(){//重定索引
        index=-1;
    }

    resetslo=function(){//重定索引
        index2=-1;
    }  

    function ChangeImg() {
        index++;
        var a=document.getElementsByClassName("slide");
        for(var i=0;i<a.length;i++){
            a[i].style.display='none';
        }
        a[index].style.display='block';
    }

    function ChangeSlo() {
        index2++;
        var a=document.getElementById("slogan").getElementsByTagName("h3");
        for(var i=0;i<a.length;i++){
            a[i].style.display='none';
        }
        a[index2].style.display='block';
    }

    function mask(){
        var va=document.getElementById("mask");
        var index1=va.selectedIndex;
        var v=va.options[index1].value;
        var value1=document.getElementById("1");
        var value2=document.getElementById("2");
        var value3=document.getElementById("3");
        var value4=document.getElementById("4");
        var value5=document.getElementById("5");        
        switch(v){
        case '1':
            value1.style.display='block';
            value2.style.display='none';
            value3.style.display='none';
            value4.style.display='none';
            value5.style.display='none';
            break;
        case '2':
            value2.style.display='block';
            value1.style.display='none';
            value3.style.display='none';
            value4.style.display='none';
            value5.style.display='none';
            break;
        case '3':
            value3.style.display='block';
            value1.style.display='none';
            value2.style.display='none';
            value4.style.display='none';
            value5.style.display='none';
            break;
        case '4':
            value4.style.display='block';
            value1.style.display='none';
            value3.style.display='none';
            value2.style.display='none';
            value5.style.display='none';
            break;
        case '5':
            value5.style.display='block';
            value1.style.display='none';
            value3.style.display='none';
            value4.style.display='none';
            value2.style.display='none';
            break;
        }

    }
