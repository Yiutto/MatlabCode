%��һ�ֳ��ԣ�fsanf����
%��1��  '%c'
fid=fopen('5222.txt');
text=fscanf(fid,'%c');

%��2��  '%s'
fid=fopen('5222.txt');
text=fscanf(fid,'%s');



%�ڶ��ֳ��ԣ�fgetl������fgets����
%fgetl����
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

%fgets����
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




%�����ֳ�����ɢ���������ĵ��еĵ��ʱ��cell��Ԫ���飩
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


%�����ֳ��ԣ�����textread����
A=textread('5222.txt','%s','delimiter',' '',''.''-''0''1''2''3''4''5''6''7''8''9''['']''('')'':''{''}''@''*''/''+'':'';''=''\n');
A=textread('5222.txt','%([A-Z][a-z])*','whitespace',' ');
A=textread('5222.txt','%s','whitespace',' ','delimiter',',');

A=textread('5222.txt','%s','delimiter',' '',''.''-''0''1''2''3''4''5''6''7''8''9''['']''('')'':''{''}''@''*''/''+'':'';''=''\n');
id = cellfun('length',A);
A(id==0)=[];


%��ʵ���ַ����ǳ�����ô����õģ�������������ʽ�����ʶ�����
fid=fopen('5222.txt');
text=fscanf(fid,'%c');
str='[a-zA-Z]+';
A=regexpi(text,str,'match');

%��α����ļ�����docs_names
A=textread('AllTextNames.txt','%s');
docs_names=A';
save NIPS04~14 docs_names;


%���������е�docs_names
load('NIPS04~14.mat')


%��ν�docs_names�ͺ�׺���ϲ�
fname=strcat(docs_names,'.txt');


%����1����������ȡtxt�ĵ���words
A=[];
for i=1:2
    text=[];
    fid=fopen(fname{i});
    text=fscanf(fid,'%c');
    A=[A,text];
end
str='[a-zA-Z]+';
words=regexpi(A,str,'match');



%����2����������ȡtxt�ĵ���words
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
%Ҫ�������������
str=@"(?i)\b(?!-)[a-z'-]+(?<!-)\b"

%��ȡ����NIPS�ĵ���Name,Topic,Authors
[c1 c2 c3] = textread('NameTitleAuthors.txt','%s %s %s','delimiter',';');
StrArray=struct('Name',c1,'Title',c2,'Authors',c3);


    






