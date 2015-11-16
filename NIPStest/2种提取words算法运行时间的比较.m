@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
tic
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
fclose('all');
str='[a-zA-Z]+';
words=regexpi(A,str,'match');
toc
时间已过 0.072132 秒。

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
tic
%加载数据中的docs_names
load('NIPS04~14.mat')
%如何将docs_names和后缀名合并
fname=strcat(docs_names,'.txt');
%方法2：批处理提取txt文档的words
for i=1:2
    fid=fopen(fname{i});
    while 1
    tline=fgets(fid);
    if ~ischar(tline)
        break;
    end
    text=[text,tline];
    end
end
fclose('all');
str='[a-zA-Z]+';
words=regexpi(text,str,'match');
toc
时间已过 0.121152 秒。
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@