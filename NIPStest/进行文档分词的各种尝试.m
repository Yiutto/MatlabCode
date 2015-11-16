%第一种尝试：fsanf函数
%（1）  '%c'
fid=fopen('5222.txt');
text=fscanf(fid,'%c');

%（2）  '%s'
fid=fopen('5222.txt');
text=fscanf(fid,'%s');



%第二种尝试：fgetl函数和fgets函数
%fgetl函数
fid=fopen('5222.txt');
text=[];
while 1
    tline=fgetl(fid);
    if ~ischar(tline)
        break;
    end
    text=[text,tline];
end
fclose(fid);

%fgets函数
fid=fopen('5224.txt');
text=[];
while 1
    tline=fgets(fid);
    if ~ischar(tline)
        break;
    end
    text=[text,tline];
end
fclose(fid);




%第三种尝试离散化处理（将文档中的单词变成cell单元数组）
A=cell(1); 
k=1; 
item=1; 
while text(k)~=' ' 
    A{item}=''; 
    while text(k)~=' ' 
        A{item}=[A{item},text(k)]; 
        k=k+1; 
    end 
    A=[A,A{item}]; 
    if k<length(text) 
        k=k+1; 
    end 
  item=item+1;  
end 


%第四种尝试，利用textread函数
A=textread('5222.txt','%s','delimiter',' '',''.''-''0''1''2''3''4''5''6''7''8''9''['']''('')'':''{''}''@''*''/''+'':'';''=''\n');
A=textread('5222.txt','%([A-Z][a-z])*','whitespace',' ');
A=textread('5222.txt','%s','whitespace',' ','delimiter',',');

A=textread('5222.txt','%s','delimiter',' '',''.''-''0''1''2''3''4''5''6''7''8''9''['']''('')'':''{''}''@''*''/''+'':'';''=''\n');
id = cellfun('length',A);
A(id==0)=[];


%其实这种方法是尝试这么久最好的，可以用正则表达式将单词读出来
fid=fopen('5222.txt');
text=fscanf(fid,'%c');
str='[a-zA-Z]+';
A=regexpi(text,str,'match');

%如何保存文件名，docs_names
A=textread('AllTextNames.txt','%s');
docs_names=A';
save NIPS04~14 docs_names;


%加载数据中的docs_names
load('NIPS04~14.mat')


%如何将docs_names和后缀名合并
fname=strcat(docs_names,'.txt');


%方法1：批处理提取txt文档的words
A=[];
for i=1:2
    text=[];
    fid=fopen(fname{i});
    text=fscanf(fid,'%c');
    A=[A,text];
end
str='[a-zA-Z]+';
words=regexpi(A,str,'match');



%方法2：批处理提取txt文档的words
for i=1:length(fname)
    fid=fopen(fname{i});
    while 1
    tline=fgets(fid);
    if ~ischar(tline)
        break;
    end
    text=[text,tline];
    end
end
str='[a-zA-Z]+';
words=regexpi(text,str,'match');
%要不试试这个看看
str=@"(?i)\b(?!-)[a-z'-]+(?<!-)\b"

%提取历年NIPS文档的Name,Topic,Authors
[c1 c2 c3] = textread('NameTitleAuthors.txt','%s %s %s','delimiter',';');
StrArray=struct('Name',c1,'Title',c2,'Authors',c3);


    






